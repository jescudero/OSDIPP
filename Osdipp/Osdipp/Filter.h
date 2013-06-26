//
//  Region.h
//  Osdipp
//
//  Created by Juan Escudero on 03/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Filter : NSObject {
    
    NSString* _id; 
    NSString *description;
}

@property (nonatomic, copy) NSString* _id;
@property (nonatomic, copy) NSString *description;

-(id)initWithDictionary:(NSDictionary*)dictionary;


@end
