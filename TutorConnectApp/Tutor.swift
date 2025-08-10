//
//  Tutor.swift
//  TutorConnectApp
//
//  Created by Mythily Kalra on 8/9/25.
//

import Foundation


struct Tutor: Codable, Identifiable {
    let id: Int
    let name: String
    let profileImageUrl: String
    let subjects: [String]
    let bio: String
    let payRate: Double
    let location: String
    let university: String
    let highSchool: String
    let email: String
    let phone: String
    let availability: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profileImageUrl = "profile_image_url"
        case subjects
        case bio
        case payRate = "pay_rate"
        case location
        case university
        case highSchool = "high_school"
        case email
        case phone
        case availability
    }
}

// Methods for saving, retrieving, and removing tutors from favorites
extension Tutor {
    static var favoritesKey: String {
        return "Favorites"
    }
    static func save(_ tutors: [Tutor], forKey key: String) {
        let defaults = UserDefaults.standard
        let encodedData = try! JSONEncoder().encode(tutors)
        defaults.set(tutors, forKey: key)
        
    }
    static func getTutors(forKey key: String) -> [Tutor] {
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: key) {
            let decodedTutors = try! JSONDecoder().decode([Tutor].self, from: data)
            return decodedTutors
        } else {
            return []
        }
    }
    func addToFavorites() {
        var favoriteTutors = Tutor.getTutors(forKey: Tutor.favoritesKey)
        favoriteTutors.append(self)
        Tutor.save(favoriteTutors, forKey: Tutor.favoritesKey)
    }
    func removeFromFavorites() {
        var favoriteTutors = Tutor.getTutors(forKey: Tutor.favoritesKey)
        favoriteTutors.removeAll()  { tutor in
            tutor.id == self.id
        }
        Tutor.save(favoriteTutors, forKey: Tutor.favoritesKey)
    }
}
