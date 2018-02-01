import UIKit

class AddWaiterViewController: UIViewController
{
    var restaurant: Restaurant?
    
    @IBOutlet weak var restaurantName: UITextField!
    @IBOutlet weak var waiterName: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if let restaurant = restaurant
        {
            restaurantName.text = restaurant.name
            restaurantName.isEnabled = false
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // Actions
    
    @IBAction func saveButtonTapped()
    {
        if let name = waiterName.text
        {
            WaiterManager.addWaiter(name: name)
            navigationController?.popViewController(animated: true)
        }
        else
        {
            // Display message
            print("Error - Name cant be null")
        }
    }
    
    @IBAction func cancelButtonTapped()
    {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
}
