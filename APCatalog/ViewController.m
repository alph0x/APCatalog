//
//  ViewController.m
//  APCatalog
//
//  Created by Alfredo E. Pérez L. on 9/11/15.
//  Copyright (c) 2015 Alfredo E. Pérez L. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import <CacheKit/CacheKit.h>
#import "clothingData.h"
#import "ClothingTableViewCell.h"


static NSString * const BaseURLString = @"https://www.zalora.com.my/mobile-api/women/clothing";


@interface ViewController () {
    NSDictionary *responseJSON;
    NSArray *results;
    CKFileCache *cache;
    
    NSMutableArray *parsedResults;
    
    
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
    parsedResults = [NSMutableArray new];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self performConnectionWithMaxItems:_maxItems
                             pageNumber:_pageNumber
                          sortingOption:_sortingDescription
                           andDirection:_sortingDirection];
}

-(void)performConnectionWithMaxItems:(NSNumber *) maxItems
                          pageNumber:(NSNumber *) pageNumber
                       sortingOption:(NSString *) sort
                        andDirection:(NSString *) direction {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Please wait" message:@"Downloading the catalog information" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    [alertView show];
    NSString *desiredURLString = [NSString stringWithFormat:@"%@?maxItems=%@&page=%@&sort=%@&dir=%@", BaseURLString, maxItems, pageNumber, sort, direction];
    NSURL *url = [NSURL URLWithString:desiredURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        responseJSON = responseObject;
        results = [[responseJSON objectForKey:@"metadata"] objectForKey:@"results"];
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

#pragma mark TABLE DELEGATE METHODS

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClothingTableViewCell *clothingCell = [self.tableView dequeueReusableCellWithIdentifier:@"clothing"];
    clothingCell.cloth = [parsedResults objectAtIndex:indexPath.row];
    clothingCell.brand.text = clothingCell.cloth.brand;
    clothingCell.model.text = clothingCell.cloth.name;
    [clothingCell.mainImageView setImage:[clothingCell.cloth.imagesURLs objectAtIndex:0]];
    [clothingCell.thumbnailsImages enumerateObjectsUsingBlock:^(UIImageView *thumbnail, NSUInteger idx, BOOL *stop) {
        [thumbnail setImage:[clothingCell.cloth.imagesURLs objectAtIndex:idx]];
    }];
    clothingCell.price.text = [NSString stringWithFormat:@"RM %@", clothingCell.cloth.price];
    return clothingCell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return parsedResults.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
@end
