//
//  ChatTableViewCell.h
//  TableViewTest
//
//  Created by Vladyslav on 12.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatTableViewCell : UITableViewCell

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UIImage *bubbleChatImage;
@property (strong, nonatomic) UIImage *deliveryStatusImage;

+ (NSString *)reuseIdentifier;
+ (double)rowHeightForText:(NSString *)text;

@end
