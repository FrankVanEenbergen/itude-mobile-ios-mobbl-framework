//
//  MBSingleDialogBuilder.m
//  itude-mobile-ios-app
//
//  Created by Frank van Eenbergen on 5/6/13.
//  Copyright (c) 2013 Itude Mobile. All rights reserved.
//

#import "MBSingleDialogContentBuilder.h"
#import "MBDialogController.h"
#import "MBPageStackController.h"

@implementation MBSingleDialogContentBuilder

-(UIViewController *)buildDialogContentViewControllerForDialog:(MBDialogController *)dialogController {
    UIViewController *containerViewController = [[UIViewController new] autorelease];
    if (dialogController.pageStackControllers.count > 0) {
        MBPageStackController *pageStackController = [dialogController.pageStackControllers objectAtIndex:0];
        [containerViewController.view addSubview:pageStackController.navigationController.view];
    }
    return containerViewController;
}

@end
