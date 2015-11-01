//
//  HHLTabBarVC.m
//  OCSina
//
//  Created by 呆萌诺 on 15/10/31.
//  Copyright © 2015年 呆萌诺. All rights reserved.
//

#import "HHLTabBarVC.h"
#import "HHLHomeVC.h"
#import "HHLMeVC.h"
#import "HHLMessageVC.h"
#import "HHLDiscoverVC.h"
#import "HHLPlusButton.h"

@interface HHLTabBarVC ()

@property (nonatomic,strong) UIButton *plusButton;

@end

@implementation HHLTabBarVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //在viewDidLoad中加按钮，按钮是添加到tabBar下面
    //添加加号按钮
    [self.tabBar addSubview:self.plusButton];
    

}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBar.tintColor = [UIColor orangeColor];
    
    HHLHomeVC *homeVC = [[HHLHomeVC alloc] init];
    [self addChildViewController:homeVC andTitle:@"首页" andImgName:@"tabbar_home" andselImgName:@"tabbar_home_selected"];
    
    HHLMeVC *meVC = [[HHLMeVC alloc] init];
    [self addChildViewController:meVC andTitle:@"我" andImgName:@"tabbar_message_center" andselImgName:@"tabbar_message_center_selected"];
    
    //添加加号按钮，使用添加一个控制器占位
    HHLPlusButton *plusBtn = [[HHLPlusButton alloc] init];
    //直接设置图片会传位，所以创建一个按钮添加到上面
//    [self addChildViewController:plusBtn andTitle:@"" andImgName:@"tabbar_compose_button" andImgName:@"tabbar_compose_button_highlighted"];
    [self addChildViewController:plusBtn andTitle:@"" andImgName:@"j" andselImgName:@"j"];
    
    
    HHLMessageVC *messageVC = [[HHLMessageVC alloc] init];
    [self addChildViewController:messageVC andTitle:@"消息" andImgName:@"tabbar_discover" andselImgName:@"tabbar_discover_selected"];
    
    HHLDiscoverVC *discoverVC = [[HHLDiscoverVC alloc] init];
    [self addChildViewController:discoverVC andTitle:@"发现" andImgName:@"tabbar_profile" andselImgName:@"tabbar_profile_selected"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addChildViewController:(UIViewController *)childController andTitle:(NSString *)title andImgName:(NSString *)norImgName andselImgName:(NSString *)selImgName{
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childController];
    childController.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:norImgName];
    //貌似没效果
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selImgName];
    
//    设置点击高亮模式 默认是渲染成蓝色（设置成渲染橙色）
//    UIImage *selImg = [UIImage imageNamed:selImgName];
//    //取消对图片自动渲染
//    selImg = [selImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    nav.tabBarItem.selectedImage = selImg;
    
    
    [self addChildViewController:nav];
}



//按钮点击事件
-(void)plusButtonAction{
    NSLog(@"plusButtonAction");
}



#pragma mark - ss
-(UIButton *)plusButton{
    if(! _plusButton) {
        
        //计算设置空间的frame
        CGFloat btnW = [UIScreen mainScreen].bounds.size.width / 5;
        CGFloat btnH = self.tabBar.frame.size.height;
        self.plusButton = [[UIButton alloc] initWithFrame:CGRectMake(btnW * 2  , 0, btnW , btnH)];
    
        //设置按钮的状态图片
        [_plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [_plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"]forState:UIControlStateNormal];
        [_plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        [_plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        //添加点击事件
        [self.plusButton addTarget:self action:@selector(plusButtonAction) forControlEvents:UIControlEventTouchUpInside];
       
    }
    return _plusButton;
}



@end
