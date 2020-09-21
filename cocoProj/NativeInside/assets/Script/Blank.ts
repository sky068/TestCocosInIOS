/*
 * @Author: xujiawei 
 * @Date: 2020-09-18 16:41:12 
 * @Last Modified by: xujiawei
 * @Last Modified time: 2020-09-21 11:20:32
 * 
 * 空白场景，用来释放资源
 * 从游戏场景退回到iOS原生app时跳转到这个场景释放资源并停止游戏主循环
 */


const { ccclass, property } = cc._decorator;

@ccclass
export default class NewClass extends cc.Component {

    // LIFE-CYCLE CALLBACKS:

    // onLoad () {}

    start() {
        // 这是个空场景，可以直接释放所有资源
        cc.assetManager.releaseAll();

        if (cc.sys.isNative) {
            
            cc.director.once(cc.Director.EVENT_AFTER_DRAW, function () {
                for (var id in cc.game._persistRootNodes) {
                    cc.game.removePersistRootNode(cc.game._persistRootNodes[id]);
                }
    
                // Clear scene
                cc.director.getScene().destroy();
                cc.Object._deferredDestroy();
    
                // Clean up audio
                if (cc.audioEngine) {
                    cc.audioEngine.uncacheAll();
                }
                    
                cc.game.pause();
               
                cc.sys.garbageCollect();
    
                let ret = jsb.reflection.callStaticMethod("CocosMng", "exitCocosForJS"); 
                
            });
        }
    }

    // update (dt) {}
}
