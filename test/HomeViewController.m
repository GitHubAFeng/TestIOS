//
//  HomeViewController.m
//  test
//
//  Created by 华信科技 on 2017/8/9.
//  Copyright © 2017年 华信科技. All rights reserved.
//

#import "HomeViewController.h"
#import "magicViewController.h"
#import "MovieHomeViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong)  NSArray *menuList;
@property (nonatomic, assign)  BOOL autoSwitch;
@property (nonatomic, strong) MovieHomeViewController *movieHomeView;

@end

@implementation HomeViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeAll;  //视图布满屏幕

    [self initMagicPage];
    [self integrateComponents];
    [self addNotification];
    
    [self.magicView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)initMagicPage{
    
    //    self.magicView.bounces = YES;
    //    self.magicView.headerHidden = NO;
    //    self.magicView.itemSpacing = 20.f;
    //    self.magicView.switchEnabled = YES;
    //    self.magicView.separatorHidden = NO;
    //    self.magicView.acturalSpacing = 10;
    self.magicView.itemScale = 1.2;
    self.magicView.headerHeight = 40;
    self.magicView.navigationHeight = 44;
    self.magicView.againstStatusBar = YES;
    //    self.magicView.sliderExtension = 5.0;
    //    self.magicView.switchStyle = VTSwitchStyleStiff;
    //    self.magicView.navigationInset = UIEdgeInsetsMake(0, 50, 0, 0);
    self.magicView.headerView.backgroundColor = RGBCOLOR(243, 40, 47);
    self.magicView.navigationColor = [UIColor whiteColor];
    self.magicView.layoutStyle = VTLayoutStyleDefault;
    
    //    UIImageView *separatorView = [[UIImageView alloc] init];
    //    [self.magicView setSeparatorView:separatorView];
    self.magicView.separatorHeight = 2.f;
    self.magicView.separatorColor = RGBCOLOR(22, 146, 211);
    self.magicView.navigationView.layer.shadowColor = RGBCOLOR(22, 146, 211).CGColor;
    self.magicView.navigationView.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.magicView.navigationView.layer.shadowOpacity = 0.8;
    self.magicView.navigationView.clipsToBounds = NO;
    
}


- (void)integrateComponents {
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [rightButton addTarget:self action:@selector(subscribeAction) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitleColor:RGBACOLOR(169, 37, 37, 0.6) forState:UIControlStateSelected];
    [rightButton setTitleColor:RGBCOLOR(169, 37, 37) forState:UIControlStateNormal];
    [rightButton setTitle:@"+" forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont boldSystemFontOfSize:28];
    rightButton.center = self.view.center;
    self.magicView.rightNavigatoinItem = rightButton;
}



#pragma mark - NSNotification
- (void)addNotification {
    [self removeNotification];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(statusBarOrientationChange:)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
}

- (void)removeNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

- (void)statusBarOrientationChange:(NSNotification *)notification {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];
}



#pragma mark - actions
- (void)subscribeAction {
    NSLog(@"subscribeAction");
    // against status bar or not
    //    self.magicView.againstStatusBar = !self.magicView.againstStatusBar;
    [self.magicView setHeaderHidden:!self.magicView.isHeaderHidden duration:0.35];
}


#pragma mark - VTMagicViewDataSource
- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView {
    _menuList = @[@"详情", @"热门", @"相关", @"聊天"];
    return _menuList;
}



- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex {
    static NSString *itemIdentifier = @"itemIdentifier";
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem setTitleColor:RGBCOLOR(50, 50, 50) forState:UIControlStateNormal];
        [menuItem setTitleColor:RGBCOLOR(169, 37, 37) forState:UIControlStateSelected];
        menuItem.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15.f];
    }
    // 默认会自动完成赋值
    //    MenuInfo *menuInfo = _menuList[itemIndex];
    //    [menuItem setTitle:menuInfo.title forState:UIControlStateNormal];
    return menuItem;
}

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex {

       magicViewController *testview = [magicViewController new];
    if(self.movieHomeView == nil){
        self.movieHomeView = [MovieHomeViewController new];
    }
    
    switch (pageIndex) {
        case 0:
         
             return self.movieHomeView ;
            
            break;
            
        default:
            return testview;
            break;
    }
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
