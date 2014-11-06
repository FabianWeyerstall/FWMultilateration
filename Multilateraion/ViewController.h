//
//  ViewController.h
//  Multilateraion
//
//  Created by Fabian Weyerstall on 02.11.14.
//  Copyright (c) 2014 Fabian Weyerstall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBeacon.h"
#import <CoreLocation/CoreLocation.h>
#import "NSMutableArray_MutableArray.h"
#import "NavigationMapView.h"

@import CoreLocation;
@interface ViewController : UIViewController <CLLocationManagerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *positionLabel;
@property (strong, nonatomic) IBOutlet UILabel *bewertungsLabel;
@property (strong) NSMutableArray *beacons;
@property (strong, nonatomic) IBOutlet UISwitch *switchOutlet;

@property (strong, nonatomic) CLBeaconRegion *myBeaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet UILabel *iLabel;
@property (strong, nonatomic) IBOutlet UILabel *jLabel;
@property (strong, nonatomic) IBOutlet UILabel *labelDistanzen;
@property (strong, nonatomic) IBOutlet UIView *drawView;
@property (strong) NSMutableArray *mapArray;
@property (strong) NSMutableArray *mapArrayKleinster;
@property (strong)  NSMutableArray *scratchArray;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property CGPoint pointOfSmartphone;
@property CGFloat beaconDistance0, beaconDistance1, beaconDistance2, beaconDistance3, beaconDistance4, beaconDistance5;

@end

