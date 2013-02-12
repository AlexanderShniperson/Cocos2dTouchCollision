//
//  CCSpriteTouch.h
//  TouchCollisionSample
//
//  Created by Alexander Shniperson on 12.02.13.
//  Copyright 2013 Aleksander Shniperson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

static NSString *LayerTouchTapNotification = @"LayerTouchTap";
static NSString *LayerTouchTapAndMoveNotification = @"LayerTouchTapAndMove";

@interface CCLayerTouch : CCLayer

- (id)initWithSpriteFile:(NSString*)spriteFile andPropertyListFile:(NSString*)propertyListFile;

@end
