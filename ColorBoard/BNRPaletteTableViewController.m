//
//  BNRPaletteTableViewController.m
//  ColorBoard
//
//  Created by jfl913 on 15/2/17.
//  Copyright (c) 2015年 jfl913. All rights reserved.
//

#import "BNRPaletteTableViewController.h"
#import "BNRColorViewController.h"
#import "BNRColorDescription.h"

@interface BNRPaletteTableViewController ()

@property (nonatomic, strong) NSMutableArray *colors;

@end

@implementation BNRPaletteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)colors
{
    if (!_colors) {
        _colors = [[NSMutableArray alloc] init];
        BNRColorDescription *oneColorDescription = [[BNRColorDescription alloc] init];
        [_colors addObject:oneColorDescription];
    }
    return _colors;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NewColor"]) {
        BNRColorDescription *colorDescription = [[BNRColorDescription alloc] init];
        [self.colors addObject:colorDescription];
        UINavigationController *navController = segue.destinationViewController;
        BNRColorViewController *colorViewController = (BNRColorViewController *)navController.topViewController;
        colorViewController.colorDescription = colorDescription;
    }else if ([segue.identifier isEqualToString:@"ExistingColor"]){
        NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)sender];
        BNRColorDescription *colorDescription = self.colors[indexPath.row];
        BNRColorViewController *colorViewController = segue.destinationViewController;
        colorViewController.existingColor = YES;
        colorViewController.colorDescription = colorDescription;
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colors.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    BNRColorDescription *colorDescription = self.colors[indexPath.row];
    cell.textLabel.text = colorDescription.name;
    
    return cell;
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
