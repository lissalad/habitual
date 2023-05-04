//
//  HabitTableViewCell.swift
//  Habitual
//
//  Created by Lissa on 5/4/23.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
  
  static let identifier = "HabitCell"
  static var nib: UINib {
    return UINib(nibName: String(describing: self), bundle: nil)
  }

  @IBOutlet weak var imageViewIcon: UIImageView!
  @IBOutlet weak var labelHabitTitle: UILabel!
  @IBOutlet weak var labelStreaks: UILabel!
  
  


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
  
  func configure(_ habit: Habit) {
    self.imageViewIcon.image = habit.selectedImage.image
    self.labelHabitTitle.text = habit.title
    self.labelStreaks.text = "streak: \(habit.currentStreak)"

    if habit.completedToday {
      self.accessoryType = .checkmark
    } else {
      self.accessoryType = .disclosureIndicator
    }
  }
    
}
