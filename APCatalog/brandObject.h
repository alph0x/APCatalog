//
//  brandObject.h
//  
//
//  Created by Alfredo E. Pérez L. on 9/11/15.
//
//

#import <Foundation/Foundation.h>
#import "simplesObject.h"

@interface brandObject : NSObject

@property (strong, nonatomic) NSString *brand;
@property (assign, nonatomic) NSNumber *max_price;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSArray  *simples; //simplesObject Array.
@property (strong, nonatomic) NSString *identifier;
@property (strong, nonatomic) NSArray  *imagesURLs;

+(brandObject *) brandFromDictionary:(NSDictionary *) dictionary;

@end
