//
//  Location.m
//  Osdipp
//
//  Created by Alan Oscar Gostanian on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Location.h"
#import "Address.h"
@implementation Location
@synthesize name, addresses, observations;


-(id)initWithDictionary:(NSDictionary*)dictionary{
    self = [self init];
    
    if (self) {
       
        self.name = [dictionary objectForKey:@"nombre"];
        self.observations = [dictionary objectForKey:@"observacion"];
        self.addresses = [[NSMutableArray alloc]init];
        
        for (NSDictionary* dic in[dictionary objectForKey:@"domicilios"] ) {
            Address* a = [[Address alloc]initWithDictionary:dic];
            [self.addresses addObject:a];
        }        
    }
    
    return self;
}
@end
