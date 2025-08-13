//
//  FavViewController.swift
//  TutorConnectApp
//
//  Created by Mythily Kalra on 8/12/25.
//

import UIKit
import NukeExtensions

class FavViewController: UIViewController, UITableViewDataSource {
    
    

    @IBOutlet weak var emptyFavLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var favoriteTutors: [Tutor] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Anything in the defer call is guaranteed to happen last
        defer {
            // Show the "Empty Favorites" label if there are no favorite movies
            emptyFavLabel.isHidden = !favoriteTutors.isEmpty
        }
        // 1.
        let tutors = Tutor.getTutors(forKey: Tutor.favoritesKey)
        // 2.
        self.favoriteTutors = tutors
        // 3.
        tableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteTutors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TutorCell", for: indexPath) as! TutorCell
        let tutor = favoriteTutors[indexPath.row]
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
        if let image = URL(string: tutor.profileImageUrl) {

            // Use the Nuke library's load image function to (async) fetch and load the image from the image url.
            NukeExtensions.loadImage(with: image, into: cell.profileImageView)
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }

        // Get the selected movie from the movies array using the selected index path's row
        let selectedTutor = favoriteTutors[selectedIndexPath.row]

        // Get access to the detail view controller via the segue's destination. (guard to unwrap the optional)
        guard let detailViewController = segue.destination as? DetailViewController else { return }

        detailViewController.tutor = selectedTutor
    }

}
