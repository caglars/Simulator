//
//  CSAppDelegate.h
//  Simulator
//
//  Created by Caglar Sinayuc on 04/01/2014.
//  Copyright (c) 2014 cs. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CSDataLoader.h"

@interface CSAppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet NSPathControl *textFilePathControl;
    NSString *path;
    
    NSMutableArray *deltaXArray;
    NSMutableArray *deltaYArray;
    NSMutableArray *deltaZArray;
    NSMutableArray *blockDepthArray;
    NSMutableArray *initialPressureArray;
    NSMutableArray *porosityArray;
    NSMutableArray *permeabilityXArray;
    NSMutableArray *permeabilityYArray;
    NSMutableArray *permeabilityZArray;
    NSInteger dimensionValue;
    NSArray *numberOfBlocksArray;

}

@property (assign) IBOutlet NSWindow *window;

-(IBAction)browseButton:(id)sender;
-(IBAction)loadDataButton:(id)sender;

@end
