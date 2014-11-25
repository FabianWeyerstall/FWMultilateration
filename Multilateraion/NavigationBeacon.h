//
//  NavigationBeacon.h
//  Multilateraion
//
//  Created by Fabian Weyerstall on 02.11.14.
//  Copyright (c) 2014 Fabian Weyerstall. All rights reserved.
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
