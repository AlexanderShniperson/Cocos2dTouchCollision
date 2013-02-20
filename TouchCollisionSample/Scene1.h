//
//  Scene1.h
//  TouchCollisionSample
//
//  Created by Aleksander Shniperson on 12.02.13.
//  Copyright Aleksander Shniperson 2013. All rights reserved.
//

#import "cocos2d.h"
#import "CCLayerTouch.h"

@interface Scene1 : CCLayer<CCLayerTouchDelegate>

@property(retain, nonatomic) CCLayerTouch *fig1;
@property(retain, nonatomic) CCLayerTouch *fig2;
@property(retain, nonatomic) CCLayerTouch *fig3;
@property(retain, nonatomic) CCLayerTouch *fig4;
@property(retain, nonatomic) CCLayerTouch *fig5;
@property(retain, nonatomic) CCLayerTouch *fig6;
@property(retain, nonatomic) CCLayerTouch *fig7;
@property(retain, nonatomic) CCLayerTouch *fig8;

@end
