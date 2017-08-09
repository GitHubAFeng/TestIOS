//
//  RootViewControllerTableViewController.m
//  test
//
//  Created by 华信科技 on 2017/8/2.
//  Copyright © 2017年 华信科技. All rights reserved.
//

#import "MovieHomeViewController.h"
#import "MovieViewController.h"
#import "AppDelegate.h"


@interface MovieHomeViewController ()


@end


@implementation MovieHomeViewController

@synthesize controllerlist;




- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;


    self.title = @"分类";
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    
    //电影
    MovieViewController *movieViewController = [[MovieViewController alloc]
                                                initWithStyle:UITableViewStylePlain];
    movieViewController.title = @"电影列表";
    [array addObject:movieViewController];
    
    
    self.controllerlist = array;
    
    
    
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.controllerlist = nil;
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [controllerlist count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *RootTableViewCell = @"RootTableViewCell";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:RootTableViewCell];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RootTableViewCell forIndexPath:indexPath];
    
    
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:RootTableViewCell];
    }
    
    NSUInteger row = [indexPath row];
    UITableViewController *controller = [controllerlist objectAtIndex:row];
    cell.textLabel.text = controller.title;
    //accessoryType就表示每行右边的图标
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSUInteger row = [indexPath row];
    UITableViewController *nextController = [self.controllerlist objectAtIndex:row];
    
    if(self.navigationController==nil){
//        AppDelegate *appDelegate=[[UIApplication sharedApplication] delegate];
//        self.navigationController = appDelegate.navController;
        NSLog(@"self.navigationController 为空");
    }
    
    [self.navigationController pushViewController:nextController animated:(YES)];
    
    NSLog(@"进行点击");
    if(nextController==nil){
         NSLog(@"nextController 为空");
    }
    

    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
