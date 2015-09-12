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


static NSString * const BaseURLString = @"https://www.zalora.com.my/mobile-api/women/clothing";

@interface ViewController () {
    NSDictionary *responseJSON;
    NSDictionary *metadata;
    NSDictionary *categories;
    NSArray *results;
    CKFileCache *cache;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performConnection];
}

-(void)performConnection{
    NSURL *url = [NSURL URLWithString:BaseURLString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        responseJSON = responseObject;
        metadata = [responseJSON objectForKey:@"metadata"];
        categories = [metadata objectForKey:@"categories"];
        results = [metadata objectForKey:@"results"];
        for (NSDictionary *d in results) {
            NSLog(@"HERE");
        }
        NSLog(@"Data gathered.");
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

@end
