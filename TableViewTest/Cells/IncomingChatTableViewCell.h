//
//  VGTableViewCell.h
//  TableViewTest
//
//  Created by Vladyslav on 06.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IncomingChatTableViewCell : UITableViewCell

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UIImage *chatImage;


- (void)prepareForReuse;

@end
