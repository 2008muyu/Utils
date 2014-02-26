//
//  UIViewController+UIUtils.m
//  B2B Demo
//
//  Created by mby on 14-1-13.
//  Copyright (c) 2014年 M3. All rights reserved.
//

#import "UIViewController+UIUtils.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIViewController (UIUtils)

//CustomBackButton
-(void)addNavigationCutomizedBackNone {
    UIButton* backButton =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 37, 28)];
    
    UIImage*buttonImage = [[UIImage imageNamed:@"NoneButton.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0.0];
    [backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    UIImage*buttonImage2 = [[UIImage imageNamed:@"NoneButton.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:0.0];
    
    [backButton setBackgroundImage:buttonImage2 forState:UIControlStateHighlighted];
    
    backButton.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
    backButton.titleLabel.textColor = [UIColor whiteColor];
    backButton.titleLabel.shadowOffset = CGSizeMake(0,-1);
    backButton.titleLabel.shadowColor = [UIColor darkGrayColor];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton setTitle:@"  " forState:UIControlStateNormal];
    backButton.layer.cornerRadius = 5.0;
    
    UIBarButtonItem *backItems = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem = backItems;
}

-(void)addNavigationCutomizedBack {
    UIButton* backButton =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 56, 31)];
    
    UIImage*buttonImage = [[UIImage imageNamed:@"back_button.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:0.0];
    [backButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    UIImage*buttonImage2 = [[UIImage imageNamed:@"back_button.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:0.0];
    
    [backButton setBackgroundImage:buttonImage2 forState:UIControlStateHighlighted];
    
    backButton.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
    backButton.titleLabel.textColor = [UIColor whiteColor];
    backButton.titleLabel.shadowOffset = CGSizeMake(0,-1);
    backButton.titleLabel.shadowColor = [UIColor darkGrayColor];
    backButton.backgroundColor = [UIColor clearColor];
    [backButton setTitle:@"  " forState:UIControlStateNormal];
    backButton.layer.cornerRadius = 5.0;
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItems = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    self.navigationItem.leftBarButtonItem = backItems;
}

-(void)backAction {
    NSLog(@"%@", self.class);
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)createNavigationLeftButton
{
    UIButton *mapButton =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 52 , 31)];
    
    UIImage *buttonImage = [[UIImage imageNamed:@"navigationButtonSider.png"] stretchableImageWithLeftCapWidth:15.0 topCapHeight:0.0 ];
    [mapButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    UIImage *buttonImage2 = [[UIImage imageNamed:@"navigationButtonSider.png"] stretchableImageWithLeftCapWidth:15.0 topCapHeight:0.0 ];
    [mapButton setBackgroundImage:buttonImage2 forState:UIControlStateHighlighted];
    
    mapButton.titleLabel.font = [UIFont boldSystemFontOfSize:[UIFont smallSystemFontSize]];
    mapButton.titleLabel.textColor = [UIColor whiteColor];
    mapButton.titleLabel.shadowOffset = CGSizeMake(0,-1);
    mapButton.titleLabel.shadowColor = [UIColor darkGrayColor];
    mapButton.backgroundColor = [UIColor clearColor];
    [mapButton
     setTitle:@"  " forState:UIControlStateNormal];
    mapButton.layer.cornerRadius = 5.0;
    [mapButton addTarget:self
                  action:@selector(otherAction)
        forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:mapButton ];
}

- (void)otherAction {
    
}

@end
