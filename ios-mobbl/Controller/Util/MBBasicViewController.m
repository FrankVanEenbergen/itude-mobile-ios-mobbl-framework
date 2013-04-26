//
//  MBBasicViewController.m
//  Core
//
//  Created by Wido on 6/2/10.
//  Copyright 2010 Itude Mobile BV. All rights reserved.
//

#import "MBBasicViewController.h"
#import "MBPage.h"
#import "MBOrientationManager.h"
#import "MBPageStackController.h"

@interface MBBasicViewController () {
    MBPage *_page;
    MBPageStackController *_pageStackController;
}

@end

@implementation MBBasicViewController

@synthesize page = _page;
@synthesize pageStackController = _pageStackController;

- (void) dealloc
{
    [_page release];
    [super dealloc];
}

-(void) handleException:(NSException *) exception{
	[self.page handleException:exception];
}

- (void) rebuildView {
	[self.page rebuildView];	
}

-(void) showActivityIndicator {
	[[MBApplicationController currentInstance] showActivityIndicator];
}

-(void) hideActivityIndicator {
	[[MBApplicationController currentInstance] hideActivityIndicator];
}

-(void) viewDidAppear:(BOOL)animated {
	for (id childView in [self.view subviews]){
		if ([childView respondsToSelector:@selector(delegate)]) {
			id delegate = [childView delegate];
			if(delegate != self && [delegate respondsToSelector:@selector(viewDidAppear:)]) [delegate viewDidAppear:animated];
		}
	}
}

-(void) viewWillAppear:(BOOL)animated {
	for (id childView in [self.view subviews]){
		if ([childView respondsToSelector:@selector(delegate)]) {
			id delegate = [childView delegate];
			if(delegate != self && [delegate respondsToSelector:@selector(viewWillAppear:)]) [delegate viewWillAppear:animated];
		}
	}
}

-(void) viewDidDisappear:(BOOL)animated {
	for (id childView in [self.view subviews]){
		if ([childView respondsToSelector:@selector(delegate)]) {
			id delegate = [childView delegate];
			if(delegate != self){
				//if ([delegate respondsToSelector:@selector(viewDidDisappear:)]) {
				[delegate viewDidDisappear:animated];
				//}
			}
		}
	}
}

-(void) viewWillDisappear:(BOOL)animated {
	for (id childView in [self.view subviews]){
		if ([childView respondsToSelector:@selector(delegate)]) {
			id delegate = [childView delegate];
			if(delegate != self ){//&& [delegate respondsToSelector:@selector(viewWillDisappear:)]) {
				[delegate viewWillDisappear:animated];
			}
		}
	}
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return [[MBOrientationManager sharedInstance] supportInterfaceOrientation:toInterfaceOrientation];
}

@end