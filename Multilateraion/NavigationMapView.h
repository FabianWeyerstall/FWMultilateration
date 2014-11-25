//
//  NavigationMapView.h
//  Multilateraion
//
//  Created by Fabian Weyerstall on 02.11.14.
//  Copyright (c) 2014 Fabian Weyerstall. All rights reserved.
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
