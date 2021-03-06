import UIKit

class ShiftViewController: UITableViewController
{
    var waiter: Waiter?
    var shifts = [Shift]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let waiter = waiter
        {
            self.title = "\(waiter.name!)'s Shifts"
        }
    }

    override func viewDidAppear(_ animated: Bool)
    {
        self.updateTable()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shifts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if shifts.count > 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShiftCell", for: indexPath)
            let shift = shifts[indexPath.row]
            cell.textLabel?.text = shift.day
            cell.detailTextLabel?.text = shift.getFullDateDescription()
            return cell
        }
        
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if (editingStyle == UITableViewCellEditingStyle.delete)
        {
            if let waiter = self.waiter
            {
                if shifts.count > 0
                {
                    let shift = shifts[indexPath.row]
                    
                    let deleteShift = ShiftManager.delete(waiter: waiter, shift: shift)
                    
                    if deleteShift.error
                    {
                        MessageManager.displayErrorMessage(vc: self, message: deleteShift.message)
                    }
                    else
                    {
                        MessageManager.displaySimpleMessage(vc: self, title: nil, message: deleteShift.message)
                        self.updateTable()
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let waiter = self.waiter
        {
            if segue.identifier == "NewShiftSegue"
            {
                let vc = segue.destination as! AddShitViewController
                vc.waiter = waiter
            }
        }
    }
    
    func updateTable()
    {
        if let waiter = waiter
        {
            let result = ShiftManager.selectAll(waiter: waiter)
            
            if let allShifs = result
            {
                self.shifts = allShifs
                self.tableView.reloadData()
            }
        }
    }


}
