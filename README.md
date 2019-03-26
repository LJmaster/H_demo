# H_demo
项目  初始框架 
项目的viewcontroller 需要继承自 RootViewController

base :
   view  ：（button  图片跟文字位置 
             阴影圆角view
             基础view label，imagev，button等类创建方式
            ）
navigation：自定义的大title


1.HNormalNavView  ：普通NavView
     
     /**
 在滚代理方法里面获取偏移量
 根据变化偏移量设置导航UI效果animation
 
 @param yOffset 变化偏移量
 */
- (void)dynamicNavViewAnimationWithYoffset:(CGFloat)yOffset withView:(UIView *)view;
2.HDynmaicBigNavView ：仿写bigtitle NavView
/**设置导航返回名称*/
@property (nonatomic, strong) NSString *backButtonTitle;
/**右侧View*/
@property (nonatomic, strong) UIView * titleRightView;
/**小标题*/
@property (nonatomic, copy) NSString * detaileTitle;
/**设置导航标题*/
@property (nonatomic, copy) NSString * bigTitle;
/**是否隐藏返回按钮 ，默认不隐藏 NO*/
@property (nonatomic, assign) BOOL     isBackButtonHide;
/**设置背景颜色*/
@property (nonatomic, strong) UIColor * changebackgroundColor;
/**设置背景图片*/
@property (nonatomic, strong) UIImage * changebackgroundImage;
/**标题颜色*/
@property (nonatomic, strong) UIColor * titleColor;
/**小标题颜色*/
@property (nonatomic, strong) UIColor * detaileTitleColor;

/**
 滑动隐藏头标题（全部隐藏）

 @param yOffset yOffset
 @param view 滑动的view
 */
- (void)dynamic_allNavViewAnimationWithYoffset:(CGFloat)yOffset withView:(UIView *)view;

/**
 滑动隐藏头标题（大标题变为小标题，悬浮）

 @param yOffset yOffset
 @param view 滑动的view
 */
- (void)dynamic_suspensionNavViewAnimationWithYoffset:(CGFloat)yOffset withView:(UIView *)view;

Define 宏定义

Analysis_tongji    埋点统计 





# testgit-user
# testgit-user
