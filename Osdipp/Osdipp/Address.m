//
//  Address.m
//  Osdipp
//
//  Created by Alan Oscar Gostanian on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Address.h"

@implementation Address
@synthesize _id, state, street, tels, zone, locality;


-(id)initWithDictionary:(NSDictionary*)dictionary{
    self = [self init];
    
    if (self) {
        self.street = [dictionary objectForKey:@"direccion"];
        self.state = [dictionary objectForKey:@"provincia"];
        self.zone = [dictionary objectForKey:@"zona"];
        self.locality = [dictionary objectForKey:@"localidad"];
        self.tels = [[NSMutableArray alloc]init];

        for (NSString* tel in[dictionary objectForKey:@"telefonos"] ) {
            [self.tels addObject:tel];
        }   
    }
    
    return self;
}
@end
