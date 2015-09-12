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
@property (strong, nonatomic) IBOutlet UIImageView *mainImageView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *thumbnailsImages;
@property (strong, nonatomic) IBOutlet UILabel *brand;
@property (strong, nonatomic) IBOutlet UILabel *model;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) clothingData *cloth;

@end
