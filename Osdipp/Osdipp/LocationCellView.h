//
//  PharmacyCellView.h
//  Osdipp
//
//  Created by Alan Oscar Gostanian on 3/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationCellView : UIViewController{
    
    IBOutlet UITextView* txtTel;    
    IBOutlet UILabel* lblAddress;
    
}    

-(void)setTelephone:(NSString *)telephone;
-(void)setAddress:(NSString *)address;

@end
