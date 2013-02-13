//
//  Scene1.m
//  TouchCollisionSample
//
//  Created by Aleksander Shniperson on 12.02.13.
//  Copyright Aleksander Shniperson 2013. All rights reserved.
//


#import "Scene1.h"
#import "AppDelegate.h"
#import "CCLayerTouch.h"

@implementation Scene1

+(CCScene *)scene {
	CCScene *scene = [CCScene node];
	
	Scene1 *layer = [Scene1 node];
	
	[scene addChild: layer];
	
	return scene;
}

-(id)init {
    self = [super init];
    
	if(self) {
        for (int i = 1; i <= 8; i++) {
            CCLayerTouch *figure = [[CCLayerTouch new] autorelease];
            figure.anchorPoint = ccp(0, 0);
            
            CCSprite *sprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"fig%d.png", i]];
            sprite.anchorPoint = ccp(0, 0);
            [figure addChild:sprite];
            figure.contentSize = sprite.contentSize;
            
            [figure setDelegate:self];
            [figure setSpriteFile:[NSString stringWithFormat:@"fig%d.png", i] andPropertyListFile:@"figures.plist"];
            
            [self addChild:figure];
        }
	}
	
    return self;
}

-(void)dealloc {
    [self removeAllChildrenWithCleanup:YES];
	[super dealloc];
}

-(void)ccLayerTouchDidTap:(CCLayerTouch *)sender moveToPoint:(CGPoint)destPoint{
    sender.position = ccp(destPoint.x - sender.contentSize.width/2,
                          destPoint.y - sender.contentSize.height/2);
}

@end
