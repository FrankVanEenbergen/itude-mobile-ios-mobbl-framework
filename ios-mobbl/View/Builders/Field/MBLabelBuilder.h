//
//  MBLabelBuilder.h
//  itude-mobile-ios-app
//
//  Created by Pjotter Tommassen on 2012/27/11.
//  Copyright (c) 2012 Itude Mobile. All rights reserved.
//

#import "MBViewBuilder.h"
#import "MBFieldViewBuilder.h"

@interface MBLabelBuilder : MBFieldViewBuilder

-(void)configureLabel:(UILabel *)label forField:(MBField *)field;

@end
