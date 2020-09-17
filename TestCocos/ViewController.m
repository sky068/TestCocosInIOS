//
//  ViewController.m
//  TestCocos
//
//  Created by 徐家伟 on 2020/9/15.
//  Copyright © 2020 徐家伟. All rights reserved.
//

#import "ViewController.h"
#import "CocosMng.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"view did load");
}

- (IBAction)startCocos:(id)sender {
    [self presentViewController:[CocosMng getInstance].viewController animated:YES completion:nil];
    NSLog(@"启动cocos引擎");
    [[CocosMng getInstance] startCocos];
}


@end
