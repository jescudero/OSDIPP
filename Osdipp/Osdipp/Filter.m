//
//  Region.m
//  Osdipp
//
//  Created by Juan Escudero on 03/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Filter.h"

@implementation Filter

@synthesize _id, description;


-(id)initWithDictionary:(NSDictionary*)dictionary{
    self = [self init];
    
    if (self) {
        self._id = [NSString stringWithFormat:@"%d", [[dictionary objectForKey:@"id"] intValue] ];
        self.description = [dictionary objectForKey:@"nombre"];
    }
    
    return self;
}


@end
