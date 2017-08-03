//
//  MovieDetailViewController.m
//  test
//
//  Created by 华信科技 on 2017/8/3.
//  Copyright © 2017年 华信科技. All rights reserved.
//

#import "MovieDetailViewController.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController


@synthesize message;
@synthesize detailLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    
}

//viewWillAppear这个方法每次视图加载都会执行，而viewDidLoad方法只有在第一次加载时才会执行。
- (void)viewWillAppear:(BOOL)animated{
    detailLabel.text =  message;
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

@end
