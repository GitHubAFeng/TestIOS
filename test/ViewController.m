//
//  ViewController.m
//  test
//
//  Created by 华信科技 on 2017/7/31.
//  Copyright © 2017年 华信科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)testbtn:(id)sender {
    UILabel *find_label = (UILabel *)[self.view viewWithTag:100];
    
    [find_label setText:(@"你好")];
    

}








@end
