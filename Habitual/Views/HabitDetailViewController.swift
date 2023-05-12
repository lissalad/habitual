//
//  HabitDetailViewController.swift
//  Habitual
//
//  Created by Lissa on 5/9/23.
//

import UIKit

class HabitDetailViewController: UIViewController {
  
  var habit: Habit!
  var habitIndex: Int!
  
  private var persistence = PersistenceLayer()

  @IBOutlet weak var imageViewIcon: UIImageView!
  @IBOutlet weak var labelBestStreak: UILabel!
  @IBOutlet weak var labelStartingDate: UILabel!
  @IBOutlet weak var buttonAction: UIButton!
  @IBOutlet weak var labelTotalCompletions: UILabel!
  @IBOutlet weak var labelCurrentStreak: UILabel!
  
  
  override func viewWillAppear(_ animated: Bool){
      super.viewWillAppear(animated)
      updateUI()

}

  @IBAction func pressActionButton(_ sender: Any) {
    habit = persistence.markHabitAsCompleted(habitIndex)
    updateUI()
  }
  
  private func updateUI() {
      title = habit.title
      imageViewIcon.image = habit.selectedImage.image
      labelCurrentStreak.text = "\(habit.currentStreak) days"
      labelTotalCompletions.text = String(habit.numberOfCompletions)
      labelBestStreak.text = String(habit.bestStreak)
      labelStartingDate.text = habit.dateCreated.stringValue

      if habit.completedToday {
          buttonAction.setTitle("Completed for Today!", for: .normal)
      } else {
          buttonAction.setTitle("Mark as Completed", for: .normal)
      }
  }
}
