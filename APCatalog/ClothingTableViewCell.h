//
//  ClothingTableViewCell.h
//  
//
//  Created by Alfredo E. Pérez L. on 9/12/15.
//
//

#import <UIKit/UIKit.h>
#import "clothingData.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ClothingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *thumbnailsImages;
@property (weak, nonatomic) IBOutlet UILabel *brand;
@property (weak, nonatomic) IBOutlet UILabel *model;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) clothingData *cloth;

@end
