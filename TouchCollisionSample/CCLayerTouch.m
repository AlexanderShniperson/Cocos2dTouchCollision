//
//  CCSpriteTouch.m
//  TouchCollisionSample
//
//  Created by Alexander Shniperson on 12.02.13.
//  Copyright 2013 Aleksander Shniperson. All rights reserved.
//

#import "CCLayerTouch.h"

@implementation CCLayerTouch{
    NSString *_spriteFileName;
    NSString *_propertyListFileName;
    NSArray *_touchMap;
}

@synthesize delegate = _delegate;

-(id)init{
    self = [super init];
    
    if(self){
        self.isTouchEnabled = YES;
    }
    
    return self;
}

- (void)setSpriteFile:(NSString*)spriteFile andPropertyListFile:(NSString*)propertyListFile{
    _spriteFileName = [spriteFile retain];
    _propertyListFileName = [propertyListFile retain];
    _touchMap = [[self getTouchMapArrayFromPropertyList] retain];
}

-(void)dealloc{
    [self removeAllChildrenWithCleanup:YES];
    [_spriteFileName release];
    _spriteFileName = nil;
    [_propertyListFileName release];
    _propertyListFileName = nil;
    [_touchMap release];
    _touchMap = nil;
    [super dealloc];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    if(CGRectContainsPoint(CGRectMake(self.position.x, self.position.y, self.contentSize.width, self.contentSize.height), location) == NO){
        return NO;
    }
    
    return [self isTouchMapContainsPoint:location withOffset:self.position];
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    
    if([self.delegate respondsToSelector:@selector(ccLayerTouchDidTap:moveToPoint:)]){
        [self.delegate ccLayerTouchDidTap:self moveToPoint:location];
    }
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    if([self.delegate respondsToSelector:@selector(ccLayerTouchDidTap:)]){
        [self.delegate ccLayerTouchDidTap:self];
    }
}

-(void)onEnter{
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}

-(void)onExit{
    [[CCDirector sharedDirector].touchDispatcher removeDelegate:self];
    [super onExit];
}

-(NSArray*)getTouchMapArrayFromPropertyList{
    if(_propertyListFileName == nil || [_propertyListFileName isEqualToString:@""]){
        return [NSArray array];
    }
    
    NSString *propertyList = [[CCFileUtils sharedFileUtils] fullPathFromRelativePath:_propertyListFileName];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:propertyList] == NO){
        return [NSArray array];
    }
    
    NSString *textureName = [_spriteFileName stringByDeletingPathExtension];
    textureName = [[CCFileUtils sharedFileUtils] removeSuffixFromFile:textureName];
    
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:propertyList];
    
    if(dict == nil){
        return [NSArray array];
    }
    
    for (NSString *key in [dict allKeys]) {
        if([[key lowercaseString] isEqualToString:[textureName lowercaseString]]){
            return [dict objectForKey:textureName];
        }
    }
    
    return [NSArray array];
}

-(BOOL)isTouchMapContainsPoint:(CGPoint)touchPoint withOffset:(CGPoint)offsetPoint {
    if(_touchMap == nil){
        return NO;
    }
    
	int amountPoints = _touchMap.count;
    
    if(amountPoints <= 1){
        return NO;
    }
    
    // Special thanks to Stepan Generalov for idea with Path ;)
	CGMutablePathRef path = CGPathCreateMutable();
	CGPathMoveToPoint(path, NULL, [[[_touchMap objectAtIndex:0] objectForKey:@"x"] intValue] + offsetPoint.x, [[[_touchMap objectAtIndex:0] objectForKey:@"y"] intValue] + offsetPoint.y);
    
    for (int i = 1; i < amountPoints; i++) {
        CGPathAddLineToPoint(path, NULL, [[[_touchMap objectAtIndex:i] objectForKey:@"x"] intValue] + offsetPoint.x, [[[_touchMap objectAtIndex:i] objectForKey:@"y"] intValue] + offsetPoint.y);
    }
	
    CGPathCloseSubpath(path);
	
    return CGPathContainsPoint(path, NULL, touchPoint, YES);
}

@end