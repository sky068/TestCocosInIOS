#### 测试cocoscreator和原生iOS进行集成，使用cocoscreator 2.4.0。

cocosProj下为cocoscreator游戏工程，TestCocos为原生iOS工程，cocos文件夹下为cocos游戏发布后的iOS工程部分文件，每次修改游戏后重新发布，然后把build目录下的assets、src文件夹以及main.js、project.json拷贝到cocos目录下对应的位置进行替换即可。



由于cocos2d-x引擎文件比较大就没上传，只需把2.4.0对应的cocos2d-x放到cocos/frameworks目录下即可，另外要修改CCApplication-ios.mm文件里的end方法： 

```C++
void Application::end()
{
    //    delete this;
    //
    //    exit(0);
    
    // 上面是原来的样子
#if USE_AUDIO
    AudioEngine::end();
#endif
    // stop main loop
    [(MainLoop*)_delegate stopMainLoop];
}
```



