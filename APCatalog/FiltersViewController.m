//
//  FiltersViewController.m
//  
//
//  Created by Alfredo E. Pérez L. on 9/13/15.
//
//

#import "FiltersViewController.h"

@interface FiltersViewController () {
    UIImage *checkIcon;
}

@end

@implementation FiltersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    checkIcon = [UIImage imageNamed:@"icon_selection"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.delegate filtersMenuWillDisappear];
}

- (void) solveSortDescriptionWithDescription:(NSString *) description {
    self.sortDescription  = description;
    [self.selectedPriceIcon setImage:nil];
    [self.selectedBrandIcon setImage:nil];
    [self.selectedNameIcon setImage:nil];
    [self.selectedPopularity setImage:nil];
    if ([self.sortDescription isEqualToString:@"popularity"]) {
        [self.selectedPopularity setImage:checkIcon];
    }else  if ([self.sortDescription isEqualToString:@"price"]) {
        [self.selectedPriceIcon setImage:checkIcon];
    }else if ([self.sortDescription isEqualToString:@"brand"]) {
        [self.selectedBrandIcon setImage:checkIcon];
    }else if ([self.sortDescription isEqualToString:@"name"]) {
        [self.selectedNameIcon setImage:checkIcon];
    }
    
}

- (void) solveSortOrderWithOrder:(NSString *) order {
    self.sortOrder  = order;
    [self.selectedAscIcon setImage:nil];
    [self.selectedDescIcon setImage:nil];
    if ([self.sortOrder isEqualToString:@"desc"]) {
        [self.selectedDescIcon setImage:checkIcon];
    }else if ([self.sortOrder isEqualToString:@"asc"]) {
        [self.selectedAscIcon setImage:checkIcon];
    }
}

- (IBAction)sortDescriptionTapped:(id)sender {
    [self solveSortDescriptionWithDescription:[sender currentTitle]];
    [self.delegate sortDescriptionSelected];
}

- (IBAction)sortOrderTapped:(id)sender {
    [self solveSortOrderWithOrder:[sender currentTitle]];
    [self.delegate sortOrderSelected];
}
@end
