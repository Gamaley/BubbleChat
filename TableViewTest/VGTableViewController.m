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

@interface VGTableViewController ()

@property (strong, nonatomic) NSArray *tableObjects;

@end

@implementation VGTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"IncomingChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"IncomingChatCell"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"OutgoingChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"OutgoingChatCell"];
    
    NSString *a = @"Hello!";
    NSString *b = @"To do line?";
    NSString *c = @"VGTableViewCell an Edit button";
    NSString *d = @"So to scale the original square both horizontally an Edit button in the navigation bar for this view controller";
    NSString *e = @"Similarly, if you wanted to scale the image just horizontally, you’d need to ignore the first 8 pixels on the top and bottom parts of the original image, and replicate everything in the middle:The result is looking much better!";
    NSString *f = @"Similarly, if you wanted to scale the image just horizontally, you’d need to ignore the first 8 pixels on the top and bottom parts of the original image, and replicate everything in the middle:The result is looking much better!So to scale the original square both horizontally an Edit button in the navigation bar for this view controller// Uncomncomment the following line to display an Edit buttoncomment the following line to display an Edit buttoment the following line to display a";
    NSString *g = @"123456789012345";
    NSString *h = @"12345678901";
    NSString *i = @"1234567890123";
    NSString *j = @"Whats'up?";
    NSString *k = @"Fine, thanks!";
    NSString *l = @"Curabitur lobortis id lor em id bibendum.";
    self.tableObjects = @[a,j,k,l,g,b,i,h,c,d,e,f];

}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    [self.tableView reloadData];
//}

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
//
//- (void)tableView:(UITableView *)tableView willDisplayCell:(ChatTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
////    NSLog(@"%f", cell.bubbleView.frame.size.width);
////    NSLog(@"%f", cell.textView.frame.size.width);
////    NSLog(@"%f", cell.contentView.frame.size.width);
//    
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *Identifier = @"IncomingChatCell";
    static NSString *Identifier2 = @"OutgoingChatCell";
    
    BOOL isCell = arc4random_uniform(100)%2;
    
    if (isCell) {
    IncomingChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
        if (!cell) {
            cell = [[IncomingChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        }
        
        cell.text = [self.tableObjects objectAtIndex:indexPath.row];
        cell.imageView.image = [cell.imageView.image resizableImageWithCapInsets:UIEdgeInsetsMake(13, 13, 13, 13) resizingMode:UIImageResizingModeStretch];
        return cell;
        
    } else {
        
      OutgoingChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier2 forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[OutgoingChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier2];
        }
        
        
        cell.text = [self.tableObjects objectAtIndex:indexPath.row];
        
        cell.imageView.image = [cell.imageView.image resizableImageWithCapInsets:UIEdgeInsetsMake(13, 13, 13, 13) resizingMode:UIImageResizingModeStretch];
        return cell;
    }
    
//    if (!cell) {
//        cell = [[ChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
//    }
//    
//    
//    cell.text = [self.tableObjects objectAtIndex:indexPath.row];
//
//    cell.imageView.image = [cell.imageView.image resizableImageWithCapInsets:UIEdgeInsetsMake(13, 13, 13, 13) resizingMode:UIImageResizingModeStretch];
//    return cell;
}
 


@end
