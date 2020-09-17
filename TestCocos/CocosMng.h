//
//  CocosMng.h
//  TestCocos
//
//  Created by 徐家伟 on 2020/9/16.
//  Copyright © 2020 徐家伟. All rights reserved.
//
//  cocos引擎管理器，负责iOS启动、退出以及管理cocos引擎
//

#ifndef CocosMng_h
#define CocosMng_h

#import <UIKit/UIKit.h>

#include "platform/ios/CCEAGLView-ios.h"

@interface CocosMng : NSObject
{
}

@property(nonatomic, retain) UIViewController* viewController;

+(instancetype)getInstance;
+(void) destroyInstance;
-(instancetype)init;
-(void)startCocos; // 启动cocos游戏引擎
-(void)exitCocos;  // 退出cocos游戏引擎
+(void)exitCocosForJS;   // 给js调用，js只能调用静态方法

+(CCEAGLView *)getCocosView;

-(void)didEnterBackground;
-(void)willEnterForeground;
-(void)willTerminate;


@end


#endif /* CocosMng_h */
