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
- (IBAction)thumbnailPictureTapped:(id)sender {
    NSLog(@"IMAGE CHANGED");
    int index = [[sender currentTitle] intValue];
    UIImageView *imageFromThumbnail = [self.thumbnailsImages objectAtIndex:index];
    [self.mainImageView setImage:imageFromThumbnail.image];
    
}

@end
