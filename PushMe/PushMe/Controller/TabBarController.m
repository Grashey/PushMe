//
//  TabBarController.m
//  PushMe
//
//  Created by Aleksandr Fetisov on 18.03.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "TabBarController.h"
#import "MainViewController.h"
#import "NewsViewController.h"
#import "MapViewController.h"


@interface TabBarController ()

@end

@implementation TabBarController

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.viewControllers = [self createViewControllers];
        self.tabBar.tintColor = [UIColor blackColor];
    }
    return self;
}

- (NSArray<UIViewController*> *)createViewControllers {
    NSMutableArray<UIViewController*> *controllers = [NSMutableArray new];
    
    MainViewController *mainViewController = [[MainViewController alloc] init];
    mainViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:(UITabBarSystemItemSearch) tag:0];
    UINavigationController *mainNavigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    [controllers addObject:mainNavigationController];
    
    MapViewController *mapViewController = [[MapViewController alloc] init];
    mapViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:(UITabBarSystemItemFeatured) tag:1];
    UINavigationController *mapNavigationController = [[UINavigationController alloc] initWithRootViewController:mapViewController];
    [controllers addObject:mapNavigationController];
    
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    newsViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:(UITabBarSystemItemMore) tag:2];
    UINavigationController *newsNavigationController = [[UINavigationController alloc] initWithRootViewController:newsViewController];
    [controllers addObject:newsNavigationController];
    
    return controllers;
}

@end
