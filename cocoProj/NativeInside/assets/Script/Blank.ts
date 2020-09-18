/*
 * @Author: xujiawei 
 * @Date: 2020-09-18 16:41:12 
 * @Last Modified by: xujiawei
 * @Last Modified time: 2020-09-18 16:42:56
 * 
 * 空白场景，用来释放资源
 * 从游戏场景退回到iOS原生app时跳转到这个场景然后停止游戏主循环
 */


const { ccclass, property } = cc._decorator;

@ccclass
export default class NewClass extends cc.Component {

    // LIFE-CYCLE CALLBACKS:

    // onLoad () {}

    start() {
        cc.assetManager.releaseAll();
        cc.game.pause();

        if (cc.sys.isNative) {
            // 这里不要用schedule，因为销毁本场景时会报错，延迟一帧gc才能及时生效
            setTimeout(() => {
                cc.director.getScene().destroy();
                cc.Object._deferredDestroy();
        
                // Clean up audio
                if (cc.audioEngine) {
                    cc.audioEngine.uncacheAll();
                }
        
                cc.sys.garbageCollect();
    
                let ret = jsb.reflection.callStaticMethod("CocosMng", "exitCocosForJS"); 
            }, 50);
        }
    }

    // update (dt) {}
}
