//
//  DashboardViewController.m
//  Osdipp
//
//  Created by Alan Oscar Gostanian on 3/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DashboardViewController.h"
#import "Filter.h"
#import "Location.h"
#import "Address.h"
#import "LocationViewController.h"
#import "FormSelectionViewController.h"

#define MEDICA_PLACEHOLDER @"medica"
#define FARMACIA_PLACEHOLDER @"farmacia"

@implementation DashboardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menú"
                                                                             style:UIBarButtonItemStyleBordered
                                                                            target:nil
                                                                            action:nil];
    
    
    UIImage *backgroundImage = [UIImage imageNamed:@"navBarIpad.png"];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return NO;
}

/*
-(NSArray*)getPrestadores:(NSString*)searchParam
{
    NSError *error= nil;
    
    RemoteRequest *request =[[RemoteRequest alloc]init];
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc]init];
    
    NSMutableArray *ret = [[NSMutableArray alloc] init];        
    
    
    [request SendCommandRequest:@"tipo_prestadores" withParams:paramDic error:&error];
    
    if (error == nil) {
        if (request.array)
        {
            Filter* r;
            for (NSDictionary* probDict in request.array ) {
                r = [[Filter alloc] initWithDictionary:probDict];
                [ret addObject:r];
                
            }
        }    
    }
    
    return ret;
    
}

-(NSArray*)getEspecialidades:(NSString*)searchParam
{
    NSError *error= nil;
    
    RemoteRequest *request =[[RemoteRequest alloc]init];
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc]init];
    
    NSMutableArray *ret = [[NSMutableArray alloc] init];        
    
    NSString *url = [NSString stringWithFormat:@"tipo_prestadores/%@/especialidades", searchParam];
    
    [request SendCommandRequest:url withParams:paramDic error:&error];
    
    if (error == nil) {
        if (request.array)
        {
            Filter* r;
            for (NSDictionary* probDict in request.array ) {
                r = [[Filter alloc] initWithDictionary:probDict];
                [ret addObject:r];
                
            }
        }    
    }
    
    return ret;
}


-(NSArray*)getRegiones:(NSString*)searchParam{
    
    NSError *error= nil;
    
    RemoteRequest *request =[[RemoteRequest alloc]init];
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc]init];
    
    NSMutableArray *ret = [[NSMutableArray alloc] init];        
    
    
    [request SendCommandRequest:@"regiones" withParams:paramDic error:&error];
    
    if (error == nil) {
        if (request.array)
        {
            Filter* r;
            for (NSDictionary* probDict in request.array ) {
                r = [[Filter alloc] initWithDictionary:probDict];
                [ret addObject:r];
                
            }
        }    
    }
    
    return ret;
}


-(NSArray*)getZonas:(NSString*)searchParam
{
    NSError *error= nil;
    
    RemoteRequest *request =[[RemoteRequest alloc]init];
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc]init];
    
    NSMutableArray *ret = [[NSMutableArray alloc] init];        
    
    NSString *url = [NSString stringWithFormat:@"regiones/%@/zonas", searchParam];
    
    [request SendCommandRequest:url withParams:paramDic error:&error];
    
    if (error == nil) {
        if (request.array)
        {
            Filter* r;
            for (NSDictionary* probDict in request.array ) {
                r = [[Filter alloc] initWithDictionary:probDict];
                [ret addObject:r];
                
            }
        }    
    }
    
    return ret;
}

-(NSArray*)getPlanes:(NSString*)searchParam
{
    NSError *error= nil;
    
    RemoteRequest *request =[[RemoteRequest alloc]init];
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc]init];
    
    NSMutableArray *ret = [[NSMutableArray alloc] init];        
    
    
    [request SendCommandRequest:@"planes" withParams:paramDic error:&error];
    
    if (error == nil) {
        if (request.array)
        {
            Filter* r;
            for (NSDictionary* probDict in request.array ) {
                r = [[Filter alloc] initWithDictionary:probDict];
                [ret addObject:r];
                
            }
        }    
    }
    
    return ret;
}

-(NSArray*)getLocalidades:(NSString*)searchParam
{
    NSError *error= nil;
    
    RemoteRequest *request =[[RemoteRequest alloc]init];
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc]init];
    
    
    NSMutableArray *ret = [[NSMutableArray alloc] init];        
    
    NSString *url = [NSString stringWithFormat:@"zonas/%@/localidades", searchParam];
    
    [request SendCommandRequest:url withParams:paramDic error:&error];
    
    if (error == nil) {
        if (request.array)
        {
            Filter* r;
            for (NSDictionary* probDict in request.array ) {
                r = [[Filter alloc] initWithDictionary:probDict];
                [ret addObject:r];
                
            }
        }    
    }
    
    return ret;
}

-(NSArray*)getFarmacias:(NSArray*)selectedOptions
{
    NSError *error= nil;
    
    RemoteRequest *request =[[RemoteRequest alloc]init];
    
    NSMutableArray *ret = [[NSMutableArray alloc] init];        
    
    NSString *url = [NSString stringWithFormat:@"farmacias?localidad_id?%@", [[selectedOptions lastObject] _id]];
    
    [request SendCommandRequest:url withParams:nil error:&error];
    
    if (error == nil) {
        if (request.array)
        {
            Location* l;
            for (NSDictionary* locDict in request.array ) {
                l = [[Location alloc] initWithDictionary:locDict];
                [ret addObject:l];
                
            }
        }    
    }
    
    return ret;
}
 
 

-(NSArray*)getCartilla:(NSArray*)selectedOptions
{
    NSError *error= nil;
    
    RemoteRequest *request =[[RemoteRequest alloc]init];
    
    NSMutableArray *ret = [[NSMutableArray alloc] init];        
    
    NSString *url = [NSString stringWithFormat:@"cartilla?plan_id=%@&especialidad_id=%@&localidad_id=%@", [[selectedOptions objectAtIndex:6] _id], [[selectedOptions objectAtIndex:2] _id], [[selectedOptions objectAtIndex:5] _id]];
    
    [request SendCommandRequest:url withParams:nil error:&error];
    
    if (error == nil) {
        if (request.array)
        {
            Location* l;
            for (NSDictionary* locDict in request.array ) {
                l = [[Location alloc] initWithDictionary:locDict];
                [ret addObject:l];
                
            }
        }    
    }
    
    return ret;
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"MedicaSegue"]){
        FormSelectionViewController *vc = (FormSelectionViewController *)[segue destinationViewController];
        vc.isCartilla = TRUE;
    }
    if([[segue identifier] isEqualToString:@"FarmaciaSegue"]){
 
        FormSelectionViewController *vc = (FormSelectionViewController *)[segue destinationViewController];
        vc.isCartilla = FALSE;
    }
}

-(UIViewController *)getLastViewControllerWithOptions:(NSArray *)options{
    
    LocationViewController* vc;
    vc  = [self.storyboard instantiateViewControllerWithIdentifier:@"LocationVC"];
    
    NSArray* datasource;
   /* if ([[options objectAtIndex:0] isEqualToString:MEDICA_PLACEHOLDER])
        datasource = [self getCartilla:options];
    else
        datasource = [self getFarmacias:options];*/
    
    vc.dataSource = datasource;
    
    
    return vc;
}

@end
