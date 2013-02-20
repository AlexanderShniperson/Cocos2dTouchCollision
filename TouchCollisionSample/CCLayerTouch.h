//
//  CCSpriteTouch.h
//  TouchCollisionSample
//
//  Created by Alexander Shniperson on 12.02.13.
//  Copyright 2013 Aleksander Shniperson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@protocol CCLayerTouchDelegate;

@interface CCLayerTouch : CCLayer

@property(assign, nonatomic) id<CCLayerTouchDelegate> delegate;

- (id)init;
- (void)setTouchMapWithSpriteName:(NSString*)spriteFile andPropertyListFile:(NSString*)propertyListFile;

@end

@protocol CCLayerTouchDelegate <NSObject>

@optional
-(void)ccLayerTouchDidTap:(CCLayerTouch *)sender;
-(void)ccLayerTouchDidTap:(CCLayerTouch *)sender moveToPoint:(CGPoint)destPoint;

@end