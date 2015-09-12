//
//  attributesData.m
//  
//
//  Created by Alfredo E. Pérez L. on 9/11/15.
//
//

#import "attributesData.h"

@implementation attributesData

+(attributesData *)attributesDataFromDictionary:(NSDictionary *)dictionary {
    attributesData *attributes = [attributesData new];
    
    attributes.size = [dictionary objectForKey:@"size"];
    
    return attributes;
}

@end
