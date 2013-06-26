//
//  Location.h
//  Osdipp
//
//  Created by Alan Oscar Gostanian on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject{
    
    NSString *name;
    NSString* observations;
    NSMutableArray* addresses;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *observations;
@property (nonatomic, retain) NSMutableArray *addresses;

-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
