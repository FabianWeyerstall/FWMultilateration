//
//  NavigationMapView.h
//  BeaconNav
//
//  Created by Michael Krümmling on 18.03.14.
//  Copyright (c) 2014 Michael Krümmling. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <Foundation/Foundation.h>
#import "NSMutableArray_MutableArray.h"
#import <CoreLocation/CoreLocation.h>
#import "NavigationBeacon.h"

@interface NavigationMapView : UIView <CLLocationManagerDelegate, UITextFieldDelegate>
{

}
@property (strong) NSArray *beacons;


@end
