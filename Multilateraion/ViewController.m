//
//  ViewController.m
//  Multilateraion
//
//  Created by Fabian Weyerstall on 02.11.14.
//  Copyright (c) 2014 Fabian Weyerstall. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong) NavigationMapView *map;

@end

@implementation ViewController


@synthesize locationManager, myBeaconRegion, scratchArray,segmentedControl;


int counter = 0;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self  = [super initWithCoder:aDecoder];
    if(self) {
        _beacons = [[NSMutableArray alloc] init];
        
        counter++;
        // to calculate the distance --> my position should be CGPointMake(125.0, 175.0)
        
        // for real data the factor would be 50 --> because I simulate a room of 5m x 7m
        // --> one point is like 0.02m
        
        NavigationBeacon *beacons = [[NavigationBeacon alloc] init];
        beacons.proximityUUID = [[NSUUID alloc] initWithUUIDString:@"D1414625-7F9D-4944-A39F-E70FDF564C49"];
        beacons.major = [NSNumber numberWithInt:1];
        beacons.minor = [NSNumber numberWithInt:1];
        beacons.mapPosition = CGPointMake(0, 0);
        beacons.currentDistance = 212.0;
        [_beacons addObject:beacons];
        
        beacons = [[NavigationBeacon alloc] init];
        beacons.proximityUUID = [[NSUUID alloc] initWithUUIDString:@"D1414625-7F9D-4944-A39F-E70FDF564C49"];
        beacons.major = [NSNumber numberWithInt:1];
        beacons.minor = [NSNumber numberWithInt:2];
        beacons.mapPosition = CGPointMake(1.5, 0.0);
        beacons.currentDistance = 150.0;
        [_beacons addObject:beacons];
        
        beacons = [[NavigationBeacon alloc] init];
        beacons.proximityUUID = [[NSUUID alloc] initWithUUIDString:@"D1414625-7F9D-4944-A39F-E70FDF564C49"];
        beacons.major = [NSNumber numberWithInt:1];
        beacons.minor = [NSNumber numberWithInt:3];
        beacons.mapPosition = CGPointMake(3.0, 0.0);
        beacons.currentDistance = 212.0;
        [_beacons addObject:beacons];
        
        beacons = [[NavigationBeacon alloc] init];
        beacons.proximityUUID = [[NSUUID alloc] initWithUUIDString:@"D1414625-7F9D-4944-A39F-E70FDF564C49"];
        beacons.major = [NSNumber numberWithInt:1];
        beacons.minor = [NSNumber numberWithInt:4];
        beacons.mapPosition = CGPointMake(0.0, 3.0);
        beacons.currentDistance = 212.0;
        [_beacons addObject:beacons];
        
        
        beacons = [[NavigationBeacon alloc] init];
        beacons.proximityUUID = [[NSUUID alloc] initWithUUIDString:@"D1414625-7F9D-4944-A39F-E70FDF564C49"];
        beacons.major = [NSNumber numberWithInt:1];
        beacons.minor = [NSNumber numberWithInt:5];
        beacons.mapPosition = CGPointMake(1.5, 3.0);
        beacons.currentDistance = 150.0;
        [_beacons addObject:beacons];
        
        
        beacons = [[NavigationBeacon alloc] init];
        beacons.proximityUUID = [[NSUUID alloc] initWithUUIDString:@"D1414625-7F9D-4944-A39F-E70FDF564C49"];
        beacons.major = [NSNumber numberWithInt:1];
        beacons.minor = [NSNumber numberWithInt:6];
        beacons.mapPosition = CGPointMake(3.0, 3.0);
        beacons.currentDistance = 212.0;
        [_beacons addObject:beacons];
        
        
    }
    
    return self;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Initialisieren des LocationManagers und setzen des delegates auf uns selbst.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestAlwaysAuthorization];
    
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"D1414625-7F9D-4944-A39F-E70FDF564C49"];
    self.myBeaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                           
                                                             identifier:[uuid UUIDString]];
    
    [self.locationManager startRangingBeaconsInRegion:self.myBeaconRegion];
    
    // Fesstellen ob für dieses Gerät eine Überwachung möglich ist.
    if (![CLLocationManager isMonitoringAvailableForClass:[CLBeaconRegion class]]) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Monitoring not available" message:nil delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil]; [alert show]; return;
    }
    
    
    _map = [[NavigationMapView alloc] initWithFrame:CGRectMake(
                                                               (self.view.frame.size.width - 300) / 2.0,
                                                               (self.view.frame.size.height ) / 2.0,
                                                               300,
                                                               300
                                                               )];
    [self.view addSubview:_map];
    
    // Create Label
    UILabel *myLabel1 = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 290) / 2.0,
                                                                 (self.view.frame.size.height ) / 2.0,
                                                                 10,
                                                                 10
                                                                 )];
    [myLabel1 setText:@"1"];
    [[self view] addSubview:myLabel1];
    
    // Create Label
    UILabel *myLabel2 = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 185),
                                                                 (self.view.frame.size.height ) / 2.0,
                                                                 10,
                                                                 10
                                                                 )];
    [myLabel2 setText:@"2"];
    [[self view] addSubview:myLabel2];
    
    // Create Label
    UILabel *myLabel3 = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width -60),
                                                                 (self.view.frame.size.height ) / 2.0,
                                                                 10,
                                                                 10
                                                                 )];
    [myLabel3 setText:@"3"];
    [[self view] addSubview:myLabel3];
    
    // Create Label
    UILabel *myLabel4 = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 290) / 2.0,
                                                                 (self.view.frame.size.height +575 )/2.0,
                                                                 10,
                                                                 10
                                                                 )];
    [myLabel4 setText:@"4"];
    [[self view] addSubview:myLabel4];
    // Create Label
    UILabel *myLabel5 = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 185),
                                                                 (self.view.frame.size.height +575 )/2.0,
                                                                 10,
                                                                 10
                                                                 )];
    [myLabel5 setText:@"5"];
    [[self view] addSubview:myLabel5];
    
    // Create Label
    UILabel *myLabel6 = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 60),
                                                                 (self.view.frame.size.height +575 )/2.0,
                                                                 10,
                                                                 10
                                                                 )];
    [myLabel6 setText:@"6"];
    [[self view] addSubview:myLabel6];
    counter++;
    
}




#pragma mark -BeaconHandling

-(void) locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
    
    counter = 0;
    //  NSLog(@"Gefunden");
    NSMutableArray *availableBeacons = [[NSMutableArray alloc] init];
    for(CLBeacon *beacon in beacons)
    {
        
        
        NavigationBeacon *navBeacon = [self getTrackedBeaconFor:beacon];
        if(navBeacon){
            navBeacon.currentDistance =  beacon.accuracy;
            
            [availableBeacons addObject:navBeacon];
            // NSLog(@"%@", availableBeacons);
            //   [self.view addSubview:_map];
            //  NSLog(@"navBeacons %@", navBeacon);
            
            
        }
    }
    
    NSMutableArray *result1 = [self addBeacon:((NavigationBeacon *)_beacons[0]).mapPosition withRadius:((NavigationBeacon *)_beacons[0]).currentDistance andSizeResult:9];
    NSMutableArray *result3 = [self addBeacon:((NavigationBeacon *)_beacons[2]).mapPosition withRadius:((NavigationBeacon *)_beacons[2]).currentDistance andSizeResult:9];
    NSMutableArray *result5 = [self addBeacon:((NavigationBeacon *)_beacons[4]).mapPosition withRadius:((NavigationBeacon *)_beacons[4]).currentDistance andSizeResult:9];
    
    NSMutableArray *result2 = [self addBeacon:((NavigationBeacon *)_beacons[1]).mapPosition withRadius:((NavigationBeacon *)_beacons[1]).currentDistance andSizeResult:9];
    NSMutableArray *result4 = [self addBeacon:((NavigationBeacon *)_beacons[3]).mapPosition withRadius:((NavigationBeacon *)_beacons[3]).currentDistance andSizeResult:9];
    NSMutableArray *result6 = [self addBeacon:((NavigationBeacon *)_beacons[5]).mapPosition withRadius:((NavigationBeacon *)_beacons[5]).currentDistance andSizeResult:9];
    
    
    //    NSMutableArray *result1 = [self addBeacon:CGPointMake(0, 0) withRadius:2.12 andSizeResult:9];
    //    NSMutableArray *result2 = [self addBeacon:CGPointMake(1.5, 0) withRadius:1.5 andSizeResult:9];
    //    NSMutableArray *result3 = [self addBeacon:CGPointMake(3.0, 0) withRadius:2.12 andSizeResult:9];
    //
    //    NSMutableArray *result4 = [self addBeacon:CGPointMake(0, 3.0) withRadius:2.21 andSizeResult:9];
    //    NSMutableArray *result5 = [self addBeacon:CGPointMake(1.5, 3.0) withRadius:1.50 andSizeResult:9];
    //    NSMutableArray *result6 = [self addBeacon:CGPointMake(3.0, 3.0) withRadius:2.12 andSizeResult:9];
    NSMutableArray *resultAllEnd = nil;
    
    if(segmentedControl.selectedSegmentIndex == 0) {
        NSMutableArray *resultAll12 = [self addNewBeaconArray:result1 withNewBeaconArray:result3 andSizeResult:9];
        resultAllEnd = [self addNewBeaconArray:resultAll12 withNewBeaconArray:result5 andSizeResult:9];
        _beaconDistance0 = ((NavigationBeacon *)_beacons[0]).currentDistance;
         _beaconDistance1= ((NavigationBeacon *)_beacons[1]).currentDistance = 0.0;
        _beaconDistance2= ((NavigationBeacon *)_beacons[2]).currentDistance;
        _beaconDistance3= ((NavigationBeacon *)_beacons[3]).currentDistance = 0.0;
        _beaconDistance4= ((NavigationBeacon *)_beacons[4]).currentDistance;
         _beaconDistance5= ((NavigationBeacon *)_beacons[5]).currentDistance = 0.0;
    
    } else if(segmentedControl.selectedSegmentIndex == 1) {
        NSMutableArray *resultAll12 = [self addNewBeaconArray:result1 withNewBeaconArray:result3 andSizeResult:9];
        NSMutableArray *resultAll12p3 = [self addNewBeaconArray:resultAll12 withNewBeaconArray:result5 andSizeResult:9];
        resultAllEnd = [self addNewBeaconArray:resultAll12p3 withNewBeaconArray:result2 andSizeResult:9];
        _beaconDistance0 = ((NavigationBeacon *)_beacons[0]).currentDistance;
        _beaconDistance1= ((NavigationBeacon *)_beacons[1]).currentDistance;
        _beaconDistance2= ((NavigationBeacon *)_beacons[2]).currentDistance;
        _beaconDistance3= ((NavigationBeacon *)_beacons[3]).currentDistance = 0.0;
        _beaconDistance4= ((NavigationBeacon *)_beacons[4]).currentDistance;
        _beaconDistance5= ((NavigationBeacon *)_beacons[5]).currentDistance = 0.0;
    } else if(segmentedControl.selectedSegmentIndex == 2) {
        NSMutableArray *resultAll12 = [self addNewBeaconArray:result1 withNewBeaconArray:result3 andSizeResult:9];
        NSMutableArray *resultAll12p3 = [self addNewBeaconArray:resultAll12 withNewBeaconArray:result5 andSizeResult:9];
        NSMutableArray *resultAll12p3p4 = [self addNewBeaconArray:resultAll12p3 withNewBeaconArray:result2 andSizeResult:9];
       resultAllEnd = [self addNewBeaconArray:resultAll12p3p4 withNewBeaconArray:result4 andSizeResult:9];
        _beaconDistance0 = ((NavigationBeacon *)_beacons[0]).currentDistance;
        _beaconDistance1= ((NavigationBeacon *)_beacons[1]).currentDistance;
        _beaconDistance2= ((NavigationBeacon *)_beacons[2]).currentDistance;
        _beaconDistance3= ((NavigationBeacon *)_beacons[3]).currentDistance;
        _beaconDistance4= ((NavigationBeacon *)_beacons[4]).currentDistance;
        _beaconDistance5= ((NavigationBeacon *)_beacons[5]).currentDistance = 0.0;
    } else if(segmentedControl.selectedSegmentIndex == 3) {
        NSMutableArray *resultAll12 = [self addNewBeaconArray:result1 withNewBeaconArray:result3 andSizeResult:9];
        NSMutableArray *resultAll12p3 = [self addNewBeaconArray:resultAll12 withNewBeaconArray:result5 andSizeResult:9];
        NSMutableArray *resultAll12p3p4 = [self addNewBeaconArray:resultAll12p3 withNewBeaconArray:result2 andSizeResult:9];
        NSMutableArray *resultAll12p3p4p5 = [self addNewBeaconArray:resultAll12p3p4 withNewBeaconArray:result4 andSizeResult:9];
        resultAllEnd = [self addNewBeaconArray:resultAll12p3p4p5 withNewBeaconArray:result6 andSizeResult:9];
        _beaconDistance0 = ((NavigationBeacon *)_beacons[0]).currentDistance;
        _beaconDistance1= ((NavigationBeacon *)_beacons[1]).currentDistance;
        _beaconDistance2= ((NavigationBeacon *)_beacons[2]).currentDistance;
        _beaconDistance3= ((NavigationBeacon *)_beacons[3]).currentDistance;
        _beaconDistance4= ((NavigationBeacon *)_beacons[4]).currentDistance;
        _beaconDistance5= ((NavigationBeacon *)_beacons[5]).currentDistance;
    } else{
        NSMutableArray *resultAll12 = [self addNewBeaconArray:result1 withNewBeaconArray:result3 andSizeResult:9];
        NSMutableArray *resultAll12p3 = [self addNewBeaconArray:resultAll12 withNewBeaconArray:result5 andSizeResult:9];
        NSMutableArray *resultAll12p3p4 = [self addNewBeaconArray:resultAll12p3 withNewBeaconArray:result2 andSizeResult:9];
        NSMutableArray *resultAll12p3p4p5 = [self addNewBeaconArray:resultAll12p3p4 withNewBeaconArray:result4 andSizeResult:9];
        resultAllEnd = [self addNewBeaconArray:resultAll12p3p4p5 withNewBeaconArray:result6 andSizeResult:9];
        _beaconDistance0 = ((NavigationBeacon *)_beacons[0]).currentDistance;
        _beaconDistance1= ((NavigationBeacon *)_beacons[1]).currentDistance;
        _beaconDistance2= ((NavigationBeacon *)_beacons[2]).currentDistance;
        _beaconDistance3= ((NavigationBeacon *)_beacons[3]).currentDistance;
        _beaconDistance4= ((NavigationBeacon *)_beacons[4]).currentDistance;
        _beaconDistance5= ((NavigationBeacon *)_beacons[5]).currentDistance;
    }
    
    
    NSMutableArray *result = resultAllEnd;
    
    result = [self glaetten:result mit:9];
    result = [self glaetten:result mit:9];
    result = [self glaetten:result mit:9];
    
    
    int scratchI = 0;
    int scratchJ = 0;
    scratchArray = 0;
    
    for (int i=0; i<450; i++) {
        for (int j=0; j<450; j++) {
            if (result[i][j] > scratchArray){
                scratchI = i;
                scratchJ = j;
                scratchArray = result[i][j];
                counter++;
            }
            
        }
    }
    _mapArray = result;
    double resultX = scratchI/50.0-3.0;
    double resultY = scratchJ/50.0-3.0;
    
    //   NSLog(@"Bewertung: %@  i:%d, j:%d, x:%f, y:%f", scratchArray, scratchI, scratchJ, resultX, resultY);
    
    _positionLabel.text = [NSString stringWithFormat:@"X: %.2f, Y: %.2f", resultX, resultY];
    _bewertungsLabel.text = [NSString stringWithFormat:@"%@", scratchArray];
    _iLabel.text =[NSString stringWithFormat:@"I: %d, J: %d", scratchI, scratchJ];
    // _jLabel.text =[NSString stringWithFormat:@"%d", scratchJ];
    _labelDistanzen.text = [NSString stringWithFormat:@"1: %.2f, 2: %.2f, 3: %.2f,\n4: %.2f, 5: %.2f, 6: %.2f,",  ((NavigationBeacon *)_beacons[0]).currentDistance, ((NavigationBeacon *)_beacons[1]).currentDistance, ((NavigationBeacon *)_beacons[2]).currentDistance, ((NavigationBeacon *)_beacons[3]).currentDistance, ((NavigationBeacon *)_beacons[4]).currentDistance, ((NavigationBeacon *)_beacons[5]).currentDistance];
    
    //    [_map drawPosition:resultX and:resultY];
    _pointOfSmartphone = CGPointMake(resultX, resultY);
    
    
    _beaconDistance0 = ((NavigationBeacon *)_beacons[0]).currentDistance;
    _beaconDistance1= ((NavigationBeacon *)_beacons[1]).currentDistance;
    _beaconDistance2= ((NavigationBeacon *)_beacons[2]).currentDistance;
    _beaconDistance3= ((NavigationBeacon *)_beacons[3]).currentDistance;
    _beaconDistance4= ((NavigationBeacon *)_beacons[4]).currentDistance;
    _beaconDistance5= ((NavigationBeacon *)_beacons[5]).currentDistance;
    [_map setNeedsDisplay];
    counter++;
    //NSLog(@"Counter: %i", counter);
    
    
    
}

- (NavigationBeacon*) getTrackedBeaconFor:(CLBeacon *) beacon
{
    for (NavigationBeacon *navBeacon in _beacons) {
        if ([navBeacon.proximityUUID isEqual:beacon.proximityUUID] &&
            [navBeacon.major isEqualToNumber:beacon.major] &&
            [navBeacon.minor isEqualToNumber:beacon.minor] ) {
            return navBeacon;
        }
    }
    return nil;
}






#pragma Tri/Mulitlateraiton




-(NSMutableArray*)addBeacon:(CGPoint)a withRadius:(CGFloat)radius andSizeResult:(int)sizeResult {
    
    a.x = a.x +3;
    a.y = a.y+3;
    double raster = 50;
    double steps = 4/raster;
    int sizeResultScratch = sizeResult*raster;
    
    NSMutableArray *muteArray = [NSMutableArray mutableNullArraysWithVisualFormat:[NSString stringWithFormat:@"[%d][%d]", sizeResultScratch, sizeResultScratch]];
    
    for (int i=0; i<sizeResultScratch; i++) {
        for (int j=0; j<sizeResultScratch; j++) {
            counter++;
            double x = i/raster;
            double y = j/raster;
            
            double XB  = pow((x-a.x),(2.0));
            double YB  = pow((y-a.y),(2.0));
            double sqrtXY = sqrt((XB)+(YB));
            double radiusXY = radius - sqrtXY;
            double z = fabs(radiusXY);
            
            if (z < 1*steps) {
                muteArray[i][j] = [NSNumber numberWithInt:10];
            }
            else if (z < 2*steps){
                muteArray[i][j] =[NSNumber numberWithInt:9]; }
            else if (z < 3*steps){
                muteArray[i][j] =[NSNumber numberWithInt:8]; }
            else if (z < 4*steps){
                muteArray[i][j] =[NSNumber numberWithInt:7]; }
            else if (z < 5*steps){
                muteArray[i][j] =[NSNumber numberWithInt:6]; }
            else if (z < 6*steps){
                muteArray[i][j] =[NSNumber numberWithInt:5]; }
            else if (z < 7*steps){
                muteArray[i][j] =[NSNumber numberWithInt:4]; }
            else if (z < 8*steps){
                muteArray[i][j] =[NSNumber numberWithInt:3]; }
            else if (z < 9*steps){
                muteArray[i][j] =[NSNumber numberWithInt:2]; }
            else if (z < 10*steps){
                muteArray[i][j] =[NSNumber numberWithInt:1]; }
            else {
                muteArray[i][j] =[NSNumber numberWithInt:0]; }
        }
        
        
    }
    return muteArray;
}

-(NSMutableArray*)addNewBeaconArray:(NSMutableArray*)old withNewBeaconArray:(NSMutableArray*)new andSizeResult:(int)sizeResult
{
    
    double raster = 50;
    int sizeResultScratch = sizeResult*raster;
    NSMutableArray *newArray = [NSMutableArray mutableNullArraysWithVisualFormat:[NSString stringWithFormat:@"[%d][%d]", sizeResultScratch, sizeResultScratch]];
    for (int i=0; i<sizeResultScratch; i++) {
        for (int j=0; j<sizeResultScratch; j++) {
            counter++;
            newArray[i][j] = [NSNumber numberWithInt:([old[i][j] intValue]  + [new[i][j] intValue])] ;
        }
    }
    return newArray;
}

-(NSMutableArray*)glaetten:(NSMutableArray*)result mit:(int)sizeResult {
    
    double raster = 50;
    int sizeResultScratch = sizeResult*raster;
    
    NSMutableArray *newArray = [NSMutableArray mutableNullArraysWithVisualFormat:[NSString stringWithFormat:@"[%d][%d]", sizeResultScratch, sizeResultScratch]];
    
    for (int i=0; i<sizeResultScratch; i++) {
        for (int j=0; j<sizeResultScratch; j++) {
            counter++;
            if ((i < 1 && j< 1)) {
                newArray[i][j] = result[i][j];
                //   NSLog(@"i:%d J:%d ", i, j);
            }
            else if ((i > 1) && (i < sizeResultScratch-1) && (j > 1) && (j < sizeResultScratch-1)) {
                //  NSLog(@"i:%d J:%d ", i, j);
                newArray[i][j] = [NSNumber numberWithInt:(([result[i-1][j-1] intValue] +
                                                           [result[i-1][j] intValue]+
                                                           [result[i-1][j+1] intValue]+
                                                           [result[i][j-1] intValue]+
                                                           [result[i][j] intValue]+
                                                           [result[i][j+1] intValue]+
                                                           [result[i+1][j-1] intValue]+
                                                           [result[i+1][j] intValue]+
                                                           [result[i+1][j+1] intValue]))];
            }
            else {
                newArray[i][j] = result[i][j];
                //  NSLog(@"i:%d J:%d ", i, j);
            }
        }
    }
    return newArray;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
