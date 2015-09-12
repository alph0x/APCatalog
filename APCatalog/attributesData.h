//
//  attributesData.h
//  
//
//  Created by Alfredo E. Pérez L. on 9/11/15.
//
//

#import <Foundation/Foundation.h>

@interface attributesData : NSObject

@property (strong, nonatomic) NSString *size;

+(attributesData *) attributesDataFromDictionary:(NSDictionary *) dictionary;

@end
