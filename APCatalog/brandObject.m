//
//  brandObject.m
//  
//
//  Created by Alfredo E. Pérez L. on 9/11/15.
//
//

#import "brandObject.h"

@implementation brandObject

+(brandObject *)brandFromDictionary:(NSDictionary *)dictionary {
    brandObject *brand = [brandObject new];
    NSDictionary *data =[dictionary objectForKey:@"data"];
    
    brand.brand = [data objectForKey:@"brand"];
    brand.max_price = [data objectForKey:@"max_price"];
    brand.name = [data objectForKey:@"name"];
    brand.price = [data objectForKey:@"price"];
    NSMutableArray *simplesArray = [NSMutableArray new];
    NSArray *simplesFromDictionary = [data objectForKey:@"simples"];
    for (NSDictionary *d in simplesFromDictionary) {
        [simplesArray addObject:[simplesObject simpleFromDictionary:d]];
    }
    brand.simples = simplesArray;
    brand.identifier = [dictionary objectForKey:@"id"];
    NSMutableArray *imagesURLsArray = [NSMutableArray new];
    NSArray *imagesFromDictionary = [dictionary objectForKey:@"images"];
    for (NSDictionary *d in imagesFromDictionary) {
        [imagesURLsArray addObject:[NSURL URLWithString:[d objectForKey:@"path"]]];
    }
    brand.imagesURLs = imagesURLsArray;
    return brand;
}

@end
