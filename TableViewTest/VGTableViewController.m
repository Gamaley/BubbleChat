//
//  VGTableViewController.m
//  TableViewTest
//
//  Created by Vladyslav on 06.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//

#import "VGTableViewController.h"
#import "VGTableViewCell.h"

@interface VGTableViewController ()

@property (strong, nonatomic) NSArray *tableObjects;

@end

@implementation VGTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"VGTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    NSString *a = @"Hello!";
    NSString *b = @"To do this, we simply set";
    NSString *c = @"VGTableViewCell an Edit button in the navigation bar for this view controller";
    NSString *d = @"So to scale the original square both horizontally an Edit button in the navigation bar for this view controller// Uncomncomment the following line to display an Edit buttoncomment the following line to display an Edit buttoment the following line to display an Edit button in the ";
    NSString *e = @"Similarly, if you wanted to scale the image just horizontally, you’d need to ignore the first 8 pixels on the top and bottom parts of the original image, and replicate everything in the middle:The result is looking much better!";
    NSString *f = @"Similarly, if you wanted to scale the image just horizontally, you’d need to ignore the first 8 pixels on the top and bottom parts of the original image, and replicate everything in the middle:The result is looking much better!So to scale the original square both horizontally an Edit button in the navigation bar for this view controller// Uncomncomment the following line to display an Edit buttoncomment the following line to display an Edit buttoment the following line to display a";
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableObjects = @[a,b,c,d,e,f];
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *Identifier = @"Cell";
    VGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[VGTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    cell.text = [self.tableObjects objectAtIndex:indexPath.row];
   // cell.textView.text = [self.tableObjects objectAtIndex:indexPath.row];//cell.text;
    [cell.textView sizeToFit];
    
    double numLines = cell.textView.contentSize.height/cell.textView.font.leading;
    
    cell.imageView.image = [cell.imageView.image resizableImageWithCapInsets:UIEdgeInsetsMake(13, 13, 13, 13) resizingMode:UIImageResizingModeStretch];
    return cell;
}
 
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 140;
//}

@end
