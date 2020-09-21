const {ccclass, property} = cc._decorator;

@ccclass
export default class Helloworld extends cc.Component {

    @property(cc.Label)
    label: cc.Label = null;

    @property
    text: string = 'hello';

    start () {
        cc.game.setFrameRate(30);
        cc.debug.setDisplayStats(true);

        // init logic
        for (let i = 1; i<78; i++) {
            let node = new cc.Node();
            node.parent = this.node;
            let sp: cc.Sprite = node.addComponent(cc.Sprite);
            let file = "buildings/test" + i;
            cc.resources.load(file, cc.SpriteFrame, (err, spf: cc.SpriteFrame)=>{
                if (err) {
                    cc.log(err);
                    return;
                }
                sp.spriteFrame = spf;
            });
        }

        cc.game.on(cc.game.EVENT_HIDE, ()=>{
            cc.log('-----game hide');
        }, this);

        cc.game.on(cc.game.EVENT_SHOW, ()=>{
            cc.log('-----game show');
        }, this);
    }

    back2App() {
        cc.log('返回app');
        cc.director.loadScene("blank");
    }
}
