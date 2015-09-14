//
//  ViewController.m
//  APCatalog
//
//  Created by Alfredo E. Pérez L. on 9/11/15.
//  Copyright (c) 2015 Alfredo E. Pérez L. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import <DFCache/DFCache.h>
#import "clothingData.h"
#import "ClothingTableViewCell.h"


static NSString * const BaseURLString = @"https://www.zalora.com.my/mobile-api/women/clothing";


@interface ViewController () {
    NSDictionary *responseJSON;
    NSMutableArray *cachedData;
    NSArray *results;
    DFCache *cache;
    NSMutableArray *parsedResults;
    FPPopoverController *filtersPopover;
    FiltersViewController *filtersMenu;
    UIView *shadowView;
    BOOL isUpdating;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Default Values:
    _maxItems = @5;
    _pageNumber = @1;
    _sortingDescription = @"popularity";
    _sortingDirection = @"asc";
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    cache = [[DFCache alloc] initWithName:@"clothes"];
    results = [cache cachedObjectForKey:@"results"];
    if (results) {
        for (NSDictionary *d in results) {
            [parsedResults addObject:[clothingData clothingFromDictionary:d]];
        }
        [self.tableView reloadData];
    }else {
        [self performConnection];
    }
    UIImage *filterIcon=[UIImage imageNamed:@"icon_filter_rides_light"];
    UIBarButtonItem *filter=[[UIBarButtonItem alloc] initWithImage:filterIcon landscapeImagePhone:filterIcon style:UIBarButtonItemStylePlain target:self action:@selector(showFilterMenu)];
    [filter setTintColor:[UIColor blackColor]];
    self.navigationItem.leftBarButtonItem = filter;
    
}

-(void) showFilterMenu {
    shadowView = [[UIView alloc] initWithFrame:self.view.frame];
    [shadowView setBackgroundColor:[UIColor darkGrayColor]];
    [shadowView setAlpha:.4];
    [self.view addSubview:shadowView];
    filtersMenu = [[FiltersViewController alloc] initWithNibName:@"FiltersViewController" bundle:nil];
    [filtersMenu setDelegate:self];
    filtersPopover = [[FPPopoverController alloc] initWithViewController:filtersMenu];
    filtersPopover.contentSize = CGSizeMake(226, 280);
    filtersPopover.border = NO;
    filtersPopover.tint = FPPopoverWhiteTint;
    [filtersMenu solveSortDescriptionWithDescription:self.sortingDescription];
    [filtersMenu solveSortOrderWithOrder:self.sortingDirection];
    [filtersPopover presentPopoverFromView:self.navigationItem.titleView];
    
}

-(void)performConnection {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Please wait" message:@"Downloading the catalog information, this may take few minutes..." delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [alertView show];
    int page = [_pageNumber integerValue];
    if (isUpdating) {
        page++;
    }
    NSString *desiredURLString = [NSString stringWithFormat:@"%@?maxItems=%@&page=%i&sort=%@&dir=%@", BaseURLString, _maxItems, page, _sortingDescription, _sortingDirection];
    NSURL *url = [NSURL URLWithString:desiredURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        responseJSON = responseObject;
        results = [[responseJSON objectForKey:@"metadata"] objectForKey:@"results"];
        if (!isUpdating) {
            if (parsedResults) {
                parsedResults = nil;
            }
            parsedResults = [NSMutableArray new];
            cachedData = [NSMutableArray new];
            [cache removeObjectForKey:@"results"];
            [cachedData addObjectsFromArray:results];
        }else {
            if (results.count > 0) {
                [cachedData addObjectsFromArray:results];
            }
            isUpdating = NO;
            _pageNumber = [NSNumber numberWithInt:page];
        }
        
        [cache storeObject:cachedData forKey:@"results"];
        
        for (NSDictionary *d in results) {
            [parsedResults addObject:[clothingData clothingFromDictionary:d]];
        }
        [alertView dismissWithClickedButtonIndex:0 animated:YES];
        NSLog(@"SUCCESS");
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Information"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    [operation start];
    
    
}

#pragma mark FILTERS DELEGATE METHODS

-(void)filtersMenuWillDisappear {
    if (shadowView) {
        [shadowView removeFromSuperview];
    }
}

- (void) applyFilters {
    [self performConnection];
    [filtersPopover dismissPopoverAnimated:YES];
}

-(void)sortDescriptionSelected {
    self.sortingDescription = filtersMenu.sortDescription;
    [self applyFilters];
}

-(void)sortOrderSelected {
    self.sortingDirection = filtersMenu.sortOrder;
    [self applyFilters];
}

#pragma mark TABLE DELEGATE METHODS

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClothingTableViewCell *clothingCell = [self.tableView dequeueReusableCellWithIdentifier:@"clothing"];
    clothingCell.cloth = [parsedResults objectAtIndex:indexPath.row];
    clothingCell.brand.text = clothingCell.cloth.brand;
    clothingCell.model.text = clothingCell.cloth.name;
    int idx = 0;
    int limit = clothingCell.cloth.images.count-1;
    if (idx <= limit) {
        if ([clothingCell.cloth.images objectAtIndex:idx]) {
            [clothingCell.thumbnail1 setImage:[clothingCell.cloth.images objectAtIndex:idx]];
        }
    }
    idx++;
    if (idx <= limit) {
        if ([clothingCell.cloth.images objectAtIndex:idx]) {
            [clothingCell.thumbnail2 setImage:[clothingCell.cloth.images objectAtIndex:idx]];
        }
    }
    idx++;
    if (idx <= limit) {
        if ([clothingCell.cloth.images objectAtIndex:idx]) {
            [clothingCell.thumbnail3 setImage:[clothingCell.cloth.images objectAtIndex:idx]];
        }
    }
    idx++;
    if (idx <= limit) {
        if ([clothingCell.cloth.images objectAtIndex:idx]) {
            [clothingCell.thumbnail4 setImage:[clothingCell.cloth.images objectAtIndex:idx]];
        }
    }
    idx++;
    if (idx <= limit) {
        if ([clothingCell.cloth.images objectAtIndex:idx]) {
            [clothingCell.thumbnail5 setImage:[clothingCell.cloth.images objectAtIndex:idx]];
        }
    }
    idx++;
    if (idx <= limit) {
        if ([clothingCell.cloth.images objectAtIndex:idx]) {
            [clothingCell.thumbnail6 setImage:[clothingCell.cloth.images objectAtIndex:idx]];
        }
    }
    

    clothingCell.price.text = [NSString stringWithFormat:@"RM %@", clothingCell.cloth.price];
    return clothingCell;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSInteger currentOffset = scrollView.contentOffset.y;
    NSInteger maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
    if (maximumOffset - currentOffset <= -40 && currentOffset>0) {
        if (parsedResults.count > 0) {
            isUpdating = YES;
            [self performConnection];
        }
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return parsedResults.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
@end
