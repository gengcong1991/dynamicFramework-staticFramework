//
//  ViewController.m
//  TestFrameworkExample
//
//  Created by 耿葱 on 2025/6/12.
//

#import "ViewController.h"
#import "YYCache/YYCache.h"
#import <TestFramework/Test.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 50, 100)];
    label.text = @"Test";
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    
    
    YYCache *cache = [YYCache cacheWithName:@"Test"];
    NSString *str = ((NSString *)[cache objectForKey:@"112233"]);
    NSLog(@"str = %@",str);
    
    [Test modelToJson];
    [Test testHiddenHUD];
    // Do any additional setup after loading the view.
}


@end
