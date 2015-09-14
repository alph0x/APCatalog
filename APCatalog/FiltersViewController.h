//
//  FiltersViewController.h
//  
//
//  Created by Alfredo E. Pérez L. on 9/13/15.
//
//

#import <UIKit/UIKit.h>

@protocol FiltersMenuDelegate <NSObject>
-(void) filtersMenuWillDisappear;
-(void) sortDescriptionSelected;
-(void) sortOrderSelected;

@end

@interface FiltersViewController : UIViewController
@property (weak, nonatomic) id<FiltersMenuDelegate>delegate;
@property (strong, nonatomic) NSString *sortOrder;
@property (strong, nonatomic) NSString *sortDescription;

- (IBAction)sortDescriptionTapped:(id)sender;
- (IBAction)sortOrderTapped:(id)sender;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *descriptionIcons;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *orderIcons;

@property (strong, nonatomic) IBOutlet UIImageView *selectedPopularity;
@property (strong, nonatomic) IBOutlet UIImageView *selectedPriceIcon;
@property (strong, nonatomic) IBOutlet UIImageView *selectedBrandIcon;
@property (strong, nonatomic) IBOutlet UIImageView *selectedNameIcon;
@property (strong, nonatomic) IBOutlet UIImageView *selectedDescIcon;
@property (strong, nonatomic) IBOutlet UIImageView *selectedAscIcon;

- (void) solveSortDescriptionWithDescription:(NSString *) description;
- (void) solveSortOrderWithOrder:(NSString *) order;

@end


