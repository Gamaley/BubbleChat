//
//  OutgoingChatTableViewCell.m
//  TableViewTest
//
//  Created by Vladyslav on 11.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//


#import "OutgoingChatTableViewCell.h"

static int const MaxCharacterLength = 15;
static int const TextViewConstraintConstant = -5;
static float const UILayoutPriorityUpperHigh = 755.f;


@interface OutgoingChatTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeStamp;
@property (weak, nonatomic) IBOutlet UIView *bubbleView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpaceTextViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailingSpaceTextViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bubbleViewWidthConstraint;


@end

@implementation OutgoingChatTableViewCell

@synthesize imageView = _imageView;

- (void)prepareForReuse
{
    self.bottomSpaceTextViewConstraint.constant = TextViewConstraintConstant;
    self.bottomSpaceTextViewConstraint.priority = UILayoutPriorityDefaultHigh;
    self.trailingSpaceTextViewConstraint.priority = UILayoutPriorityDefaultLow;
}

- (NSString *)reuseIdentifier
{
    return @"OutgoingChatCell";
}


- (void)awakeFromNib
{
    
}

- (void)setText:(NSString *)text
{
    self.textView.text = text;
    [self configureCellFrameWithTextLength:text];
}

- (void)configureCellFrameWithTextLength:(NSString *)text
{
    if (text.length < MaxCharacterLength) {
        self.bottomSpaceTextViewConstraint.priority = UILayoutPriorityDefaultLow;
        self.trailingSpaceTextViewConstraint.priority = UILayoutPriorityUpperHigh;
    }
}

@end