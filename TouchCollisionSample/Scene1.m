//
//  Scene1.m
//  TouchCollisionSample
//
//  Created by Aleksander Shniperson on 12.02.13.
//  Copyright Aleksander Shniperson 2013. All rights reserved.
//

#import "Scene1.h"

@implementation Scene1

@synthesize fig1;
@synthesize fig2;
@synthesize fig3;
@synthesize fig4;
@synthesize fig5;
@synthesize fig6;
@synthesize fig7;
@synthesize fig8;

-(void)didLoadFromCCB{
    self.fig1.delegate = self;
    [self.fig1 setTouchMapWithSpriteName:@"fig1" andPropertyListFile:@"figures.plist"];

    self.fig2.delegate = self;
    [self.fig2 setTouchMapWithSpriteName:@"fig2" andPropertyListFile:@"figures.plist"];

    self.fig3.delegate = self;
    [self.fig3 setTouchMapWithSpriteName:@"fig3" andPropertyListFile:@"figures.plist"];
    
    self.fig4.delegate = self;
    [self.fig4 setTouchMapWithSpriteName:@"fig4" andPropertyListFile:@"figures.plist"];
    
    self.fig5.delegate = self;
    [self.fig5 setTouchMapWithSpriteName:@"fig5" andPropertyListFile:@"figures.plist"];
    
    self.fig6.delegate = self;
    [self.fig6 setTouchMapWithSpriteName:@"fig6" andPropertyListFile:@"figures.plist"];
    
    self.fig7.delegate = self;
    [self.fig7 setTouchMapWithSpriteName:@"fig7" andPropertyListFile:@"figures.plist"];
    
    self.fig8.delegate = self;
    [self.fig8 setTouchMapWithSpriteName:@"fig8" andPropertyListFile:@"figures.plist"];
}

-(void)dealloc {
    [self removeAllChildrenWithCleanup:YES];
	[super dealloc];
}

-(void)ccLayerTouchDidTap:(CCLayerTouch *)sender moveToPoint:(CGPoint)destPoint{
    CCNode *child = nil;
    
    if(sender.children.count == 0){
        return;
    }else{
        child = [sender.children objectAtIndex:0];
    }
    
    child.position = ccp(destPoint.x - child.contentSize.width/2,
                          destPoint.y - child.contentSize.height/2);
}

@end
