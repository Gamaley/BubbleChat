//
//  OutgoingChatTableViewCell.h
//  TableViewTest
//
//  Created by Vladyslav on 11.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatTableViewCell.h"

@interface OutgoingChatTableViewCell : ChatTableViewCell

@property (weak, nonatomic) IBOutlet UIView *bubbleView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

- (double)rowHeightForTextView:(UITextView *) textView;

@end
