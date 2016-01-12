//
//  OutgoingChatTableViewCell.h
//  TableViewTest
//
//  Created by Vladyslav on 11.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OutgoingChatTableViewCell : UITableViewCell

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UIImage *chatImage;


- (void)prepareForReuse;

@end
