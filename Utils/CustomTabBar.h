//
//  CustomTabBar.h
//  Telling@
//
//  Created by mby on 13-12-23.
//  Copyright (c) 2013年 M3. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomTabBarDelegate;

@interface CustomTabBar : UIView
{
	UIImageView *_backgroundView;
//	id<CustomTabBarDelegate> _delegate;
	NSMutableArray *_buttons;
}



@property (nonatomic, retain) UIImageView *backgroundView;
@property (nonatomic, assign) id<CustomTabBarDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *buttons;

- (id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray;
- (void)selectTabAtIndex:(NSInteger)index;
- (void)removeTabAtIndex:(NSInteger)index;
- (void)insertTabWithImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index;
- (void)setBackgroundImage:(UIImage *)img;

@end
@protocol CustomTabBarDelegate<NSObject>
@optional
- (void)tabBar:(CustomTabBar *)tabBar didSelectIndex:(NSInteger)index;
@end
