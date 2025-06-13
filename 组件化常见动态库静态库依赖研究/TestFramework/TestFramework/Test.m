//
//  Test.m
//  DynamicDependDynamic
//
//  Created by 耿葱 on 2025/6/12.
//

#import "Test.h"
#import <MJExtension/MJExtension.h>
#import <MBProgressHUD/MBProgressHUD.h>
#define PH_NEW_KEY_WINDOW ({\
UIWindow *keyWindow = nil;\
if ([UIApplication sharedApplication].delegate.window) {\
    keyWindow = [UIApplication sharedApplication].delegate.window;\
} else if (@available(iOS 15, *)) {\
    for (UIScene *scene in [UIApplication sharedApplication].connectedScenes) {\
        if (scene.activationState == UISceneActivationStateForegroundActive && [scene isKindOfClass:[UIWindowScene class]]) {\
            UIWindowScene *windowScene = (UIWindowScene *)scene;\
            for (UIWindow *window in windowScene.windows) {\
                if (window.isKeyWindow) {\
                    keyWindow = window;\
                    break;\
                }\
            }\
        }\
    }\
} else {\
    _Pragma("clang diagnostic push")\
    _Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"")\
    for (UIWindow *window in [UIApplication sharedApplication].windows) {\
        if (window.isKeyWindow) {\
            keyWindow = window;\
            break;\
        }\
    }\
    _Pragma("clang diagnostic pop")\
}\
keyWindow;\
})
@interface Test ()
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,assign) NSInteger age;
@end

@implementation Test
MJCodingImplementation
+ (void)testShowHUD {
    NSLog(@"testShowHUD");
    [MBProgressHUD showHUDAddedTo:PH_NEW_KEY_WINDOW animated:YES];
}

+ (void)testHiddenHUD {
    NSLog(@"testHiddenHUD");
    [MBProgressHUD hideAllHUDsForView:PH_NEW_KEY_WINDOW animated:YES];
}

+ (void)jsonToModel {
    // 最简单的字典转模型测试
    NSDictionary *dict = @{
        @"name" : @"Jack",
        @"icon" : @"lufy.png",
        @"age" : @20
    };
    Test *test = [Test mj_objectWithKeyValues:dict];
    NSLog(@"test.name = %@,test.icon = %@,test.age = %ld",test.name,test.icon,test.age);
}

+ (void)modelToJson {
    // 将模型转为字典
    Test *test = [[Test alloc] init];
    test.name = @"Jack";
    test.icon = @"lufy.png";
    test.age = 15;
    NSDictionary *dict = test.mj_keyValues;
    NSLog(@"dict = %@",dict);
}

@end
