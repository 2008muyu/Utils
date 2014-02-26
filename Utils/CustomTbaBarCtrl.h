//
//  CustomTbaBarCtrl.h
//  Telling@
//
//  Created by mby on 13-12-23.
//  Copyright (c) 2013年 M3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabBar.h"
@class UITabBarController;
@protocol CustomTbaBarCtrlDelegate;
@interface CustomTbaBarCtrl : UIViewController <CustomTabBarDelegate>
{
	CustomTabBar *_tabBar;
	UIView      *_containerView;
	UIView		*_transitionView;
//	id<CustomTbaBarCtrlDelegate> _delegate;
	NSMutableArray *_viewControllers;
	NSUInteger _selectedIndex;
	
	BOOL _tabBarTransparent;
	BOOL _tabBarHidden;
}

//@property(nonatomic, strong) id<CustomTbaBarCtrlDelegate> _delegate;

@property(nonatomic, copy) NSMutableArray *viewControllers;

@property(nonatomic, readonly) UIViewController *selectedViewController;
@property(nonatomic) NSUInteger selectedIndex;

// Apple is readonly
@property (nonatomic, readonly) CustomTabBar *tabBar;
@property(nonatomic,assign) id<CustomTbaBarCtrlDelegate> delegate;


// Default is NO, if set to YES, content will under tabbar
@property (nonatomic) BOOL tabBarTransparent;
@property (nonatomic) BOOL tabBarHidden;

- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr;

- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;

// Remove the viewcontroller at index of viewControllers.
- (void)removeViewControllerAtIndex:(NSUInteger)index;

// Insert an viewcontroller at index of viewControllers.
- (void)insertViewController:(UIViewController *)vc withImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index;

@end


@protocol CustomTbaBarCtrlDelegate <NSObject>
@optional
- (BOOL)tabBarController:(CustomTbaBarCtrl *)tabBarController shouldSelectViewController:(UIViewController *)viewController;
- (void)tabBarController:(CustomTbaBarCtrl *)tabBarController didSelectViewController:(UIViewController *)viewController;
@end

@interface UIViewController (CustomTbaBarCtrlSupport)
@property(nonatomic, retain, readonly) CustomTbaBarCtrl *customTbaBarCtrl;
@end
