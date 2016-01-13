//
//  VGTableViewCell.m
//  TableViewTest
//
//  Created by Vladyslav on 06.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//

#import "IncomingChatTableViewCell.h"

static int const MaxCharacterLength = 15;
static int const TextViewConstraintConstant = -7;
static float const UILayoutPriorityUpperHigh = 755.f;
static CGFloat const MaxBubbleChatWidth = 200.f;
static CGFloat const MinBubbleChatHigh = 53.f;


@interface IncomingChatTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeStamp;
@property (weak, nonatomic) IBOutlet UIView *bubbleView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *bubbleImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpaceTextViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailingSpaceTextViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bubbleViewWidthConstraint;

@end

@implementation IncomingChatTableViewCell

- (void)prepareForReuse
{
    self.bottomSpaceTextViewConstraint.priority = UILayoutPriorityDefaultHigh;
    self.trailingSpaceTextViewConstraint.priority = UILayoutPriorityDefaultLow;
}

+ (NSString *)reuseIdentifier
{
    return @"IncomingChatCell";
}

- (void)setText:(NSString *)text
{
    self.textView.text = text;
    [self configureCellFrameWithTextLength:text];
    self.bubbleImageView.image = [self.bubbleImageView.image resizableImageWithCapInsets:UIEdgeInsetsMake(13, 13, 13, 13) resizingMode:UIImageResizingModeStretch];
}

- (void)configureCellFrameWithTextLength:(NSString *)text
{
    if (text.length < MaxCharacterLength) {
        self.bottomSpaceTextViewConstraint.priority = UILayoutPriorityDefaultLow;
        self.trailingSpaceTextViewConstraint.priority = UILayoutPriorityUpperHigh;
    } else {
        self.bottomSpaceTextViewConstraint.constant = TextViewConstraintConstant;
    }
}

+ (double)rowHeightForText:(NSString *)text
{
    if (text.length < MaxCharacterLength) {
        return MinBubbleChatHigh;
    }
    
    CGFloat maxW = 0;
    
    if (text.length > MaxCharacterLength && text.length < 27) {
        return 69.5f;
    }
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"Helvetica-Light" size:16]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MaxBubbleChatWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return [text boundingRectWithSize:CGSizeMake(MaxBubbleChatWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.height+51;
}

@end
