//
//  VGTableViewCell.h
//  TableViewTest
//
//  Created by Vladyslav on 06.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VGTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bubbleView;

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UIImage *chatImage;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *horizontalConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bubbleWidhConstraint;
@property (weak, nonatomic) IBOutlet UILabel *timeStamp;

@end
