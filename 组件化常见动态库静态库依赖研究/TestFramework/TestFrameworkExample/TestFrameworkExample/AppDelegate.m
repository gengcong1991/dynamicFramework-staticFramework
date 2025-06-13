//
//  AppDelegate.m
//  TestFrameworkExample
//
//  Created by 耿葱 on 2025/6/12.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "YYCache/YYCache.h"
#import <TestFramework/Test.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc]init] ];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    YYCache *cache = [YYCache cacheWithName:@"Test"];
    [cache setObject:@"asdasd" forKey:@"112233"];
    
    [Test jsonToModel];
    [Test testShowHUD];
    return YES;
}


@end
