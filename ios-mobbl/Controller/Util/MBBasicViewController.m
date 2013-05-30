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
#import "MBDialogController.h"

#import "MBBasicViewController+BackButton.h"

@implementation MBBasicViewController

@synthesize page = _page;
@synthesize dialogController = _dialogController;

- (void) dealloc
{
    [_page release];
    [super dealloc];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    // TODO: This should be optional somehow
    //[self addCustomBackButtonWithType:MBBackButtonTypeArrow withTitle:nil];
}

-(void) handleException:(NSException *) exception{
	[self.page handleException:exception];
}

- (void) rebuildView {
	[self.page rebuildView];	
}

-(void) showActivityIndicator {
	[[MBApplicationController currentInstance] showActivityIndicatorForDialog:self.page.dialogName];
}

-(void) hideActivityIndicator {
	[[MBApplicationController currentInstance] hideActivityIndicatorForDialog:self.page.dialogName];
}


#pragma mark -
#pragma mark View lifecycle delegate methods

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



#pragma mark -
#pragma mark Orientation delegate calls

// iOS6 and up
- (BOOL)shouldAutorotate {
    return [[MBOrientationManager sharedInstance] shouldAutorotate];
}

// iOS6 and up
- (NSUInteger)supportedInterfaceOrientations {
    return [[MBOrientationManager sharedInstance] orientationMask];
    return UIInterfaceOrientationMaskAll;
}

// iOS5 and lower
-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return [[MBOrientationManager sharedInstance] supportInterfaceOrientation:toInterfaceOrientation];
}


@end
