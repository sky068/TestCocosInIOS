//
//  CocosMng.m
//  TestCocos
//
//  Created by 徐家伟 on 2020/9/16.
//  Copyright © 2020 徐家伟. All rights reserved.
//

#import "CocosMng.h"

#import "cocos2d.h"
#import "CocosAppDelegate.h"
#import "SDKWrapper.h"
#import "platform/CCApplication.h"
#import "platform/ios/CCEAGLView-ios.h"
#import "cocos/scripting/js-bindings/jswrapper/SeApi.h"
#import "GameViewController.h"

using namespace cocos2d;

static CocosMng * _instance = NULL;
static Application * _app = NULL;

@implementation CocosMng

+(instancetype)getInstance {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _instance = [[self alloc] init];
//    });
    
    if (!_instance) {
        _instance = [[CocosMng alloc]init];
    }
    
    return _instance;
}

+(void) destroyInstance {
    if (_instance != NULL) {
        _instance = NULL;
    }
}

+(CCEAGLView*)getCocosView {
    return (__bridge CCEAGLView *)cocos2d::Application::getInstance()->getView();
}

-(instancetype)init {
    self = [super init];
    if (self) {
        float scale = [[UIScreen mainScreen] scale];
        CGRect bounds = [[UIScreen mainScreen] bounds];
        // cocos2d application instance
        if (_app == NULL) {
            _app = new CocosAppDelegate(bounds.size.width * scale, bounds.size.height * scale);
            _app->setMultitouch(false);
        }
        
        [self setupCocos];
    }
    
    return self;
}

-(void)setupCocos {
    self.viewController = [[GameViewController alloc]init];
    [self.viewController setModalPresentationStyle:UIModalPresentationFullScreen];
}

-(void)startCocos {
    NSLog(@"start cocos.");
    
    _app->restart();
    return;
}

+ (void)exitCocosForJS {
    [[CocosMng getInstance]exitCocos];
}

- (void)exitCocos {
    if (_app == NULL) {
        return;
    }
    
    _app->end();
    [self.viewController dismissViewControllerAnimated:YES completion:NULL];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        se::ScriptEngine* se = se::ScriptEngine::getInstance();
//        se->clearException();
//        se->cleanup();
////        se::ScriptEngine::destroyInstance();
//    });
}

-(void)didEnterBackground {
    if (_app != NULL) {
        _app->onPause();
    }
}

-(void)willEnterForeground {
    if (_app != NULL) {
        _app->onResume();
    }
}

-(void)willTerminate {
    [self.viewController dismissViewControllerAnimated:YES completion:NULL];
    [CocosMng destroyInstance];
}


//
//- (void)statusBarOrientationChanged:(NSNotification *)notification {
//    if (_app == NULL) {
//        return;
//    }
//
//    CGRect bounds = [UIScreen mainScreen].bounds;
//    float scale = [[UIScreen mainScreen] scale];
//    float width = bounds.size.width * scale;
//    float height = bounds.size.height * scale;
//    Application::getInstance()->updateViewSize(width, height);
//}
//
//- (void)applicationWillResignActive:(UIApplication *)application {
//    /*
//     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
//     */
//    if (_app == NULL) {
//        return;
//    }
//
//    _app->onPause();
//    [[SDKWrapper getInstance] applicationWillResignActive:application];
//}
//
//- (void)applicationDidBecomeActive:(UIApplication *)application {
//    /*
//     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//     */
//    if (!_app) {
//        return;
//    }
//
//    _app->onResume();
//    [[SDKWrapper getInstance] applicationDidBecomeActive:application];
//}
//
//- (void)applicationDidEnterBackground:(UIApplication *)application {
//    /*
//     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
//     */
//    if (!_app) {
//        return;
//    }
//
//    [[SDKWrapper getInstance] applicationDidEnterBackground:application];
//}
//
//- (void)applicationWillEnterForeground:(UIApplication *)application {
//    /*
//     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
//     */
//    if (!_app) {
//        return;
//    }
//
//    [[SDKWrapper getInstance] applicationWillEnterForeground:application];
//}
//
//- (void)applicationWillTerminate:(UIApplication *)application
//{
//    if (!_app) {
//        return;
//    }
//
//    [[SDKWrapper getInstance] applicationWillTerminate:application];
////    delete _app;
////    _app = nil;
//}
//
//#pragma mark -
//#pragma mark Memory management
//
//- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
//    /*
//     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
//     */
//    NSLog(@"%s",__func__);
//}
//

@end
