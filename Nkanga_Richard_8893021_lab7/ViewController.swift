//
//  ViewController.swift
//  Nkanga_Richard_8893021_lab7
//
//  Created by Richard Nkanga on 13/07/2023.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
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


    var aManager = CLLocationManager()
    var maxSpeed: CLLocationSpeed = 0.0
    var previousLocation: CLLocation?


    override func viewDidLoad() {
        super.viewDidLoad()

        aManager.delegate = self
        aManager.desiredAccuracy = kCLLocationAccuracyBest
        aManager.requestAlwaysAuthorization()
        oMap.delegate = self


    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        oCurrentSpeed.text = "\(location.speed)km/h"

        let span = MKCoordinateSpan(latitudeDelta: 0.053, longitudeDelta: 0.05)
        let myLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: myLocation, span: span)
        oMap.setRegion(region, animated: true)


            //Gets and displays the maximum speed
            if (location.speed > maxSpeed) {
                maxSpeed = location.speed
                oMaxSpeed.text = "\(maxSpeed)km/h"
            }else{
                oMaxSpeed.text = "\(maxSpeed)km/h"
            }


            //Shoes the red bar when the user oes over the speed limit
            if (location.speed > 115) {
                oOverspeedingIndicator.backgroundColor = UIColor(red: 133/256, green: 50/256, blue: 60/256, alpha: 1.0)
            }else{
                oOverspeedingIndicator.backgroundColor = UIColor.clear
            }
        }




    //Button to start the trip and show the users location and other required informaton
    @IBAction func aStartTripButton(_ sender: UIButton) {



        oTripStatusIndicator.backgroundColor = UIColor(red: 127/256, green: 170/256, blue: 85/256, alpha: 1.0)

        aManager.startUpdatingLocation()
        oMap.showsUserLocation = true









    }

    //Button to end the trip and clear the information displayed on the screen
    @IBAction func aStopTripButton(_ sender: UIButton) {
        oTripStatusIndicator.backgroundColor = UIColor(red: 174/256, green: 174/256, blue: 178/256, alpha: 1.0)


        oCurrentSpeed.text = ""
        oMaxSpeed.text = ""
        oAverageSpeed.text = ""
        oDIstance.text = ""
        oMaxAcceleration.text = ""
        oOverspeedingIndicator.backgroundColor = UIColor.clear



        oMap.showsUserLocation = false
        aManager.stopUpdatingLocation()




    }

}

