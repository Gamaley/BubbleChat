//
//  OutgoingChatTableViewCell.m
//  TableViewTest
//
//  Created by Vladyslav on 11.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//


#import "OutgoingChatTableViewCell.h"

static int const MaxCharacterLength = 12;
static int const TextViewConstraintConstant = -7;
static float const UILayoutPriorityUpperHigh = 755.f;
static CGFloat const MaxBubbleChatWidth = 170.f;
static CGFloat const MinBubbleChatHigh = 53.f;


@interface OutgoingChatTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeStamp;


@property (weak, nonatomic) IBOutlet UIImageView *bubbleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *deliveryStatusImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpaceTextViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailingSpaceTextViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bubbleViewWidthConstraint;

@end

@implementation OutgoingChatTableViewCell

- (void)prepareForReuse
{
    self.bottomSpaceTextViewConstraint.priority = UILayoutPriorityDefaultHigh;
    self.trailingSpaceTextViewConstraint.priority = UILayoutPriorityDefaultLow;
}

+ (NSString *)reuseIdentifier
{
    return @"OutgoingChatCell";
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

- (double)rowHeightForTextView:(UITextView *) textView
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"Helvetica-Light" size:16]};
    CGRect d = [textView.text boundingRectWithSize:CGSizeMake(MaxBubbleChatWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return d.size.height;
}

+ (double)rowHeightForText:(NSString *)text
{
    if (text.length < MaxCharacterLength) {
        return MinBubbleChatHigh;
    }
    
    if (text.length > MaxCharacterLength && text.length < 25) {
        return 69.5f;
    }
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"Helvetica-Light" size:16]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MaxBubbleChatWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesDeviceMetrics attributes:attributes context:nil];
    
    return [text boundingRectWithSize:CGSizeMake(MaxBubbleChatWidth, 5000.f) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading | NSStringDrawingUsesDeviceMetrics attributes:attributes context:nil].size.height+51;
}

@end