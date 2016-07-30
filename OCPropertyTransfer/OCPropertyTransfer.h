//
//  OCPropertyTransfer.h
//  OCPropertyTransfer
//
//  Created by Christian on 16/7/28.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import <AppKit/AppKit.h>
#import "TransferViewController.h"
@interface OCPropertyTransfer : NSObject
/**<#注释#>*/
@property (nonatomic, strong) TransferViewController *windowController;
+ (instancetype)sharedPlugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end