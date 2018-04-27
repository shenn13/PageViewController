//
//  TestViewController.m
//  PageViewController
//
//  Created by GuoMeng on 2018/4/27.
//  Copyright © 2018年 增光. All rights reserved.
//

#import "TestViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
@interface TestViewController ()

@property (nonatomic, strong) NSArray *titleData;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"delegate";
    
}

#pragma mark 标题数组
- (NSArray *)titleData {
    if (!_titleData) {
        _titleData = @[@"单曲", @"详情", @"歌词",@"歌词"];
    }
    return _titleData;
}
#pragma mark 初始化代码
- (instancetype)init {
    if (self = [super init]){
        
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.menuViewStyle = WMMenuViewStyleFloodHollow;
//        WMMenuViewStyleDefault,      // 默认
//        WMMenuViewStyleLine,         // 带下划线 (若要选中字体大小不变，设置选中和非选中大小一样即可)
//        WMMenuViewStyleTriangle,     // 三角形 (progressHeight 为三角形的高, progressWidths 为底边长)
//        WMMenuViewStyleFlood,        // 涌入效果 (填充)
//        WMMenuViewStyleFloodHollow,  // 涌入效果 (空心的)
//        WMMenuViewStyleSegmented,    // 涌入带边框,即网易新闻选项卡

        self.menuItemWidth = [UIScreen mainScreen].bounds.size.width / self.titleData.count;
        self.menuHeight = 50;
    }
    return self;
    
}

#pragma mark - Datasource & Delegate
#pragma mark 返回子页面的个数
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleData.count;
    
}
#pragma mark 返回某个index对应的页面
- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    switch (index) {
        case 0:{
            FirstViewController *vcClass = [[FirstViewController alloc] init];
            return vcClass;
            
        } break;
        case 1:{
            SecondViewController *vcClass = [SecondViewController new];
            return vcClass;
            
        } break; case 2:{
            ThirdViewController *vcClass = [ThirdViewController new];
            return vcClass;
            
        } break; default:{
            FourViewController *vcClass = [FourViewController new];
            return vcClass;
            
        } break;
    }
    
}
#pragma mark 返回index对应的标题
- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleData[index];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
