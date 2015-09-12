//
//  simplesObject.m
//  
//
//  Created by Alfredo E. Pérez L. on 9/11/15.
//
//

#import "simplesObject.h"

@implementation simplesObject

+(simplesObject *)simpleFromDictionary:(NSDictionary *)dictionary {
    simplesObject *simple = [simplesObject new];
    simple.productIdentifier = [[dictionary allKeys] objectAtIndex:0];
    simple.meta = [simplesData simpleDataFromDictionary:[dictionary objectForKey:@"meta"]];
    simple.attributes = [attributesData attributesDataFromDictionary:[dictionary objectForKey:@"attributes"]];
    return simple;
}

@end
