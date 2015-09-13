    //
//  clothingData.m
//  
//
//  Created by Alfredo E. Pérez L. on 9/12/15.
//
//

#import "clothingData.h"
#import <DFCache/DFCache.h>

@implementation clothingData

+(clothingData *)clothingFromDictionary:(NSDictionary *)dictionary {
    clothingData *clothing = [clothingData new];
    NSDictionary *data =[dictionary objectForKey:@"data"];
    
    clothing.brand = [data objectForKey:@"brand"];
    clothing.max_price = [data objectForKey:@"max_price"];
    clothing.name = [data objectForKey:@"name"];
    clothing.price = [data objectForKey:@"price"];
    NSMutableArray *simplesArray = [NSMutableArray new];
    NSArray *simplesFromDictionary = [data objectForKey:@"simples"];
//    for (NSDictionary *d in simplesFromDictionary) {
//        [simplesArray addObject:[simplesObject simpleFromDictionary:d]];
//    }
//    clothing.simples = simplesArray;
    clothing.identifier = [dictionary objectForKey:@"id"];
    NSMutableArray *imagesURLsArray = [NSMutableArray new];
    NSArray *imagesFromDictionary = [dictionary objectForKey:@"images"];
    DFCache *cache = [[DFCache alloc] initWithName:[NSString stringWithFormat:@"%@-%@", clothing.brand, clothing.name]];
    for (NSDictionary *d in imagesFromDictionary) {
        NSString *path = [d objectForKey:@"path"];
        UIImage *picture = [cache cachedObjectForKey:path];
        if (!picture) {
            picture = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:path]]];
            [cache storeObject:picture forKey:path];
            
        }
        
        [imagesURLsArray addObject:picture];
        
    }
    clothing.imagesURLs = imagesURLsArray;
    return clothing;
}

@end
