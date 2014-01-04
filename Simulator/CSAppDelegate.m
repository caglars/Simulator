//
//  CSAppDelegate.m
//  Simulator
//
//  Created by Caglar Sinayuc on 04/01/2014.
//  Copyright (c) 2014 cs. All rights reserved.
//

#import "CSAppDelegate.h"

@implementation CSAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSString *homePath = NSHomeDirectory();
    NSString *initialPath = [homePath stringByAppendingString:@"/Desktop"];
    [textFilePathControl setStringValue:initialPath];
    
}

-(IBAction)browseButton:(id)sender
{
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    NSArray *fileTypes = [[NSArray alloc] initWithObjects:@"txt", @"TXT", nil];
    
    [panel setDirectoryURL:[textFilePathControl URL]];
    [panel setFloatingPanel:YES];
    [panel setCanChooseFiles:YES];
    [panel setCanCreateDirectories:YES];
    [panel setAllowsMultipleSelection:NO];
    [panel setAllowedFileTypes:fileTypes];
    
    NSInteger clicked = [panel runModal];
    NSURL *url;
    
    if (clicked == NSFileHandlingPanelOKButton) {
        url = [panel URL];
        path = [url path];
    }
    
    [textFilePathControl setURL:url];
    

}



- (IBAction)loadDataButton:(id)sender
{
    
    CSDataLoader *dataLoader = [[CSDataLoader alloc] init];
    
    [dataLoader getInputFileFromPath:path];
    dimensionValue = [dataLoader getDimension];
    numberOfBlocksArray = [NSArray arrayWithArray:[dataLoader getNumberOfBlocks]];
    deltaXArray = [NSMutableArray arrayWithArray:[dataLoader getDeltaX]];
    deltaYArray = [NSMutableArray arrayWithArray:[dataLoader getDeltaY]];
    deltaZArray = [NSMutableArray arrayWithArray:[dataLoader getDeltaZ]];
    porosityArray = [NSMutableArray arrayWithArray:[dataLoader getPorosity]];
    permeabilityXArray = [NSMutableArray arrayWithArray:[dataLoader getPermeabilityX]];
    permeabilityYArray = [NSMutableArray arrayWithArray:[dataLoader getPermeabilityY]];
    permeabilityZArray = [NSMutableArray arrayWithArray:[dataLoader getPermeabilityZ]];
    blockDepthArray = [NSMutableArray arrayWithArray:[dataLoader getBlockDepth]];
    initialPressureArray = [NSMutableArray arrayWithArray:[dataLoader getInitialPressure]];


}

@end
