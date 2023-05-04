import UIKit

class HabitsTableViewController: UITableViewController {
  
  var habits: [Habit] = [
      Habit(title: "Go to bed before 10pm", image: .book),
      Habit(title: "Drink 8 Glasses of Water", image: .drop),
      Habit(title: "Commit Today", image: .code),
      Habit(title: "Stand up every Hour", image: .gym)
  ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
      tableView.register(
        HabitTableViewCell.nib,
        forCellReuseIdentifier: HabitTableViewCell.identifier
      )
    }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell( withIdentifier: HabitTableViewCell.identifier, for: indexPath) as! HabitTableViewCell
    let habit = habits[indexPath.row]
    cell.configure(habit) // Shows an error, you'll fix this next!
    return cell
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return habits.count
  }
  
}

extension HabitsTableViewController {
    func setupNavBar() {
        title = "Habitual" // Add a title to the nav bar
        // Create a UIBarButtonItem
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pressAddHabit(_:)))
        // Add the barbuttonitem to the navbar
        navigationItem.rightBarButtonItem = addButton
    }

  @objc func pressAddHabit(_ sender: UIBarButtonItem) {
      habits.insert(Habit(title: "New Habit",  image: .other), at: 0) // add a new habit
      let topIndexPath = IndexPath(row: 0, section: 0)
      tableView.insertRows(at: [topIndexPath], with: .automatic)
  }

}
