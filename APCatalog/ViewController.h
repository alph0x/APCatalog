//
//  ViewController.h
//  APCatalog
//
//  Created by Alfredo E. Pérez L. on 9/11/15.
//  Copyright (c) 2015 Alfredo E. Pérez L. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPPopoverController.h"
#import "FiltersViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, FiltersMenuDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSNumber *maxItems;
@property (strong, nonatomic) NSNumber *pageNumber;
@property (strong, nonatomic) NSString *sortingDescription;
@property (strong, nonatomic) NSString *sortingDirection;

@end

