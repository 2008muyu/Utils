//
//  UIUtils.m
//  WXMovie
//
//  Created by wei.chen on 12-8-24.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联ios开发培训中心. All rights reserved.
//

#import "UIUtils.h"

#import "Reachability.h"
@implementation UIUtils

//获取Documents下文件的路径
+ (NSString *)pathOfDocument:(NSString *)fileName {
    NSString *p = [NSString stringWithFormat:@"Documents/%@",fileName];
    NSString *homePath = NSHomeDirectory(); //获取沙盒的根路径
    NSString *path = [homePath stringByAppendingPathComponent:p];
    NSLog(@"%@",path);
    return path;
}

//删除指定路径的文件
+ (BOOL)deleteFile:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        return [fileManager removeItemAtPath:path error:nil];
    }
    return NO;
}

//判断网络
+(BOOL) isExistenceNetword{
    Reachability *r= [Reachability reachabilityForInternetConnection];
    if ([r currentReachabilityStatus] == NotReachable){
        return NO;
    }
    BOOL isExistenceNetwork = YES;
    return  isExistenceNetwork;
}

//av提示
+(void)showAlert:(NSString*)title msg:(NSString*)msg delegate:(id<UIAlertViewDelegate>)delegate{
	UIAlertView *av = [[UIAlertView alloc] initWithTitle:title message:msg delegate:delegate cancelButtonTitle:@"确定" otherButtonTitles:nil];
	[av show];
    return;
}

//键盘弹出视图上移
+ (void)animationTextField:(UITextField *)textField moveUp:(BOOL)moveUp movementDistance:(float)movementDistance view:(UIView *)view{
    
    const float movementDistance_ = movementDistance;
    const float movementDuration = 0.3f;
    
    [UIView beginAnimations:@"viewMovement" context:nil];
    
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:movementDuration];
    
    int movement = moveUp ? -movementDistance_ : movementDistance_;
    
    view.frame = CGRectOffset(view.frame, 0, movement);
    
    [UIView commitAnimations];
}

@end
