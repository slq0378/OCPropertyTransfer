//
//  OCPropertyTransfer.h
//  OCPropertyTransfer
//
//  Created by Christian on 16/7/28.
//  Copyright © 2016年 MrSong. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface OCPropertyTransfer : NSObject

+ (instancetype)sharedPlugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end