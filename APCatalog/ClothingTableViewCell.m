//
//  ClothingTableViewCell.m
//  
//
//  Created by Alfredo E. Pérez L. on 9/12/15.
//
//

#import "ClothingTableViewCell.h"

@implementation ClothingTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)thumbnailTapped:(UIButton *)sender {
    NSLog(@"IMAGE CHANGED");
    NSURL *imageURL = [self.cloth.imagesURLs objectAtIndex:[sender.titleLabel.text intValue]];
    [self.mainImageView setImageWithURL:imageURL
                       placeholderImage:nil];
    
}

@end
