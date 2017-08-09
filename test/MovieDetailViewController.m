//
//  MovieDetailViewController.m
//  test
//
//  Created by 华信科技 on 2017/8/3.
//  Copyright © 2017年 华信科技. All rights reserved.
//

#import "MovieDetailViewController.h"
#import <VTMagic/VTMagic.h>
#import "magicViewController.h"



@interface MovieDetailViewController ()<VTMagicViewDataSource,VTMagicViewDelegate>

@property (nonatomic, strong) magicViewController *chlidviewController;

@property (nonatomic, strong) VTMagicController *magicController;
@property (nonatomic, strong) UILabel * mlabel;
@property (nonatomic, strong)  NSArray *menuList;

@end

@implementation MovieDetailViewController


@synthesize message;
@synthesize detailLabel;


UILabel* label=nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    初始化分布标签
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self addChildViewController:self.magicController];
    [self.view addSubview:_magicController.view];
    [self.view setNeedsUpdateConstraints];
    
    _menuList = @[@"详情", @"热门", @"相关", @"聊天"];
    [_magicController.magicView reloadData];
    
    
}


- (void)updateViewConstraints {
    UIView *magicView = _magicController.view;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[magicView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(magicView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-200-[magicView]-0-|"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(magicView)]];
    
    [super updateViewConstraints];
}



#pragma mark - VTMagicViewDataSource
- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView {
    return _menuList;
}


- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex
{
    static NSString *itemIdentifier = @"itemIdentifier";
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    
    if (!menuItem) {
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem setTitleColor:RGBCOLOR(50, 50, 50) forState:UIControlStateNormal];
        [menuItem setTitleColor:RGBCOLOR(169, 37, 37) forState:UIControlStateSelected];
        menuItem.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:16.f];
    }
    
    
    return menuItem;
}

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex
{
    if(self.chlidviewController ==nil){
        self.chlidviewController = [magicViewController new];
    }
    return self.chlidviewController;
}





//viewWillAppear这个方法每次视图加载都会执行，而viewDidLoad方法只有在第一次加载时才会执行。
- (void)viewWillAppear:(BOOL)animated{
    

    
    detailLabel.text =  message;
    
    if(_mlabel == nil){
        _mlabel=[[UILabel alloc]init];
    }
    _mlabel.frame=CGRectMake(100, 50, 200, 100);
    _mlabel.text=message;
    [self.view addSubview:_mlabel];
    
    //    NSLog(message);
    
    [super viewWillAppear:animated];
    


}


- (void)viewDidUnload{
    self.detailLabel = nil;
    self.message = nil;
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




#pragma mark - accessor methods
- (VTMagicController *)magicController {
    if (!_magicController) {
        _magicController = [[VTMagicController alloc] init];
        _magicController.view.translatesAutoresizingMaskIntoConstraints = NO;
        _magicController.magicView.navigationColor = [UIColor whiteColor];
        _magicController.magicView.sliderColor = RGBCOLOR(169, 37, 37);
        _magicController.magicView.switchStyle = VTSwitchStyleStiff;
        _magicController.magicView.layoutStyle = VTLayoutStyleDivide;
        _magicController.magicView.navigationHeight = 40.f;
        _magicController.magicView.sliderExtension = 10.f;
        _magicController.magicView.dataSource = self;
        _magicController.magicView.delegate = self;
    }
    return _magicController;
}





@end
