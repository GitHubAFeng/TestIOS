//
//  MovieViewController.m
//  test
//
//  Created by 华信科技 on 2017/8/3.
//  Copyright © 2017年 华信科技. All rights reserved.
//

#import "MovieViewController.h"
#import "MovieDetailViewController.h"

@interface MovieViewController ()

@property(strong,nonatomic)MovieDetailViewController *childController;

@end

@implementation MovieViewController


@synthesize movieList;
@synthesize childController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"电影列表";
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"肖申克的救赎", @"教父", @"教父：II",
                      @"低俗小说", @"黄金三镖客", @"十二怒汉", @"辛德勒名单",
                      @"蝙蝠侠前传2：黑暗骑士", @"指环王：王者归来", @"飞越疯人院",
                      @"星球大战Ⅴ：帝国反击战", @"搏击俱乐部", @"盗梦空间", @"七武士",
                      @"指环王：护戒使者", @"好家伙", @"星球大战IV：新希望", @"上帝之城",
                      @"卡萨布兰卡", @"黑客帝国", @"西部往事", @"后窗", @"夺宝奇兵",
                      @"沉默的羔羊", @"非常嫌疑犯", @"七宗罪", @"指环王：双塔奇兵", @"阿甘正传",
                      @"惊魂记", @"美好人生", nil];
    
    
    NSMutableArray *arrayController = [[NSMutableArray alloc] init];
    
    
    //电影
    MovieDetailViewController *movieViewController = nil;
    for (id item in array) {
        movieViewController = [MovieDetailViewController new];
        movieViewController.title = item;
        [arrayController addObject:movieViewController];
    }
    
    self.movieList = arrayController;
    
}

- (void)viewDidUnload{
    self.movieList = nil;
    self.childController = nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
 
    static NSString *MovieTableViewCell = @"MovieTableViewCell";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MovieTableViewCell];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MovieTableViewCell forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier: MovieTableViewCell];
    }
    
    NSUInteger row = [indexPath row];
    
//    NSString *movieTitle = [movieList objectAtIndex:row];
//    //这里设置每一行显示的文本为所对应的View Controller的标题
//    cell.textLabel.text = movieTitle;

    UITableViewController *controller = [movieList objectAtIndex:row];
    cell.textLabel.text = controller.title;
    
    //accessoryType就表示每行右边的图标
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    if(childController == nil){
        childController = [[MovieDetailViewController alloc]
                           initWithNibName:@"MovieDetailViewController" bundle:nil];
        
    }
    
    NSUInteger row = [indexPath row];
    NSString *selectedMovie = [movieList objectAtIndex:row];
    NSString *detailMessage = [[NSString alloc]
                               initWithFormat:@"你选择了电影：%@.", selectedMovie];
    childController.message = detailMessage;
    childController.title = selectedMovie;
    [self.navigationController pushViewController:childController animated:YES];
    

    
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
