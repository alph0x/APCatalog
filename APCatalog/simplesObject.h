//
//  simplesObject.h
//  
//
//  Created by Alfredo E. Pérez L. on 9/11/15.
//
//

#import <Foundation/Foundation.h>
#import "simplesData.h"
#import "attributesData.h"

@interface simplesObject : NSObject

@property (strong, nonatomic) NSString * productIdentifier;
@property (strong, nonatomic) simplesData *meta;
@property (strong, nonatomic) attributesData *attributes;

+(simplesObject *) simpleFromDictionary:(NSDictionary *) dictionary;

@end
