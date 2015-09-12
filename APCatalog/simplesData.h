//
//  simplesData.h
//  
//
//  Created by Alfredo E. Pérez L. on 9/11/15.
//
//

#import <Foundation/Foundation.h>

@interface simplesData : NSObject

@property (strong, nonatomic) NSString *SKU;
@property (assign, nonatomic) NSNumber *shipment_cost_item;
@property (assign, nonatomic) NSNumber *shipment_cost_order;
@property (assign, nonatomic) NSNumber *fk_catalog_attribute_option_global_estimated_delivery;
@property (assign, nonatomic) NSNumber *quantity;
@property (assign, nonatomic) NSNumber *cost;
@property (strong, nonatomic) NSString *estimated_delivey;
@property (assign, nonatomic) NSNumber *length;
@property (assign, nonatomic) NSNumber *cost_supplier_currency_position;
@property (assign, nonatomic) NSNumber *price;
@property (strong, nonatomic) NSString *size_brand;
@property (assign, nonatomic) NSNumber *bust;
@property (assign, nonatomic) NSNumber *waist;
@property (assign, nonatomic) NSNumber *hem;
@property (strong, nonatomic) NSString *cost_supplier_currency;
@property (assign, nonatomic) NSNumber *tax_percent;
@property (assign, nonatomic) NSNumber *shoulder;
@property (strong, nonatomic) NSString *caching_hash;
@property (assign, nonatomic) NSNumber *estimated_delivery_ms_position;
@property (assign, nonatomic) NSNumber *size_position;
@property (assign, nonatomic) NSNumber *estimate_delivery_position;
@property (assign, nonatomic) NSNumber *sleeve_opening;


@end
