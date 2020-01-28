//
//  ServiceTableViewController.m
//  UnitTestsAndUITestsDemo
//
//  Created by 贺文杰 on 2020/1/28.
//  Copyright © 2020 贺文杰. All rights reserved.
//

#import "ServiceTableViewController.h"

@interface ServiceTableViewController ()

@property(nonatomic,strong)NSArray *systemImageTitleAry;
@property(nonatomic,strong)NSArray *titleAry;

@end

@implementation ServiceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.systemImageTitleAry = @[@"timelapse"];
    self.titleAry = @[@"长沙地铁线网图", @"票价表", @"首末班车时刻表", @"站点详情", @"使用帮助"];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"serviceCellIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.imageView.image = [UIImage systemImageNamed:self.systemImageTitleAry[0]];
    cell.textLabel.text = self.titleAry[indexPath.row];
    cell.detailTextLabel.text = @"";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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
