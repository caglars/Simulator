//
//  CSDataLoader.m
//  Simulator
//
//  Created by Caglar Sinayuc on 05/01/2014.
//  Copyright (c) 2014 cs. All rights reserved.
//

#import "CSDataLoader.h"

@implementation CSDataLoader

@synthesize path;

- (id)init
{
    self = [super init];
    if (self) {

        // Initialization code here.
        
    }
    return self;
}

-(BOOL)getInputFileFromPath:(NSString *) inputTextPath
{
    NSStringEncoding encoding = NSUTF8StringEncoding;
    fileContent = [NSString stringWithContentsOfFile:inputTextPath usedEncoding:&encoding error:NULL];
    NSLog(@"CSDataLoader");
    if (fileContent) {
        return 0;
    }
    return 1;
}

- (NSInteger)getDimension
{
    NSRange startOfDimension = [fileContent rangeOfString:@"DIMENSION"];
    NSRange endOfDimension = [fileContent rangeOfString:@"ENDDIMENSION"];

    NSRange dimensionRange;
    dimensionRange.location = startOfDimension.location + startOfDimension.length;
    dimensionRange.length = endOfDimension.location - (startOfDimension.location + startOfDimension.length);
    NSString *dimensionString = [fileContent substringWithRange:dimensionRange];
    NSScanner *dimensionScanner = [NSScanner scannerWithString:dimensionString];
    dimensionValue = 0;
    [dimensionScanner scanInteger:&dimensionValue];
    NSLog(@"The dimension is: %ld", (long)dimensionValue);
    
    return dimensionValue;
}

- (NSArray *)getNumberOfBlocks
{
    NSRange startOfNumberOfBlocks = [fileContent rangeOfString:@"NUMBEROFBLOCKS"];
    NSRange endOfNumberOfBlocks = [fileContent rangeOfString:@"ENDNUMBEROFBLOCKS"];
    NSRange numberOfBlocksRange;
    numberOfBlocksRange.location = startOfNumberOfBlocks.location + startOfNumberOfBlocks.length;
    numberOfBlocksRange.length = endOfNumberOfBlocks.location - (startOfNumberOfBlocks.location + startOfNumberOfBlocks.length);
    NSString *numberOfBlocksString = [fileContent substringWithRange:numberOfBlocksRange];
    
    numberOfBlocksArray = [numberOfBlocksString componentsSeparatedByString:@" "];
    
    return numberOfBlocksArray;
}

- (NSMutableArray *)getDeltaX
{
    
    NSRange startOfDeltaX = [fileContent rangeOfString:@"DELTAX"];
    NSRange endOfDeltaX = [fileContent rangeOfString:@"ENDDELTAX"];
    NSRange deltaXRange;
    deltaXRange.location = startOfDeltaX.location + startOfDeltaX.length;
    deltaXRange.length = endOfDeltaX.location - (startOfDeltaX.location + startOfDeltaX.length);
    NSString *deltaXString = [fileContent substringWithRange:deltaXRange];
    NSArray *deltaXRawArray;
    deltaXRawArray = [deltaXString componentsSeparatedByString:@" "];
    NSEnumerator *deltaXEnum = [deltaXRawArray objectEnumerator];
    deltaXArray = [[NSMutableArray alloc] init];
    
    NSString *tmpDeltaX;
    int counterDeltaX = 0;
    
    while (tmpDeltaX = [deltaXEnum nextObject]) {
        
        NSArray *tmpDeltaXArray = [tmpDeltaX componentsSeparatedByString:@"*"];
        NSScanner *deltaXMultiplierScanner = [NSScanner scannerWithString:[tmpDeltaXArray objectAtIndex:0]];
        NSInteger deltaXMultiplier = 0;
        [deltaXMultiplierScanner scanInteger:&deltaXMultiplier];
        NSScanner *deltaXValueScanner = [NSScanner scannerWithString:[tmpDeltaXArray objectAtIndex:1]];
        NSInteger deltaXValue = 0;
        [deltaXValueScanner scanInteger:&deltaXValue];
        
        
        for (int i=0; i<deltaXMultiplier; i++) {
            counterDeltaX ++;
            [deltaXArray addObject:[NSNumber numberWithInteger:deltaXValue]];
        }
        
    }
    
    
    for (NSNumber *item in deltaXArray) {
        NSLog(@"%lu", [item integerValue]);
    }
    
    NSLog(@"%lu", (unsigned long)[deltaXArray count]);

    return deltaXArray;
}

- (NSMutableArray *)getDeltaY
{
    NSRange startOfDeltaY = [fileContent rangeOfString:@"DELTAY"];
    NSRange endOfDeltaY = [fileContent rangeOfString:@"ENDDELTAY"];
    NSRange deltaYRange;
    deltaYRange.location = startOfDeltaY.location + startOfDeltaY.length;
    deltaYRange.length = endOfDeltaY.location - (startOfDeltaY.location + startOfDeltaY.length);
    NSString *deltaYString = [fileContent substringWithRange:deltaYRange];
    NSArray *deltaYRawArray;
    deltaYRawArray = [deltaYString componentsSeparatedByString:@" "];
    NSEnumerator *deltaYEnum = [deltaYRawArray objectEnumerator];
    deltaYArray = [[NSMutableArray alloc] init];
    
    NSString *tmpDeltaY;
    int counterDeltaY = 0;
    
    while (tmpDeltaY = [deltaYEnum nextObject]) {
        
        NSArray *tmpDeltaYArray = [tmpDeltaY componentsSeparatedByString:@"*"];
        NSScanner *deltaYMultiplierScanner = [NSScanner scannerWithString:[tmpDeltaYArray objectAtIndex:0]];
        NSInteger deltaYMultiplier = 0;
        [deltaYMultiplierScanner scanInteger:&deltaYMultiplier];
        NSScanner *deltaYValueScanner = [NSScanner scannerWithString:[tmpDeltaYArray objectAtIndex:1]];
        NSInteger deltaYValue = 0;
        [deltaYValueScanner scanInteger:&deltaYValue];
        
        
        for (int i=0; i<deltaYMultiplier; i++) {
            counterDeltaY ++;
            [deltaYArray addObject:[NSNumber numberWithInteger:deltaYValue]];
        }
        
    }
    
    for (NSNumber *item in deltaYArray) {
        NSLog(@"%lu", [item integerValue]);
    }
    
    NSLog(@"%lu", (unsigned long)[deltaYArray count]);
    
    return deltaYArray;
}

- (NSMutableArray *)getDeltaZ
{
    NSRange startOfDeltaZ = [fileContent rangeOfString:@"DELTAZ"];
    NSRange endOfDeltaZ = [fileContent rangeOfString:@"ENDDELTAZ"];
    NSRange deltaZRange;
    deltaZRange.location = startOfDeltaZ.location + startOfDeltaZ.length;
    deltaZRange.length = endOfDeltaZ.location - (startOfDeltaZ.location + startOfDeltaZ.length);
    NSString *deltaZString = [fileContent substringWithRange:deltaZRange];
    NSArray *deltaZRawArray;
    deltaZRawArray = [deltaZString componentsSeparatedByString:@" "];
    NSEnumerator *deltaZEnum = [deltaZRawArray objectEnumerator];
    deltaZArray = [[NSMutableArray alloc] init];
    
    NSString *tmpDeltaZ;
    int counterDeltaZ = 0;
    
    while (tmpDeltaZ = [deltaZEnum nextObject]) {
        
        NSArray *tmpDeltaZArray = [tmpDeltaZ componentsSeparatedByString:@"*"];
        NSScanner *deltaZMultiplierScanner = [NSScanner scannerWithString:[tmpDeltaZArray objectAtIndex:0]];
        NSInteger deltaZMultiplier = 0;
        [deltaZMultiplierScanner scanInteger:&deltaZMultiplier];
        NSScanner *deltaZValueScanner = [NSScanner scannerWithString:[tmpDeltaZArray objectAtIndex:1]];
        NSInteger deltaZValue = 0;
        [deltaZValueScanner scanInteger:&deltaZValue];
        
        
        for (int i=0; i<deltaZMultiplier; i++) {
            counterDeltaZ ++;
            [deltaZArray addObject:[NSNumber numberWithInteger:deltaZValue]];
        }
        
    }
    
    for (NSNumber *item in deltaZArray) {
        NSLog(@"%lu", [item integerValue]);
    }
    
    NSLog(@"%lu", (unsigned long)[deltaZArray count]);
    
    return deltaZArray;
}

- (NSMutableArray *)getPorosity
{
    NSRange startOfPorosity = [fileContent rangeOfString:@"POROSITY"];
    NSRange endOfPorosity = [fileContent rangeOfString:@"ENDPOROSITY"];
    NSRange porosityRange;
    porosityRange.location = startOfPorosity.location + startOfPorosity.length;
    porosityRange.length = endOfPorosity.location - (startOfPorosity.location + startOfPorosity.length);
    NSString *porosityString = [fileContent substringWithRange:porosityRange];
    NSArray *porosityRawArray;
    porosityRawArray = [porosityString componentsSeparatedByString:@" "];
    NSEnumerator *porosityEnum = [porosityRawArray objectEnumerator];
    porosityArray = [[NSMutableArray alloc] init];
    
    NSString *tmpPorosity;
    int counterPorosity = 0;
    
    while (tmpPorosity = [porosityEnum nextObject]) {
        
        NSArray *tmpPorosityArray = [tmpPorosity componentsSeparatedByString:@"*"];
        NSScanner *porosityMultiplierScanner = [NSScanner scannerWithString:[tmpPorosityArray objectAtIndex:0]];
        float porosityMultiplier = 0.0;
        [porosityMultiplierScanner scanFloat:&porosityMultiplier];
        NSScanner *porosityValueScanner = [NSScanner scannerWithString:[tmpPorosityArray objectAtIndex:1]];
        float porosityValue = 0;
        [porosityValueScanner scanFloat:&porosityValue];
        
        
        for (int i=0; i<porosityMultiplier; i++) {
            counterPorosity ++;
            [porosityArray addObject:[NSNumber numberWithFloat:porosityValue]];
        }
        
    }
    
    for (NSNumber *item in porosityArray) {
        NSLog(@"%f", [item floatValue]);
    }
    
    NSLog(@"%lu", (unsigned long)[porosityArray count]);
    
    return porosityArray;
}

- (NSMutableArray *)getPermeabilityX
{
    NSRange startOfPermeabilityX = [fileContent rangeOfString:@"PERMEABILITYX"];
    NSRange endOfPermeabilityX = [fileContent rangeOfString:@"ENDPERMEABILITYX"];
    NSRange permeabilityXRange;
    permeabilityXRange.location = startOfPermeabilityX.location + startOfPermeabilityX.length;
    permeabilityXRange.length = endOfPermeabilityX.location - (startOfPermeabilityX.location + startOfPermeabilityX.length);
    NSString *permeabilityXString = [fileContent substringWithRange:permeabilityXRange];
    NSArray *permeabilityXRawArray;
    permeabilityXRawArray = [permeabilityXString componentsSeparatedByString:@" "];
    NSEnumerator *permeabilityXEnum = [permeabilityXRawArray objectEnumerator];
    permeabilityXArray = [[NSMutableArray alloc] init];
    
    NSString *tmpPermeabilityX;
    int counterPermeabilityX = 0;
    
    while (tmpPermeabilityX = [permeabilityXEnum nextObject]) {
        
        NSArray *tmpPermeabilityXArray = [tmpPermeabilityX componentsSeparatedByString:@"*"];
        NSScanner *permeabilityXMultiplierScanner = [NSScanner scannerWithString:[tmpPermeabilityXArray objectAtIndex:0]];
        float permeabilityXMultiplier = 0.0;
        [permeabilityXMultiplierScanner scanFloat:&permeabilityXMultiplier];
        NSScanner *permeabilityXValueScanner = [NSScanner scannerWithString:[tmpPermeabilityXArray objectAtIndex:1]];
        float permeabilityXValue = 0;
        [permeabilityXValueScanner scanFloat:&permeabilityXValue];
        
        
        for (int i=0; i<permeabilityXMultiplier; i++) {
            counterPermeabilityX ++;
            [permeabilityXArray addObject:[NSNumber numberWithFloat:permeabilityXValue]];
        }
        
    }
    
    for (NSNumber *item in permeabilityXArray) {
        NSLog(@"%f", [item floatValue]);
    }
    
    NSLog(@"%lu", (unsigned long)[permeabilityXArray count]);
    
    return permeabilityXArray;
}

- (NSMutableArray *)getPermeabilityY
{
    NSRange startOfPermeabilityY = [fileContent rangeOfString:@"PERMEABILITYY"];
    NSRange endOfPermeabilityY = [fileContent rangeOfString:@"ENDPERMEABILITYY"];
    NSRange permeabilityYRange;
    permeabilityYRange.location = startOfPermeabilityY.location + startOfPermeabilityY.length;
    permeabilityYRange.length = endOfPermeabilityY.location - (startOfPermeabilityY.location + startOfPermeabilityY.length);
    NSString *permeabilityYString = [fileContent substringWithRange:permeabilityYRange];
    NSArray *permeabilityYRawArray;
    permeabilityYRawArray = [permeabilityYString componentsSeparatedByString:@" "];
    NSEnumerator *permeabilityYEnum = [permeabilityYRawArray objectEnumerator];
    permeabilityYArray = [[NSMutableArray alloc] init];
    
    NSString *tmpPermeabilityY;
    int counterPermeabilityY = 0;
    
    while (tmpPermeabilityY = [permeabilityYEnum nextObject]) {
        
        NSArray *tmpPermeabilityYArray = [tmpPermeabilityY componentsSeparatedByString:@"*"];
        NSScanner *permeabilityYMultiplierScanner = [NSScanner scannerWithString:[tmpPermeabilityYArray objectAtIndex:0]];
        float permeabilityYMultiplier = 0.0;
        [permeabilityYMultiplierScanner scanFloat:&permeabilityYMultiplier];
        NSScanner *permeabilityYValueScanner = [NSScanner scannerWithString:[tmpPermeabilityYArray objectAtIndex:1]];
        float permeabilityYValue = 0;
        [permeabilityYValueScanner scanFloat:&permeabilityYValue];
        
        
        for (int i=0; i<permeabilityYMultiplier; i++) {
            counterPermeabilityY ++;
            [permeabilityYArray addObject:[NSNumber numberWithFloat:permeabilityYValue]];
        }
        
    }
    
    for (NSNumber *item in permeabilityYArray) {
        NSLog(@"%f", [item floatValue]);
    }
    
    NSLog(@"%lu", (unsigned long)[permeabilityYArray count]);
    
    return permeabilityYArray;
}

- (NSMutableArray *)getPermeabilityZ
{
    NSRange startOfPermeabilityZ = [fileContent rangeOfString:@"PERMEABILITYZ"];
    NSRange endOfPermeabilityZ = [fileContent rangeOfString:@"ENDPERMEABILITYZ"];
    NSRange permeabilityZRange;
    permeabilityZRange.location = startOfPermeabilityZ.location + startOfPermeabilityZ.length;
    permeabilityZRange.length = endOfPermeabilityZ.location - (startOfPermeabilityZ.location + startOfPermeabilityZ.length);
    NSString *permeabilityZString = [fileContent substringWithRange:permeabilityZRange];
    NSArray *permeabilityZRawArray;
    permeabilityZRawArray = [permeabilityZString componentsSeparatedByString:@" "];
    NSEnumerator *permeabilityZEnum = [permeabilityZRawArray objectEnumerator];
    permeabilityZArray = [[NSMutableArray alloc] init];
    
    NSString *tmpPermeabilityZ;
    int counterPermeabilityZ = 0;
    
    while (tmpPermeabilityZ = [permeabilityZEnum nextObject]) {
        
        NSArray *tmpPermeabilityZArray = [tmpPermeabilityZ componentsSeparatedByString:@"*"];
        NSScanner *permeabilityZMultiplierScanner = [NSScanner scannerWithString:[tmpPermeabilityZArray objectAtIndex:0]];
        float permeabilityZMultiplier = 0.0;
        [permeabilityZMultiplierScanner scanFloat:&permeabilityZMultiplier];
        NSScanner *permeabilityZValueScanner = [NSScanner scannerWithString:[tmpPermeabilityZArray objectAtIndex:1]];
        float permeabilityZValue = 0;
        [permeabilityZValueScanner scanFloat:&permeabilityZValue];
        
        
        for (int i=0; i<permeabilityZMultiplier; i++) {
            counterPermeabilityZ ++;
            [permeabilityZArray addObject:[NSNumber numberWithFloat:permeabilityZValue]];
        }
        
    }
    
    for (NSNumber *item in permeabilityZArray) {
        NSLog(@"%f", [item floatValue]);
    }
    
    NSLog(@"%lu", (unsigned long)[permeabilityZArray count]);
    
    return permeabilityZArray;
}

- (NSMutableArray *)getBlockDepth
{
    NSRange startOfBlockDepth = [fileContent rangeOfString:@"BLOCKDEPTH"];
    NSRange endOfBlockDepth = [fileContent rangeOfString:@"ENDBLOCKDEPTH"];
    NSRange blockDepthRange;
    blockDepthRange.location = startOfBlockDepth.location + startOfBlockDepth.length;
    blockDepthRange.length = endOfBlockDepth.location - (startOfBlockDepth.location + startOfBlockDepth.length);
    NSString *blockDepthString = [fileContent substringWithRange:blockDepthRange];
    NSArray *blockDepthRawArray;
    blockDepthRawArray = [blockDepthString componentsSeparatedByString:@" "];
    NSEnumerator *blockDepthEnum = [blockDepthRawArray objectEnumerator];
    blockDepthArray = [[NSMutableArray alloc] init];
    
    NSString *tmpBlockDepth;
    int counterBlockDepth = 0;
    
    while (tmpBlockDepth = [blockDepthEnum nextObject]) {
        
        NSArray *tmpBlockDepthArray = [tmpBlockDepth componentsSeparatedByString:@"*"];
        NSScanner *blockDepthMultiplierScanner = [NSScanner scannerWithString:[tmpBlockDepthArray objectAtIndex:0]];
        float blockDepthMultiplier = 0.0;
        [blockDepthMultiplierScanner scanFloat:&blockDepthMultiplier];
        NSScanner *blockDepthValueScanner = [NSScanner scannerWithString:[tmpBlockDepthArray objectAtIndex:1]];
        float blockDepthValue = 0;
        [blockDepthValueScanner scanFloat:&blockDepthValue];
        
        
        for (int i=0; i<blockDepthMultiplier; i++) {
            counterBlockDepth ++;
            [blockDepthArray addObject:[NSNumber numberWithFloat:blockDepthValue]];
        }
        
    }
    
    for (NSNumber *item in blockDepthArray) {
        NSLog(@"%f", [item floatValue]);
    }
    
    NSLog(@"%lu", (unsigned long)[blockDepthArray count]);
    
    return blockDepthArray;
}

- (NSMutableArray *)getInitialPressure
{
    NSRange startOfInitialPressure = [fileContent rangeOfString:@"INITIALPRESSURE"];
    NSRange endOfInitialPressure = [fileContent rangeOfString:@"ENDINITIALPRESSURE"];
    NSRange initialPressureRange;
    initialPressureRange.location = startOfInitialPressure.location + startOfInitialPressure.length;
    initialPressureRange.length = endOfInitialPressure.location - (startOfInitialPressure.location + startOfInitialPressure.length);
    NSString *initialPressureString = [fileContent substringWithRange:initialPressureRange];
    NSArray *initialPressureRawArray;
    initialPressureRawArray = [initialPressureString componentsSeparatedByString:@" "];
    NSEnumerator *initialPressureEnum = [initialPressureRawArray objectEnumerator];
    initialPressureArray = [[NSMutableArray alloc] init];
    
    NSString *tmpInitialPressure;
    int counterInitialPressure = 0;
    
    while (tmpInitialPressure = [initialPressureEnum nextObject]) {
        
        NSArray *tmpInitialPressureArray = [tmpInitialPressure componentsSeparatedByString:@"*"];
        NSScanner *initialPressureMultiplierScanner = [NSScanner scannerWithString:[tmpInitialPressureArray objectAtIndex:0]];
        float initialPressureMultiplier = 0.0;
        [initialPressureMultiplierScanner scanFloat:&initialPressureMultiplier];
        NSScanner *initialPressureValueScanner = [NSScanner scannerWithString:[tmpInitialPressureArray objectAtIndex:1]];
        float initialPressureValue = 0;
        [initialPressureValueScanner scanFloat:&initialPressureValue];
        
        
        for (int i=0; i<initialPressureMultiplier; i++) {
            counterInitialPressure ++;
            [initialPressureArray addObject:[NSNumber numberWithFloat:initialPressureValue]];
        }
        
    }
    
    for (NSNumber *item in initialPressureArray) {
        NSLog(@"%f", [item floatValue]);
    }
    
    NSLog(@"%lu", (unsigned long)[initialPressureArray count]);

    return initialPressureArray;
}


@end
