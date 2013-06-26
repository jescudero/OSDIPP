//
//  Address.h
//  Osdipp
//
//  Created by Alan Oscar Gostanian on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject{
    
    NSString* _id; 
    NSString *street;
    NSString* locality;
    NSString* zone;
    NSString* state;
    NSMutableArray* tels;
}

@property (nonatomic, copy) NSString* _id;
@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *locality;
@property (nonatomic, copy) NSString *zone;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, retain) NSMutableArray *tels;

-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
