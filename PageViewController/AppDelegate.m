//
//  AppDelegate.m
//  PageViewController
//
//  Created by GuoMeng on 2018/4/23.
//  Copyright © 2018年 增光. All rights reserved.
//

#import "AppDelegate.h"
#import "WMPageController.h"
#import "ViewController.h"
#import "MainViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (WMPageController *)createPages {
    //WMPageController中包含的页面数组
    NSArray *controllers = [NSArray arrayWithObjects:[ViewController class], [MainViewController class], nil];
    //WMPageController控件的标题数组
    NSArray *titles = [NSArray arrayWithObjects:@"体育新闻", @"娱乐新闻", nil];
    //用上面两个数组初始化WMPageController对象
    WMPageController *pageController = [[WMPageController alloc] initWithViewControllerClasses:controllers andTheirTitles:titles];
    pageController.menuViewStyle = WMMenuViewStyleLine;
    pageController.titleColorSelected = [UIColor whiteColor];
    pageController.titleColorNormal = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
    pageController.progressColor = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1]; //
    pageController.itemsWidths = @[@(120),@(120)];
    // 这里可以设置不同的宽度
    //设置WMPageController每个标题的宽度
    pageController.menuItemWidth = 375/2;
    //设置WMPageController标题栏的高度
//    pageController.menuHeight = 35;
    pageController.menuHeight = 50;
    pageController.postNotification = YES;
    //设置WMPageController选中的标题的颜色
    pageController.titleColorSelected = [UIColor colorWithRed:200 green:0 blue:0 alpha:1];
    return pageController;

}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    WMPageController *page = [self createPages];
    page.title = @"title";
    UINavigationController *na = [[UINavigationController alloc] initWithRootViewController:page];
    self.window.rootViewController = na;
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
