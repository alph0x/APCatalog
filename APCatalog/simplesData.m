//
//  simplesData.m
//  
//
//  Created by Alfredo E. Pérez L. on 9/11/15.
//
//

#import "simplesData.h"

@implementation simplesData

+(simplesData *)simpleDataFromDictionary:(NSDictionary *)dictionary {
    simplesData *meta = [simplesData new];
    meta.SKU = [dictionary objectForKey:@"sku"];
    meta.shipment_cost_item = [dictionary objectForKey:@"shipment_cost_item"];
    meta.shipment_cost_order = [dictionary objectForKey:@"shipment_cost_order"];
    meta.fk_catalog_attribute_option_global_estimated_delivery = [dictionary objectForKey:@"fk_catalog_attribute_option_global_estimated_delivery"];
    meta.quantity = [dictionary objectForKey:@"quantity"];
    meta.cost = [dictionary objectForKey:@"cost"];
    meta.estimated_delivey = [dictionary objectForKey:@"estimated_delivery"];
    meta.length = [dictionary objectForKey:@"length"];
    meta.cost_supplier_currency_position = [dictionary objectForKey:@"cost_supplier_currency_position"];
    meta.price = [dictionary objectForKey:@"price"];
    meta.size_brand = [dictionary objectForKey:@"size_brand"];
    meta.bust = [dictionary objectForKey:@"bust"];
    meta.waist = [dictionary objectForKey:@"waist"];
    meta.hem = [dictionary objectForKey:@"hem"];
    meta.cost_supplier_currency  = [dictionary objectForKey:@"cost_supplier_currency"];
    meta.tax_percent = [dictionary objectForKey:@"tax_percent"];
    meta.shoulder = [dictionary objectForKey:@"shoulder"];
    meta.caching_hash = [dictionary objectForKey:@"caching_hash"];
    meta.estimated_delivery_ms_position = [dictionary objectForKey:@"estimated_delivery_ms_position"];
    meta.size_position = [dictionary objectForKey:@"size_position"];
    meta.estimate_delivery_position = [dictionary objectForKey:@"estimate_delivery_position"];
    meta.sleeve_opening = [dictionary objectForKey:@"sleeve_opening"];
    
    return meta;
}

@end
