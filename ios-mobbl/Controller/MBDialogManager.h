//
//  MBDialogManager.h
//  itude-mobile-ios-chep-uld
//
//  Created by Frank van Eenbergen on 9/25/13.
//  Copyright (c) 2013 Itude Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBOrderedMutableDictionary.h"

@class MBPage;
@class MBDialogDefinition;
@class MBDialogController;
@class MBPageStackDefinition;
@class MBPageStackController;


@protocol MBDialogManagerDelegate <NSObject>
@required
- (void)didCreateDialogController:(MBDialogController *)dialogController;
- (void)didEndPageStackWithName:(NSString*) pageStackName;
- (void)didActivatePageStack:(MBPageStackController*) pageStackController inDialog:(MBDialogController *)dialogController;
@end


@interface MBDialogManager : NSObject
@property (nonatomic, assign) id<MBDialogManagerDelegate>delegate;
@property (nonatomic, retain) MBOrderedMutableDictionary *dialogControllers;
@property (nonatomic, retain) NSString *activePageStackName;
@property (nonatomic, retain) NSString *activeDialogName;

/**
 * @name Creating Dialogs
 */
- (MBDialogController *)createDialogController:(MBDialogDefinition *)definition;


/**
 * @name Gettings Dialogs and PageStacks
 */
- (NSArray *)visibleDialogControllers;

- (MBDialogController *)dialogWithName:(NSString*) name;
- (MBPageStackController *)pageStackControllerWithName:(NSString*) name;


/**
 * @name Managing PageStacks
 */
- (void) addPageToPageStack:(MBPage *) page displayMode:(NSString*) displayMode transitionStyle:(NSString *)transitionStyle selectPageStack:(BOOL) shouldSelectPageStack;
- (void) endPageStackWithName:(NSString*) pageStackName keepPosition:(BOOL) keepPosition;
- (void) notifyPageStackUsage:(NSString*) pageStackName;
- (void) activatePageStackWithName:(NSString*) pageStackName;

/**
 * @name Resetting Dialogs and PageStacks
 */
- (void)resetDialogs;
- (void)resetPageStacks;

@end
