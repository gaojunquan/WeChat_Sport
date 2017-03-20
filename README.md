# iOS 教你如何修改微信运动步数

![占领效果](http://upload-images.jianshu.io/upload_images/1982600-819e0dfb62b016b5.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**说明**相信喜欢逆向工程的小伙伴已经对微信自动抢红包插件有所耳闻了,或者可以说,已经被广泛的传播了,但笔者发现,其实只有两篇是原创的,其余均为疯狂转载.看了下网上对于微信的"喜爱"目前只有抢红包这块,所以为大家带来另一个实用性技能---修改微信运动参数,妈妈在也不用担心我把手机绑在狗腿上了!

### 正文
---
言归正传,本文只针对于初识逆向工程的热爱着,大神勿喷,交流讨论可以提个Issue, 如果star一下就更完美了.

**硬件工具**:最好是有一台越狱后的iPhone手机,没有也没有关系,后续补充非越狱环境开发,本文针对于Theos下Tweak编码<本文使用的测试机iPhone 5c和一台没用上的iPhone 5s, ps:别问为什么没用上还提, 因为写到这里,控制不住装逼的念头,好了不开玩笑了!>

**软件工具**:已经有高(hao)人为我们写好了开发工具的配置和安装,只是一个软件的安装所以本人没必要踩在前辈的肩膀上继续深造, 教程地址, 稍等,我们还需要安装一个查看微信头文件的宝物:class-dump, 当然了,使用它的前提是需要进行砸壳后的app才可以正确导出头文件,至于怎么砸壳,谷歌肯定能帮到你,目前能谷歌到的我们不做深究,只谈目前没有公开的

## 硬件软件已经准备就绪
---

### 思考功能怎么实现
在我们的iOS系统本身, 有一个运动与健康,这里记录了我们每天的步数行为等等, 那么微信运动排行榜在对好友们的步数进行排榜的时候肯定需要去取数据, 那么从哪取呢?毋庸置疑,去运动与健康取,如果我们能在微信取数据的时候进行动态劫持,伪造一个假数据传给微信,那么是不是就大功告成了呢? 答案: if(YES){NSLog(@"是的");}

#### 观察微信头文件
**使用 class-dump -H WeChat.app -o WeChatHead命令导出微信头文件**

真的是巨多无比,几千个.h
![WeChat.hs](http://upload-images.jianshu.io/upload_images/1982600-e2f9be4b219dad8a.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**我们发现在WCDeviceStepObject这个类里面有几个很显眼的属性m7StepCount,hkStepCount 等.   如下:**
![关键类](http://upload-images.jianshu.io/upload_images/1982600-3ed44a3ed93afcba.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

**关键字"stepCount"的中文是"步数",那么这个是不是我们要劫持并修改的参数呢? 多说无益,试试就知道了.**

#### 创建一个Tweak工程, 如下
![tweak](http://upload-images.jianshu.io/upload_images/1982600-b9c35ebf5fb247cb.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
#### 编写Tweak.xm文件, 如下
![code](http://upload-images.jianshu.io/upload_images/1982600-79a4ead9301c9ea6.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
上图我们返回"98800" 步数以做测试
#### 执行命令 make package install 并在测试机中查看结果
![结果](http://upload-images.jianshu.io/upload_images/1982600-7c429a1dc2fc4fdf.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
大功告成, 排行榜的封面以后都由你来控制了, 你可以打出"广告招租,5元包月" "走丢了"等文字娱乐眼球.
### 总结
>**逆向开发资料较少, 很多问题都需要自己去解决,只要是你坐住了板凳去研究它, 终会有所回报!
     if you like, give me a star !**
