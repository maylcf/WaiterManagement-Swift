import UIKit

class AddShitViewController: UIViewController
{
    let weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var selectedDay: String?
    
    @IBOutlet weak var dayPickerView: UIPickerView!
    @IBOutlet weak var startTimePickerView: UIDatePicker!
    @IBOutlet weak var endTimePickerView: UIDatePicker!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveButtonTapped()
    {
        let startTime = startTimePickerView.date
        let endTime = endTimePickerView.date
        
        print("Selected Day:" + selectedDay!)
        // Add Shift
    }
    
    @IBAction func cancelButtonTapped()
    {
        navigationController?.popViewController(animated: true)
    }
}

extension AddShitViewController: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return self.weekDays.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.weekDays[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        self.selectedDay = self.weekDays[row] as String
    }
    
}
