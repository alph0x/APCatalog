//
//  clothingData.h
//  
//
//  Created by Alfredo E. Pérez L. on 9/12/15.
//
//

#import <Foundation/Foundation.h>
#import "simplesObject.h"

@interface clothingData : NSObject

@property (strong, nonatomic) NSString *brand;
@property (assign, nonatomic) NSNumber *max_price;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSArray  *simples; //simplesObject Array.
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSArray  *imagesURLs;

+(clothingData *) clothingFromDictionary:(NSDictionary *) dictionary;

@end
