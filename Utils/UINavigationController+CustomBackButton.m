
#import "UINavigationController+CustomBackButton.h"
#import "UIViewController+UIUtils.h"
@implementation UINavigationController (CustomBackButton)

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg"] forBarMetrics: UIBarMetricsDefault];
    
    //设置导航条title属性
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                              [UIFont boldSystemFontOfSize:18], UITextAttributeFont,
                                              [UIColor whiteColor],UITextAttributeTextColor,
                                              nil];
    
    UISwipeGestureRecognizer *swipeGR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(pop)];
    swipeGR.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGR];
}

- (void)pop
{
    [self popViewControllerAnimated:YES];
}

- (void)pushViewControllerWithCustomBackButton:(UIViewController *)viewController animated:(BOOL)animated {
    [self pushViewController:viewController animated:animated];
    [viewController addNavigationCutomizedBack];
}

- (void)pushViewControllerWithNoneBackButton:(UIViewController *)viewController animated:(BOOL)animated {
    [self pushViewController:viewController animated:animated];
    [viewController addNavigationCutomizedBackNone];
}

@end
