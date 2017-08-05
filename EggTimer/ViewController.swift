import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var count = 210
    
    func updateCount() {
        count -= 1
        countingLabel.text = String(count)
        
        if(count == 0) {
            timer.invalidate()
        }
    }

    @IBAction func resetBtn(_ sender: Any) {
        timer.invalidate()
        count = 210
        countingLabel.text = String(count)
    }
    
    @IBAction func pauseBtn(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func playBtn(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateCount), userInfo: nil, repeats: true)
    }
    
    @IBAction func deductTenSecs(_ sender: Any) {
        if(count > 10) {
            count -= 10
            countingLabel.text = String(count)
        } else {
            count = 0
            countingLabel.text = String(count)
            timer.invalidate()
        }
        
        
    }
    
    @IBAction func addTenSecs(_ sender: Any) {
        count += 10
        countingLabel.text = String(count)
    }
    
    @IBOutlet weak var countingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        countingLabel.text = String(count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

