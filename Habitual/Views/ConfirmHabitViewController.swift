//
//  ConfirmHabitViewController.swift
//  Habitual
//
//  Created by Lissa on 5/7/23.
//

import UIKit

class ConfirmHabitViewController: UIViewController {
  var habitImage: Habit.Images!

  @IBOutlet weak var habitImageView: UIImageView!
  @IBOutlet weak var habitNameInputField: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  private func updateUI() {
      title = "New Habit"
      habitImageView.image = habitImage.image
  }
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      updateUI()
  }

  @IBAction func createHabitButtonPressed(_ sender: Any) {
      var persistenceLayer = PersistenceLayer()
      guard let habitText = habitNameInputField.text else { return }
      
      persistenceLayer.createNewHabit(name: habitText, image: habitImage)
      self.presentingViewController?.dismiss(animated: true, completion: nil)
  }

}
