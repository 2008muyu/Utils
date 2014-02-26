//
//  UIUtils.h
//  WXMovie
//
//  Created by wei.chen on 12-8-24.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联ios开发培训中心. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIViewController+UIUtils.h"
@interface UIUtils : NSObject

//获取Documents下文件的路径
+ (NSString *)pathOfDocument:(NSString *)fileName;

//删除指定路径的文件
+ (BOOL)deleteFile:(NSString *)path;

//判断是否有网络
+ (BOOL) isExistenceNetword;

//av提示
+(void)showAlert:(NSString*)title msg:(NSString*)msg delegate:(id<UIAlertViewDelegate>)delegate;

//键盘弹出视图上移
+ (void)animationTextField:(UITextField *)textField moveUp:(BOOL)moveUp movementDistance:(float)movementDistance view:(UIView *)view;
@end
