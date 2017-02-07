//
//  VKTabBarController.m
//  VKTabBarDemo
//
//  Created by Evan on 2017/2/7.
//  Copyright © 2017年 vanke. All rights reserved.
//

#import "VKTabBarController.h"
#import "ViewController.h"


@interface VKTabBarController ()

@end

@implementation VKTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self authenticatedControllers];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.tabBar.translucent = NO;
}


- (void)authenticatedControllers {
    
    //任务
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *missionPageNav = [storyBoard instantiateViewControllerWithIdentifier:@"homePageNav"];
    missionPageNav.tabBarItem = [self itemWithNormal:@"任务"
                                          nomalImage:@"house_tab_icon_normal.png"
                                            selected:@"house_tab_icon_selected.png"];
    missionPageNav.viewControllers[0].navigationItem.title = @"1";

    
    //验房
    UIStoryboard *missStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *mainPageNav = [missStoryboard instantiateViewControllerWithIdentifier:@"homePageNav"];
    mainPageNav.tabBarItem = [self itemWithNormal:@"验房"
                                       nomalImage:@"mission_tab_icon_normal.png"
                                         selected:@"mission_tab_icon_selected.png"];
    
    mainPageNav.viewControllers[0].navigationItem.title = @"2";

    //我
    UIStoryboard *meStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *mePageNav = [meStoryboard instantiateViewControllerWithIdentifier:@"homePageNav"];
    mePageNav.tabBarItem = [self itemWithNormal:@"我"
                                     nomalImage:@"me_tab_icon_normal.png"
                                       selected:@"me_tab_icon_selected.png"];
    mePageNav.viewControllers[0].navigationItem.title = @"3";
    self.viewControllers = @[missionPageNav, mainPageNav, mePageNav];
    self.selectedIndex = 0;

}


- (UITabBarItem *)itemWithNormal:(NSString *)title nomalImage:(NSString *)normalName selected:(NSString *)selectedName {
    
    UIImage *normal = [[UIImage imageNamed:normalName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selected = [[UIImage imageNamed:selectedName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:normal selectedImage:selected];
    NSDictionary *titleAttributs = @{NSForegroundColorAttributeName:[UIColor colorWithRed:29/255.0
                                                                                    green:185/255.0
                                                                                     blue:143/255.0 alpha:1.0]};
    [item setTitleTextAttributes:titleAttributs forState:UIControlStateSelected];
    return item;
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}

@end
