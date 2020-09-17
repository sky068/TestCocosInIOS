//
//  GameViewController.m
//  TestCocos
//
//  Created by 徐家伟 on 2020/9/17.
//  Copyright © 2020 徐家伟. All rights reserved.
//

#import "GameViewController.h"
#import "CocosMng.h"

@interface GameViewController ()

@end

@implementation GameViewController

//- (void) loadView {
//    UIView *cocosViw = [CocosMng getCocosView];
//    if (cocosViw != nil) {
//        self.view = [CocosMng getCocosView];
//    } else {
//        NSLog(@"初始化cocos view失败!");
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self dismissViewControllerAnimated:YES completion:NULL];
//        });
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"---%s", __func__);
    
    // Do any additional setup after loading the view.
    // 支持多个view
//    self.view.backgroundColor = [[UIColor alloc] initWithRed:160 / 255.0 green:140 / 255.0 blue:255 / 255.0 alpha:1];
//    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"上课背景图"].CGImage);
//    //    ((GLKView *)self.view).delegate = self;
//    if ([[UIDevice currentDevice].model isEqualToString:@"iPhone"]) {
//        self.view.layer.contents = nil;
//        self.view.backgroundColor = [UIColor blackColor];
//    }
    
//    UIView *videoView = [[UIView alloc] initWithFrame:CGRectMake(50, 70, 150, 150)];
//    [self.view addSubview:videoView];
//    videoView.tag = kPTGameVideoPlayerViewTag;
    
    UIView *_cocosView = [CocosMng getCocosView];
    if (_cocosView == NULL) {
        NSLog(@"创建cocos view失败！");
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:true completion:NULL];
        });
        return;
    }
    _cocosView.frame = self.view.bounds;
    _cocosView.backgroundColor = UIColor.clearColor;
    [self.view addSubview:_cocosView];
    
    
//    UIView *courseVideoView = [[UIView alloc] initWithFrame:CGRectZero];
//    [self.view addSubview:courseVideoView];
//    courseVideoView.tag = kPTGameCourseVideoPlayerViewTag;
    
//
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [PTNativeFunc showNoRecordToast:@"为保证您的上课体验，建议您使用更高性能的设备上课！"];
//    });
    
//    [PTNativeFunc onNetBlock:^{
//        [PTCocos2D onNoNetShowDialog];
//    }];
    
    [[UIApplication sharedApplication] setStatusBarHidden:true];
}

- (BOOL)prefersStatusBarHidden {
     return YES;
}

- (BOOL)prefersHomeIndicatorAutoHidden {
    return YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"---%s", __func__);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"---%s", __func__);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"---%s", __func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"---%s", __func__);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
    NSLog(@"---%s", __func__);
}

- (void)becomeActive {
    NSLog(@"---%s", __func__);
}

- (void)willResginActive {
    NSLog(@"---%s", __func__);
}

- (void)willEnterForeground {
    NSLog(@"---%s", __func__);
}

- (void)didEnterBackground {
    NSLog(@"---%s", __func__);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
