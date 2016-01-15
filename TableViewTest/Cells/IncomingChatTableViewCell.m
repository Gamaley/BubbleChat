//
//  VGTableViewCell.m
//  TableViewTest
//
//  Created by Vladyslav on 06.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//

#import "IncomingChatTableViewCell.h"

static CGFloat const ContainerLeftPadding = 5.f;
static CGFloat const ContainerRightPadding = 95.f;
static CGFloat const ContainerTopPadding = 5.f;
static CGFloat const ContainerBottomPadding = 5.f;

static CGFloat const TextViewLeftPadding = 15.f;
static CGFloat const TextViewRightPadding = 5.f;
static CGFloat const TextViewTopPadding = 5.f;
static CGFloat const TextViewBottomPadding = 5.f;

static CGFloat const TimeStampLabelWidth = 60.f;
static CGFloat const InOneLineBottomLabelPaddingConstraint = 14.f;
static CGFloat const DefaultBottomTimeStampContainerConstraint = 8.f;

@interface IncomingChatTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeStamp;
@property (weak, nonatomic) IBOutlet UIView *bubbleView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *bubbleImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomPaddingLabelConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerRightPaddingConstraint;

@end

@implementation IncomingChatTableViewCell

- (void)prepareForReuse
{
    self.bottomPaddingLabelConstraint.constant = DefaultBottomTimeStampContainerConstraint;
    self.containerRightPaddingConstraint.constant = ContainerRightPadding;
}

+ (NSString *)reuseIdentifier
{
    return @"IncomingChatCell";
}

- (void)setText:(NSString *)text
{
    self.textView.text = text;
    double screenWidth = [UIScreen mainScreen].bounds.size.width;
    double delta = ContainerLeftPadding + ContainerRightPadding + TextViewLeftPadding + TextViewRightPadding;
    double expectedWidth = [self.textView sizeThatFits:CGSizeMake(screenWidth - delta, MAXFLOAT)].width;
    double calculatedConstraint = screenWidth - expectedWidth - ContainerLeftPadding - TextViewLeftPadding - TextViewRightPadding;
    
    if (calculatedConstraint > ContainerRightPadding) {
        double resultinConstraint = calculatedConstraint - TimeStampLabelWidth;
        if (resultinConstraint < ContainerRightPadding) {
            self.containerRightPaddingConstraint.constant = calculatedConstraint;
        } else {
            self.containerRightPaddingConstraint.constant = calculatedConstraint - TimeStampLabelWidth;
            self.bottomPaddingLabelConstraint.constant = InOneLineBottomLabelPaddingConstraint;
        }
    } else {
        self.containerRightPaddingConstraint.constant = calculatedConstraint;
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
    
    double paddingHight = ContainerTopPadding + ContainerBottomPadding +  TextViewBottomPadding + TextViewTopPadding;
    double height = calculatedSize.height + paddingHight;
    double calculatedRightPadding = screenRect.size.width - calculatedSize.width - ContainerLeftPadding - TextViewRightPadding - TextViewLeftPadding;
    
    if (calculatedRightPadding > ContainerRightPadding * 1.1) {
        if (calculatedRightPadding - TimeStampLabelWidth < ContainerRightPadding) {
            height += height* 0.2;
        }
    } else {
        height += 13.f;
    }
    return height;
}

@end
