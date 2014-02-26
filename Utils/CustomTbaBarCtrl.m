//
//  CustomTbaBarCtrl.m
//  Telling@
//
//  Created by mby on 13-12-23.
//  Copyright (c) 2013年 M3. All rights reserved.
//

#import "CustomTbaBarCtrl.h"
#define kTabBarHeight 49.0f

static CustomTbaBarCtrl *customTbaBarCtrl;

@implementation UIViewController (CustomTbaBarCtrlSupport)

- (CustomTbaBarCtrl *)customTbaBarCtrl
{
	return customTbaBarCtrl;
}

@end

@interface CustomTbaBarCtrl (private)
- (void)displayViewAtIndex:(NSUInteger)index;
@end

@implementation CustomTbaBarCtrl
@synthesize delegate = _delegate;
@synthesize selectedViewController = _selectedViewController;
@synthesize viewControllers = _viewControllers;
@synthesize selectedIndex = _selectedIndex;
@synthesize tabBarHidden = _tabBarHidden;

#pragma mark -
#pragma mark lifecycle
- (id)initWithViewControllers:(NSArray *)vcs imageArray:(NSArray *)arr;
{
	self = [super init];
	if (self != nil)
	{
		_viewControllers = [NSMutableArray arrayWithArray:vcs];
		
		_containerView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
		
		_transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320.0f, _containerView.frame.size.height - kTabBarHeight)];
		_transitionView.backgroundColor =  [UIColor groupTableViewBackgroundColor];
		
		_tabBar = [[CustomTabBar alloc] initWithFrame:CGRectMake(0, _containerView.frame.size.height - kTabBarHeight, 320.0f, kTabBarHeight) buttonImages:arr];
		_tabBar.delegate = self;
		
        customTbaBarCtrl = self;
	}
	return self;
}

- (void)loadView
{
	[super loadView];
	
	[_containerView addSubview:_transitionView];
	[_containerView addSubview:_tabBar];
	self.view = _containerView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.selectedIndex = 0;
}
- (void)viewDidUnload
{
	[super viewDidUnload];
	
	_tabBar = nil;
	_viewControllers = nil;
}

#pragma mark - instant methods

- (CustomTabBar *)tabBar
{
	return _tabBar;
}
- (BOOL)tabBarTransparent
{
	return _tabBarTransparent;
}
- (void)setTabBarTransparent:(BOOL)yesOrNo
{
	if (yesOrNo == YES)
	{
		_transitionView.frame = _containerView.bounds;
	}
	else
	{
		_transitionView.frame = CGRectMake(0, 0, 320.0f, _containerView.frame.size.height - kTabBarHeight);
	}
    
}
- (void)hidesTabBar:(BOOL)yesOrNO animated:(BOOL)animated;
{
	if (yesOrNO == YES)
	{
		if (self.tabBar.frame.origin.y == self.view.frame.size.height)
		{
			return;
		}
	}
	else
	{
		if (self.tabBar.frame.origin.y == self.view.frame.size.height - kTabBarHeight)
		{
			return;
		}
	}
	
	if (animated == YES)
	{
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:0.3f];
		if (yesOrNO == YES)
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y + kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
		else
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y - kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
		[UIView commitAnimations];
	}
	else
	{
		if (yesOrNO == YES)
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y + kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
		else
		{
			self.tabBar.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y - kTabBarHeight, self.tabBar.frame.size.width, self.tabBar.frame.size.height);
		}
	}
}

- (NSUInteger)selectedIndex
{
	return _selectedIndex;
}
- (UIViewController *)selectedViewController
{
    return [_viewControllers objectAtIndex:_selectedIndex];
}

-(void)setSelectedIndex:(NSUInteger)index
{
    [self displayViewAtIndex:index];
    [_tabBar selectTabAtIndex:index];
}

- (void)removeViewControllerAtIndex:(NSUInteger)index
{
    if (index >= [_viewControllers count])
    {
        return;
    }
    // Remove view from superview.
    [[(UIViewController *)[_viewControllers objectAtIndex:index] view] removeFromSuperview];
    // Remove viewcontroller in array.
    [_viewControllers removeObjectAtIndex:index];
    // Remove tab from tabbar.
    [_tabBar removeTabAtIndex:index];
}

- (void)insertViewController:(UIViewController *)vc withImageDic:(NSDictionary *)dict atIndex:(NSUInteger)index
{
    [_viewControllers insertObject:vc atIndex:index];
    [_tabBar insertTabWithImageDic:dict atIndex:index];
}


#pragma mark - Private methods
- (void)displayViewAtIndex:(NSUInteger)index
{
    // Before changing index, ask the delegate should change the index.
    if ([_delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)])
    {
        if (![_delegate tabBarController:self shouldSelectViewController:[self.viewControllers objectAtIndex:index]])
        {
            return;
        }
    }
    
    UIViewController *targetViewController = [self.viewControllers objectAtIndex:index];
    
    // If target index is equal to current index.
    if (_selectedIndex == index && [[_transitionView subviews] count] != 0)
    {
        if ([targetViewController isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController*)targetViewController popToRootViewControllerAnimated:YES];
        }
        return;
    }
    _selectedIndex = index;
    
	[_transitionView.subviews makeObjectsPerformSelector:@selector(setHidden:) withObject:@1];
    targetViewController.view.hidden = NO;
	targetViewController.view.frame = _transitionView.frame;
	if ([targetViewController.view isDescendantOfView:_transitionView])
	{
		[_transitionView bringSubviewToFront:targetViewController.view];
	}
	else
	{
		[_transitionView addSubview:targetViewController.view];
	}
    
    // Notify the delegate, the viewcontroller has been changed.
    if ([_delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)])
    {
        [_delegate tabBarController:self didSelectViewController:targetViewController];
    }
}

#pragma mark -
#pragma mark tabBar delegates
- (void)tabBar:(CustomTabBar *)tabBar didSelectIndex:(NSInteger)index
{
	[self displayViewAtIndex:index];
}
@end
