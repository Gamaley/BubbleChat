//
//  VGTableViewCell.m
//  TableViewTest
//
//  Created by Vladyslav on 06.01.16.
//  Copyright © 2016 Vladyslav Gamalii. All rights reserved.
//

#import "VGTableViewCell.h"

@interface VGTableViewCell ()


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation VGTableViewCell

//@synthesize textView = _textView;
@synthesize imageView = _imageView;

- (NSString *)reuseIdentifier
{
    return @"Cell";
}


- (void)awakeFromNib {
   // self.textLabel.text = self.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setText:(NSString *)text
{
    
    //self.text = text;
   
//    } else {
//        text = [NSString stringWithFormat:@"%@\n ",text];
//    }
    self.textView.text = text;
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
    if (text.length < 20) {
        [self.verticalConstraint setPriority:UILayoutPriorityDefaultLow];
    } else {
        [self.verticalConstraint setPriority:UILayoutPriorityDefaultHigh];
    }
    
   // NSLog(@"%f",size.height);
  //  [self.textView sizeToFit];
}

- (void)configureCell
{

}

@end
