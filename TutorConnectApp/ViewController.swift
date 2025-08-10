//
//  ViewController.swift
//  TutorConnectApp
//
//  Created by Mythily Kalra on 8/8/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tutorsTableView: UITableView!
    
    private var tutors: [Tutor] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tutors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TutorCell", for: indexPath) as! TutorCell
        let tutor = tutors[indexPath.row]
        cell.nameLabel.text = tutor.name
        cell.uniLabel.text = tutor.university
        cell.highSchoolLabel.text = tutor.highSchool
        var subjectsString = " "
        for s in tutor.subjects {
            if s == tutor.subjects.last {
                subjectsString += s
            }
            else {
                subjectsString += s + ", "
            }
        }
        cell.subjectsLabel.text = subjectsString
        cell.payLabel.text = "  $\(tutor.payRate)/hr  "
//        if let image = URL(string: tutor.profileImageUrl) {
//
//            // Use the Nuke library's load image function to (async) fetch and load the image from the image url.
//            NukeExtensions.loadImage(with: image, into: cell.profileImageView)
//        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tutorsTableView.dataSource = self
        fetchTutors()
    }
    
    private func fetchTutors() {
        do {
            let fileURL = Bundle.main.url(forResource: "tutors", withExtension: "json")!
            let data = try! Data(contentsOf: fileURL)
            let tutors = try JSONDecoder().decode([Tutor].self, from: data)
            DispatchQueue.main.async { [weak self] in
                print("✅ We got \(tutors.count) tutor posts!")
                self?.tutors = tutors
                self?.tutorsTableView.reloadData()
            }
        }
        catch {
            print("❌ Error decoding JSON: \(error.localizedDescription)")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tutorsTableView.indexPathForSelectedRow else {
            return
        }
        let selectedTutor = tutors[selectedIndexPath.row]
        guard let detailViewController = segue.destination as? DetailViewController else {
            return
        }
        detailViewController.tutor = selectedTutor
    }


}

