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
    self.textView.text = text;
    
  //  [self.textView sizeToFit];
}

- (void)configureCell
{

}

@end
