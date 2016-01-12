//
//  VGTableViewCell.m
//  TableViewTest
//
//  Created by Vladyslav on 06.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//

#import "ChatTableViewCell.h"

static int const MaxCharacterLength = 15;
static int const TextViewConstraintConstant = -5;
static float const UILayoutPriorityUpperHigh = 755.f;


@interface ChatTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeStamp;
@property (weak, nonatomic) IBOutlet UIView *bubbleView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpaceTextViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *trailingSpaceTextViewConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bubbleViewWidthConstraint;


@end

@implementation ChatTableViewCell

@synthesize imageView = _imageView;

- (void)prepareForReuse
{
    self.bottomSpaceTextViewConstraint.constant = TextViewConstraintConstant;
    self.bottomSpaceTextViewConstraint.priority = UILayoutPriorityDefaultHigh;
    self.trailingSpaceTextViewConstraint.priority = UILayoutPriorityDefaultLow;
}

- (NSString *)reuseIdentifier
{
    return @"ChatCell";
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


// [self.bubbleWidhConstraint setConstant:self.textView.contentSize.width];
//    double numLines = self.textView.contentSize.height/self.textView.font.leading;
//    float rows = (self.textView.contentSize.height - self.textView.textContainerInset.top - self.textView.textContainerInset.bottom) / self.textView.font.lineHeight;
//    double f = self.textView.contentSize.width;
//
//    UIFont *font = [UIFont boldSystemFontOfSize:11.0];
//    CGSize size = [text sizeWithFont:font
//                     constrainedToSize:self.textView.frame.size
//                         lineBreakMode:NSLineBreakByWordWrapping];
//
//    float numberOfLines = size.height / font.lineHeight;
//      NSLayoutConstraint *heigh = [NSLayoutConstraint constraintWithItem:self.textView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.timeStamp attribute:NSLayoutAttributeTop multiplier:1 constant:-5];
//  if (size.height < 20.f) {
// [self.verticalConstraint setPriority:UILayoutPriorityDefaultLow];
// [self.bubbleView addConstraint:heigh];
//  }

//    NSLog(@"%li",text.length);
//    CGRect f = self.textView.frame;
//    CGRect bub = self.bubbleView.frame;
//    CGSize six = self.textView.textContainer.size;


//self.text = text;

//    } else {
//        text = [NSString stringWithFormat:@"%@\n ",text];
//    }
