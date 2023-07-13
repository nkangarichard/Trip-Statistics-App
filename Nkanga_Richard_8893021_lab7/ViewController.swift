//
//  ViewController.swift
//  Nkanga_Richard_8893021_lab7
//
//  Created by Richard Nkanga on 13/07/2023.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
// establishing connections between to the corresponding interface elements in the user interface.
    @IBOutlet weak var oCurrentSpeed: UILabel!
    @IBOutlet weak var oMaxSpeed: UILabel!
    @IBOutlet weak var oAverageSpeed: UILabel!
    @IBOutlet weak var oDIstance: UILabel!
    @IBOutlet weak var oMaxAcceleration: UILabel!
    
    @IBOutlet weak var oStarTripButton: UIButton!
    @IBOutlet weak var oStopTripButton: UIButton!

    @IBOutlet weak var oOverspeedingIndicator: UILabel!
    @IBOutlet weak var oTripStatusIndicator: UILabel!
    
    @IBOutlet weak var oMap: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func aStartTripButton(_ sender: UIButton) {


        oTripStatusIndicator.backgroundColor = UIColor(red: 127/256, green: 170/256, blue: 85/256, alpha: 1.0)


    }
    @IBAction func aStopTripButton(_ sender: UIButton) {
        oTripStatusIndicator.backgroundColor = UIColor(red: 174/256, green: 174/256, blue: 178/256, alpha: 1.0)
    }
    
}

