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
@property (strong, nonatomic) IBOutlet UIImageView *thumbnail1;
@property (strong, nonatomic) IBOutlet UIImageView *thumbnail2;
@property (strong, nonatomic) IBOutlet UIImageView *thumbnail3;
@property (strong, nonatomic) IBOutlet UIImageView *thumbnail4;
@property (strong, nonatomic) IBOutlet UIImageView *thumbnail5;
@property (strong, nonatomic) IBOutlet UIImageView *thumbnail6;
@property (strong, nonatomic) IBOutlet UILabel *brand;
@property (strong, nonatomic) IBOutlet UILabel *model;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) clothingData *cloth;

@end
