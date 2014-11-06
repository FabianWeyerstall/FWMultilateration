//
//  NavigationBeacon.h
//  BeaconNav
//
//  Created by Michael Krümmling on 18.03.14.
//  Copyright (c) 2014 Michael Krümmling. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavigationBeacon : NSObject

@property (nonatomic) CGPoint mapPosition;
@property (nonatomic) CGFloat currentDistance;

@property (nonatomic) CGPoint realPosition;

@property (nonatomic) NSUUID *proximityUUID;
@property (nonatomic) NSNumber *major;
@property (nonatomic) NSNumber *minor;

@end
