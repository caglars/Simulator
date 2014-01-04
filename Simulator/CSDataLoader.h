//
//  CSDataLoader.h
//  Simulator
//
//  Created by Caglar Sinayuc on 05/01/2014.
//  Copyright (c) 2014 cs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSDataLoader : NSObject
{
    //NSString *path;
    NSString *fileContent;
    
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

@property (nonatomic, copy) NSString *path;

- (NSInteger)getDimension;
- (BOOL)getInputFileFromPath:(NSString *) path;
- (NSArray *)getNumberOfBlocks;
- (NSMutableArray *)getDeltaX;
- (NSMutableArray *)getDeltaY;
- (NSMutableArray *)getDeltaZ;
- (NSMutableArray *)getPorosity;
- (NSMutableArray *)getPermeabilityX;
- (NSMutableArray *)getPermeabilityY;
- (NSMutableArray *)getPermeabilityZ;
- (NSMutableArray *)getBlockDepth;
- (NSMutableArray *)getInitialPressure;



@end
