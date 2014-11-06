//
//  NavigationMapView.m
//  BeaconNav
//
//  Created by Michael Krümmling on 18.03.14.
//  Copyright (c) 2014 Michael Krümmling. All rights reserved.
//

#import "NavigationMapView.h"

#import "ViewController.h"

@implementation NavigationMapView
{
   }

bool schein = false;
bool hintergundfarbe = true;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}


- (CGRect) createRect:(CGPoint) point
{
    CGRect rect = CGRectMake(point.x - 5.0, point.y - 5.0, 5.0, 5.0);
    return rect;
}

- (CGRect) createRectPOS:(CGPoint) point
{
    CGRect rect = CGRectMake(point.x - 5.0, point.y - 5.0, 10.0, 10.0);
    return rect;
}


#pragma Paint :)



- (void)drawRect:(CGRect)rect
{

    CGContextRef context = UIGraphicsGetCurrentContext();
    
   
    
    
    
    
       ViewController *vc = (ViewController *) [[[UIApplication sharedApplication] keyWindow] rootViewController];
    if(vc.switchOutlet.isOn) {
        hintergundfarbe = true;
        schein = false;
    }
    else {
        hintergundfarbe = false;
        schein = true;
    }
        
    
    if (hintergundfarbe) {
    NSString *string = [NSString stringWithFormat:@"%@", vc.scratchArray];
    
    int irgendwas = [string intValue] / 10;
        //NSLog(@"%i", irgendwas);
    for (int i=150; i<300; i++) {
        for (int j=150; j<300; j++) {
            
            if (vc.mapArray[i][j] > [NSNumber numberWithInt:(irgendwas*9)]) {
                
                [[UIColor redColor] setFill];
                CGContextAddEllipseInRect(context, CGRectMake((i-150)*2, (j-150)*2, 4.0, 4.0));
                CGContextFillPath(context);
            }
            else if (vc.mapArray[i][j] > [NSNumber numberWithInt:(irgendwas*8)]){
                
                [[UIColor colorWithRed:255 green:127 blue:0 alpha:1.0] setFill];
                CGContextAddEllipseInRect(context, CGRectMake((i-150)*2, (j-150)*2, 4.0, 4.0));
                CGContextFillPath(context);
            }
            else if (vc.mapArray[i][j] > [NSNumber numberWithInt:(irgendwas*7)]){
                
                [[UIColor colorWithRed:255 green:255 blue:0 alpha:1.0] setFill];
                CGContextAddEllipseInRect(context, CGRectMake((i-150)*2, (j-150)*2, 4.0, 4.0));
                CGContextFillPath(context);
            }
            else if (vc.mapArray[i][j] > [NSNumber numberWithInt:(irgendwas*6)]){
                
                [[UIColor colorWithRed:127 green:255 blue:0 alpha:1.0] setFill];
                CGContextAddEllipseInRect(context, CGRectMake((i-150)*2, (j-150)*2, 4.0, 4.0));
                CGContextFillPath(context);
            }else if (vc.mapArray[i][j] > [NSNumber numberWithInt:(irgendwas*5)]){
                
                [[UIColor colorWithRed:0 green:255 blue:0 alpha:1.0] setFill];
                CGContextAddEllipseInRect(context, CGRectMake((i-150)*2, (j-150)*2, 4.0, 4.0));
                CGContextFillPath(context);
            } else if (vc.mapArray[i][j] > [NSNumber numberWithInt:(irgendwas*4)]){
                
                [[UIColor colorWithRed:0 green:255 blue:127 alpha:1.0] setFill];
                CGContextAddEllipseInRect(context, CGRectMake((i-150)*2, (j-150)*2, 4.0, 4.0));
                CGContextFillPath(context);
            } else if (vc.mapArray[i][j] > [NSNumber numberWithInt:(irgendwas*4)]){
                
                [[UIColor colorWithRed:0 green:255 blue:255 alpha:1.0] setFill];
                CGContextAddEllipseInRect(context, CGRectMake((i-150)*2, (j-150)*2, 4.0, 4.0));
                CGContextFillPath(context);
            } else if (vc.mapArray[i][j] > [NSNumber numberWithInt:(irgendwas*2)]){
                
                [[UIColor colorWithRed:0 green:0 blue:255 alpha:1.0] setFill];
                CGContextAddEllipseInRect(context, CGRectMake((i-150)*2, (j-150)*2, 4.0, 4.0));
                CGContextFillPath(context);
            } else if (vc.mapArray[i][j] > [NSNumber numberWithInt:(irgendwas)]){
                
                [[UIColor colorWithRed:0 green:0 blue:255 alpha:1.0] setFill];
                CGContextAddEllipseInRect(context, CGRectMake((i-150)*2, (j-150)*2, 4.0, 4.0));
                CGContextFillPath(context);
            } else {
                
                [[UIColor colorWithRed:0 green:0 blue:255 alpha:1.0] setFill];
                CGContextAddEllipseInRect(context, CGRectMake((i-150)*2, (j-150)*2, 4.0, 4.0));
                CGContextFillPath(context);
            }
            
        }
    }
    }
    
    
   
    CGFloat lineWidth = 2;
    
    CGRect borderRect = CGRectMake(0, 0, 5.0, 5.0); //1
    borderRect = CGRectInset(borderRect, lineWidth, lineWidth);
    
    CGContextSetRGBStrokeColor(context, 255.0/255.0, 0.0/255.0, 0.0/255.0, 1.0);
    CGContextSetLineWidth(context, (vc.beaconDistance0*100*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    
    
    if (schein) {
    //Schein
    CGContextSetRGBStrokeColor(context, 255.0/255.0, 127.0/255.0, 0.0/255.0, 1.0);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*99.5))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
        
    CGContextSetRGBStrokeColor(context, 255.0/255.0, 127.0/255.0, 0.0/255.0, 1.0);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*100.5))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);

    CGContextSetRGBStrokeColor(context, 255.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*99))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    CGContextSetRGBStrokeColor(context, 255.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*101))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    
    CGContextSetRGBStrokeColor(context, 127.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
   CGContextSetLineWidth(context, (((vc.beaconDistance0*98.5))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    CGContextSetRGBStrokeColor(context, 127.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*101.5))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    
    CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*98))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*102))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    
    CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 127.0/255.0, 0.8);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*97.5))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 127.0/255.0, 0.8);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*102.5))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    
    CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 255.0/255.0, 0.8);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*97))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 255.0/255.0, 0.8);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*103))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    
    CGContextSetRGBStrokeColor(context, 0.0/255.0, 127.0/255.0, 255.0/255.0, 0.8);
CGContextSetLineWidth(context, (((vc.beaconDistance0*96.5))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    CGContextSetRGBStrokeColor(context, 0.0/255.0, 127.0/255.0, 255.0/255.0, 0.8);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*103.5))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    
    CGContextSetRGBStrokeColor(context, 0.0/255.0, 0.0/255.0, 255.0/255.0, 0.8);
CGContextSetLineWidth(context, (((vc.beaconDistance0*96))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    CGContextSetRGBStrokeColor(context, 0.0/255.0, 0.0/255.0, 255.0/255.0, 0.8);
    CGContextSetLineWidth(context, (((vc.beaconDistance0*104))*2));
    CGContextFillEllipseInRect (context, borderRect);
    CGContextStrokeEllipseInRect(context, borderRect);
    }
    CGContextFillPath(context);
    
    
    
    
    
    
    CGRect borderRect1 = CGRectMake(145, 0, 5.0, 5.0); //2
    borderRect1 = CGRectInset(borderRect1, lineWidth, lineWidth);
    CGContextSetRGBStrokeColor(context, 255.0/255.0, 0.0/255.0, 0.0/255.0, 1.0);
    CGContextSetLineWidth(context, (vc.beaconDistance1*100*2));
    CGContextFillEllipseInRect (context, borderRect1);
    CGContextStrokeEllipseInRect(context, borderRect1);
   
    if (schein) {
        //Schein
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 127.0/255.0, 0.0/255.0, 1.0);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*99.5))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 127.0/255.0, 0.0/255.0, 1.0);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*100.5))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*99))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*101))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        
        CGContextSetRGBStrokeColor(context, 127.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*98.5))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        CGContextSetRGBStrokeColor(context, 127.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*101.5))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*98))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*102))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 127.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*97.5))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 127.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*102.5))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*97))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*103))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 127.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*96.5))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 127.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*103.5))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 0.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*96))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 0.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance1*104))*2));
        CGContextFillEllipseInRect (context, borderRect1);
        CGContextStrokeEllipseInRect(context, borderRect1);
    }
     CGContextFillPath(context);

    
    
    CGRect borderRect2 = CGRectMake(292.5, 0, 5.0, 5.0); //3
    borderRect2 = CGRectInset(borderRect2, lineWidth, lineWidth);
    CGContextSetRGBStrokeColor(context, 255.0/255.0, 0.0/255.0, 0.0/255.0, 1.0);
    CGContextSetLineWidth(context, (vc.beaconDistance2*100*2));
    CGContextFillEllipseInRect (context, borderRect2);
    CGContextStrokeEllipseInRect(context, borderRect2);
   
    if (schein) {
        //Schein
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 127.0/255.0, 0.0/255.0, 1.0);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*99.5))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 127.0/255.0, 0.0/255.0, 1.0);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*100.5))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*99))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*101))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        
        CGContextSetRGBStrokeColor(context, 127.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*98.5))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        CGContextSetRGBStrokeColor(context, 127.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*101.5))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*98))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*102))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 127.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*97.5))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 127.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*102.5))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*97))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*103))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 127.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*96.5))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 127.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*103.5))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 0.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*96))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 0.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance2*104))*2));
        CGContextFillEllipseInRect (context, borderRect2);
        CGContextStrokeEllipseInRect(context, borderRect2);
    }

    CGContextFillPath(context);
    
    
    
    CGRect borderRect3 = CGRectMake(0, 292.5, 5.0, 5.0); //4
    borderRect3 = CGRectInset(borderRect3, lineWidth, lineWidth);
    CGContextSetRGBStrokeColor(context, 255.0/255.0, 0.0/255.0, 0.0/255.0, 1.0);
    CGContextSetLineWidth(context, (vc.beaconDistance3*100*2));
    CGContextFillEllipseInRect (context, borderRect3);
    CGContextStrokeEllipseInRect(context, borderRect3);
    
    if (schein) {
        //Schein
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 127.0/255.0, 0.0/255.0, 1.0);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*99.5))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 127.0/255.0, 0.0/255.0, 1.0);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*100.5))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*99))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*101))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        
        CGContextSetRGBStrokeColor(context, 127.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*98.5))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        CGContextSetRGBStrokeColor(context, 127.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*101.5))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*98))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*102))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 127.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*97.5))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 127.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*102.5))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*97))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*103))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 127.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*96.5))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 127.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*103.5))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 0.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*96))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 0.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance3*104))*2));
        CGContextFillEllipseInRect (context, borderRect3);
        CGContextStrokeEllipseInRect(context, borderRect3);
    }
    CGContextFillPath(context);
    
    
    
    CGRect borderRect4 = CGRectMake(145, 292.5, 5.0, 5.0); //5
    borderRect4 = CGRectInset(borderRect4, lineWidth, lineWidth);
    CGContextSetRGBStrokeColor(context, 255.0/255.0, 0.0/255.0, 0.0/255.0, 1.0);
    CGContextSetLineWidth(context, (vc.beaconDistance4*100*2));
    CGContextFillEllipseInRect (context, borderRect4);
    CGContextStrokeEllipseInRect(context, borderRect4);
    
    if (schein) {
        //Schein
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 127.0/255.0, 0.0/255.0, 1.0);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*99.5))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 127.0/255.0, 0.0/255.0, 1.0);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*100.5))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*99))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*101))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        
        CGContextSetRGBStrokeColor(context, 127.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*98.5))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        CGContextSetRGBStrokeColor(context, 127.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*101.5))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*98))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*102))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 127.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*97.5))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 127.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*102.5))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*97))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*103))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 127.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*96.5))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 127.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*103.5))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 0.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*96))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 0.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance4*104))*2));
        CGContextFillEllipseInRect (context, borderRect4);
        CGContextStrokeEllipseInRect(context, borderRect4);
    }
    CGContextFillPath(context);

   
    
    
    CGRect borderRect5 = CGRectMake(292.5, 292.5, 5.0, 5.0); //6
    borderRect5 = CGRectInset(borderRect5, lineWidth, lineWidth);
    CGContextSetRGBStrokeColor(context, 255.0/255.0, 0.0/255.0, 0.0/255.0, 1.0);
    CGContextSetLineWidth(context, (vc.beaconDistance5*100*2));
    CGContextFillEllipseInRect (context, borderRect5);
    CGContextStrokeEllipseInRect(context, borderRect5);

    if (schein) {
        //Schein
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 127.0/255.0, 0.0/255.0, 1.0);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*99.5))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 127.0/255.0, 0.0/255.0, 1.0);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*100.5))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*99))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        CGContextSetRGBStrokeColor(context, 255.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*101))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        
        CGContextSetRGBStrokeColor(context, 127.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*98.5))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        CGContextSetRGBStrokeColor(context, 127.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*101.5))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*98))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 0.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*102))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 127.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*97.5))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 127.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*102.5))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*97))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 255.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*103))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 127.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*96.5))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 127.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*103.5))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 0.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*96))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
        CGContextSetRGBStrokeColor(context, 0.0/255.0, 0.0/255.0, 255.0/255.0, 0.8);
        CGContextSetLineWidth(context, (((vc.beaconDistance5*104))*2));
        CGContextFillEllipseInRect (context, borderRect5);
        CGContextStrokeEllipseInRect(context, borderRect5);
    }

    CGContextFillPath(context);
      [[UIColor whiteColor] setFill];
    CGContextAddEllipseInRect(context, [self createRect:CGPointMake(5, 5)]); //1
    CGContextAddEllipseInRect(context, [self createRect:CGPointMake(297.5, 5)]); //3
    CGContextAddEllipseInRect(context, [self createRect:CGPointMake(150.0, 297.5)]); //5
    
    CGContextAddEllipseInRect(context, [self createRect:CGPointMake(5, 297.5)]); //4
    CGContextAddEllipseInRect(context, [self createRect:CGPointMake(297.5, 297.5)]); //6
    CGContextAddEllipseInRect(context, [self createRect:CGPointMake(150.0, 5.)]); //2
    CGContextFillPath(context);

   
 [[UIColor blackColor] setFill];
    CGContextAddEllipseInRect(context, [self createRectPOS:CGPointMake((vc.pointOfSmartphone.x*100), (vc.pointOfSmartphone.y*100))]);
    CGContextFillPath(context);

 //   NSLog(@"%@", vc.mapArray);
    //NSLog(@"drawREct");

}






@end
