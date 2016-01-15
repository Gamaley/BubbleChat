//
//  OutgoingChatTableViewCell.m
//  TableViewTest
//
//  Created by Vladyslav on 11.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//


#import "OutgoingChatTableViewCell.h"

static CGFloat const ContainerLeftPadding = 95.f;
static CGFloat const ContainerRightPadding = 5.f;
static CGFloat const ContainerTopPadding = 5.f;
static CGFloat const ContainerBottomPadding = 5.f;

static CGFloat const TextViewLeftPadding = 5.f;
static CGFloat const TextViewRightPadding = 5.f;
static CGFloat const TextViewTopPadding = 5.f;
static CGFloat const TextViewBottomPadding = 5.f;

static CGFloat const TimeStampContainerViewWidth = 78.f;
static CGFloat const DefaultBottomTimeStampContainerConstraint = 8.f;
static CGFloat const InOneLineBottomTimeStampPaddingConstraint = 14.f;

@interface OutgoingChatTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *timeStampContainerView;
@property (weak, nonatomic) IBOutlet UIView *bubbleView;
@property (weak, nonatomic) IBOutlet UILabel *timeStampLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *bubbleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *deliveryStatusImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomTimeStampContainerConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftBubbleContainerConstraint;

@end

@implementation OutgoingChatTableViewCell

- (void)prepareForReuse
{
    self.leftBubbleContainerConstraint.constant = ContainerLeftPadding;
    self.bottomTimeStampContainerConstraint.constant = DefaultBottomTimeStampContainerConstraint;
}

+ (NSString *)reuseIdentifier
{
    return @"OutgoingChatCell";
}

- (void)setText:(NSString *)text
{
    self.textView.text = text;
    double screenWidth = [UIScreen mainScreen].bounds.size.width;
    double delta = ContainerLeftPadding + ContainerRightPadding + TextViewLeftPadding + TextViewRightPadding;
    
    double expectedWidth = [self.textView sizeThatFits:CGSizeMake(screenWidth - delta, MAXFLOAT)].width;
    double calculatedConstraint = screenWidth - expectedWidth - ContainerRightPadding - TextViewLeftPadding - TextViewRightPadding;
    
    if (calculatedConstraint > ContainerLeftPadding) {
        double resultinConstraint = calculatedConstraint - TimeStampContainerViewWidth;
        if (resultinConstraint < ContainerLeftPadding) {
            self.leftBubbleContainerConstraint.constant = calculatedConstraint;
        } else {
            self.leftBubbleContainerConstraint.constant = calculatedConstraint - TimeStampContainerViewWidth;
            self.bottomTimeStampContainerConstraint.constant = InOneLineBottomTimeStampPaddingConstraint;
        }
    } else {
        self.leftBubbleContainerConstraint.constant = calculatedConstraint;
    }

    [self layoutIfNeeded];
    self.bubbleImageView.image = [self.bubbleImageView.image resizableImageWithCapInsets:UIEdgeInsetsMake(13, 13, 13, 13) resizingMode:UIImageResizingModeStretch];
}

+ (double)rowHeightForText:(NSString *)text
{
    double delta = ContainerLeftPadding + ContainerRightPadding + TextViewLeftPadding + TextViewRightPadding;

    CGRect screenRect = [UIScreen mainScreen].bounds;
    UITextView *expectedTextView = [[UITextView alloc] initWithFrame:screenRect];
    expectedTextView.font = [UIFont fontWithName:@"OpenSans-Light" size:16];
    expectedTextView.text = text;
    CGSize maxSize = CGSizeMake(screenRect.size.width - delta, MAXFLOAT);
    CGSize calculatedSize = [expectedTextView sizeThatFits:maxSize];
    
    double paddingHight = ContainerTopPadding + ContainerBottomPadding + TextViewBottomPadding + TextViewTopPadding;
    double height = calculatedSize.height + paddingHight;
    double calculatedLeftPadding = screenRect.size.width - calculatedSize.width - ContainerRightPadding -TextViewLeftPadding - TextViewRightPadding;
    
    if (calculatedLeftPadding > ContainerLeftPadding * 1.1) {
        if (calculatedLeftPadding - TimeStampContainerViewWidth < ContainerLeftPadding) {
            height += height* 0.3;
        }
    } else {
        height += 13.f;
    }
    return height;
}

@end
