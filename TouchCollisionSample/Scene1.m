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
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onLayerTouchTap:) name:LayerTouchTapNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onLayerTouchTapAndMove:) name:LayerTouchTapAndMoveNotification object:nil];
        
        for (int i = 1; i <= 8; i++) {
            CCLayerTouch *figure = [[CCLayerTouch alloc] initWithSpriteFile:[NSString stringWithFormat:@"fig%d.png", i] andPropertyListFile:@"figures.plist"];
            [self addChild:figure];
            [figure release];
            figure = nil;
        }
	}
	
    return self;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeAllChildrenWithCleanup:YES];
	[super dealloc];
}

-(IBAction)onLayerTouchTap:(NSNotification*)sender{
    
}

-(IBAction)onLayerTouchTapAndMove:(NSNotification*)sender{
    CCLayerTouch *node = (CCLayerTouch*)[sender object];
    
    if(node == nil || sender.userInfo == nil){
        return;
    }
    
    node.position = ccp([[sender.userInfo objectForKey:@"x"] floatValue] - node.contentSize.width/2,
                        [[sender.userInfo objectForKey:@"y"] floatValue] - node.contentSize.height/2);
}

@end
