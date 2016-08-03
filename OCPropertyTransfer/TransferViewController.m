//
//  TransferViewController
//  TransferDemo
//
//  Created by Christian on 16/7/28.
//  Copyright © 2016年 slq. All rights reserved.
//

#import "TransferViewController.h"

@interface TransferViewController ()
@property (unsafe_unretained) IBOutlet NSTextView *sourceText;
@property (unsafe_unretained) IBOutlet NSTextView *targetText;

@end


@implementation TransferViewController

- (id)init {
    @throw [NSException exceptionWithName:@"There's a better initializer" reason:@"Use -initWithNibName:inBundle:" userInfo:nil];
}
- (id)initWithBundle:(NSBundle *)bundle {
    if (self = [super initWithWindowNibName:NSStringFromClass([TransferViewController class])]) {
        @try {
            if ([NSUserNotificationCenter class])
                [[NSUserNotificationCenter defaultUserNotificationCenter] setDelegate:self];
        }
        @catch(NSException *exception) { NSLog(@"I've heard you like exceptions... %@", exception); }
    }
    return self;
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification {
    [self.window makeKeyAndOrderFront:self];
}

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification {
    return YES;
}
- (IBAction)transferClick:(NSButton *)sender {
    NSLog(@"%@",self.sourceText.string);
    
    [self transfer:self.sourceText.string];
}

- (IBAction)clearData:(NSButton *)sender {
    self.sourceText.string = @"";
    self.targetText.string = @"";
}

// TODO: 复制
- (IBAction)copyClick:(NSButton *)sender {
    // 将自己的文字复制到粘贴板
//    NSPasteboard *board = [NSPasteboard generalPasteboard];
//    [board setString:self.targetText.string forType:@"string"];
    
//    [board clearContents];
//    NSPasteboardItem *item = [[NSPasteboardItem alloc] init];
//    [item setString:self.targetText.string forType:@"string"];
//    [board writeObjects:[NSArray arrayWithObject:item]];
}

- (void)transfer:(NSString *)sourceStr {
    NSArray *arr = [self.sourceText.string componentsSeparatedByString:@"\n"];
    NSMutableArray *targetArr = [NSMutableArray array];
    for (NSInteger i = 0; i < arr.count; i ++) {
        if (![arr[i] isEqualToString:@"\n"] && (i % 2 == 0)) {
            // 偶数拼接///
            [targetArr addObject:[NSString stringWithFormat:@"/// %@",arr[i]]];
        }else if(![arr[i] isEqualToString:@"\n"]) {
            // 奇数拼接@property (nonatomic, strong) NSString *name;
            [targetArr addObject:[NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",arr[i]]];
        }else {
            
        }
    }
    NSMutableString *targetStr = [NSMutableString string];
    for (NSString *str in targetArr) {
        [targetStr appendFormat:[NSString stringWithFormat:@"%@\n",str]];
    }
    self.targetText.string = targetStr;

}



@end
