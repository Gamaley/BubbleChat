//
//  VGTableViewController.m
//  TableViewTest
//
//  Created by Vladyslav on 06.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//

#import "VGTableViewController.h"
#import "IncomingChatTableViewCell.h"
#import "OutgoingChatTableViewCell.h"

//static NSString *const IncomingChatCell = @"IncomingChatCell";
//static NSString *const OutgoingChatCell = @"OutgoingChatCell";

@interface VGTableViewController ()

@property (strong, nonatomic) NSArray *tableObjects;

@end

@implementation VGTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([IncomingChatTableViewCell class]) bundle:nil] forCellReuseIdentifier:[IncomingChatTableViewCell reuseIdentifier]];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([OutgoingChatTableViewCell class]) bundle:nil] forCellReuseIdentifier:[OutgoingChatTableViewCell reuseIdentifier]];
    
    NSString *a = @"Hello!";
    NSString *b = @"To do line hor?";
    NSString *c = @"VGTableViewCell an edit@but.on";
    NSString *d = @"So to scale the original square both horizontally an Edit button in the navigation bar for this view controller";
    NSString *e = @"Similarly, if you wanted to scale the image just horizontally, you’d need to ignore the first 8 pixels on the top and bottom parts of the original image, and replicate everything in the middle:The result is looking much better!";
    NSString *f = @"Similarly, if you wanted to scale the image just horizontally, you’d need to ignore the first 8 pixels on the top and bottom parts of the original image, and replicate everything in the middle:The result is looking much better!So to scale the original square both horizontally an Edit button in the navigation bar for this view controller// Uncomncomment the following line to display an Edit buttoncomment the following line to display an Edit buttoment the following line to display a";
    NSString *g = @"Similarly, if you want";
    NSString *h = @"http://vk.com";
    NSString *i = @"123456789012345";
    NSString *j = @"Whats'up?";
    NSString *k = @"Fine, thanks !!";
    NSString *l = @"Curabitur lobortis id lor em id bibendum.";
    NSString *m = @"Similarly, if you wanted to scale the image just horizontally, you’d need to ignore the first 8 pixels on the top and bottom parts of the original image, and replicate everything in the middle:The result is looking much better!So to scale the original square both horizontally an Edit button in the navigation bar for this view controller// Uncomncomment the following line to display an Edit buttoncomment the following line to display an Edit buttoment the following line to display aSimilarly, if you wanted to scale the image just horizontally, you’d need to ignore the first 8 pixels on the top and bottom parts of the original image, and replicate everything in the middle:The result is looking much better!So to scale the original square both horizontally an Edit button in the navigation bar for this view controller// Uncomncomment the following line to display an Edit buttoncomment the following line to display an Edit buttoment the following line to display a";

    self.tableObjects = @[a,j,k,l,g,b,i,h,c,d,e,f,m];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 500.f;   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL isCell = NO;//arc4random_uniform(1001)%2;
    
    if (isCell) {
    IncomingChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[IncomingChatTableViewCell reuseIdentifier] forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[IncomingChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[IncomingChatTableViewCell reuseIdentifier]];
        }
        
        cell.text = [self.tableObjects objectAtIndex:indexPath.row];
        return cell;
        
    } else {
        
      OutgoingChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[OutgoingChatTableViewCell reuseIdentifier] forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[OutgoingChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[OutgoingChatTableViewCell reuseIdentifier]];
        }
      
        cell.text = [self.tableObjects objectAtIndex:indexPath.row];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat high = [OutgoingChatTableViewCell rowHeightForText:[self.tableObjects objectAtIndex:indexPath.row]];
    
    return high;
}

@end
