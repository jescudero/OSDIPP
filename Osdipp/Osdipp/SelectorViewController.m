//
//  SelectorViewController.m
//  Osdipp
//
//  Created by Juan Escudero on 4/23/12.
//  Copyright (c) 2012 Three Pillar Global. All rights reserved.
//

#import "SelectorViewController.h"
#import "Preferences.h"
#import "AFNetworking.h"
#import "LocationViewController.h"
#import "Filter.h"
#import "Location.h"
#import "Address.h"


@implementation SelectorViewController

@synthesize delegate, selectedFilters, selKey, preSelectedMethod;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        selectores = [[NSMutableDictionary alloc]init];
        [selectores setObject:@"getPrestadores:" forKey:@"prestadores"];
        [selectores setObject:@"getEspecialidades:" forKey:@"especialidades"];
        [selectores setObject:@"getRegiones:" forKey:@"regiones"];
        [selectores setObject:@"getZonas:" forKey:@"zonas"];
        [selectores setObject:@"getPlanes:" forKey:@"planes"];
        [selectores setObject:@"getLocalidades:" forKey:@"localidades"];
        dataSource = [[NSMutableArray alloc]init];
        
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

- (void)viewDidLoad
{
    [super viewDidLoad];

    SEL s = NSSelectorFromString([selectores objectForKey:[selKey lowercaseString]]);
        
    [self performSelector:s withObject:nil];
    
    self.title = @"Seleccione";
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.leftBarButtonItem.title = @"Volver";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{    // Return the number of rows in the section.
    return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = ((Filter*)[dataSource objectAtIndex:indexPath.row]).description;
    cell.textLabel.textColor = [UIColor grayColor];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Filter *filter = [dataSource objectAtIndex:indexPath.row];
    
    NSLog(@"%@", selectedFilters);
    
    [selectedFilters setObject:filter forKey:[selKey lowercaseString]];

    [delegate didSelectElement:selectedFilters];

    [self.navigationController popViewControllerAnimated:YES];
}

-(void)getPrestadores:(NSString*)searchParam
{

    NSString *stringURL = [NSString stringWithFormat:@"%@%@/tipo_prestadores.json", BASEURL ,preSelectedMethod];
    
    NSURL *url = [NSURL URLWithString:stringURL];
        
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        
                                                        Filter* r;
                                                        for (id probDict in JSON ) {
                                                            r = [[Filter alloc] initWithDictionary:probDict];
                                                            [dataSource addObject:r];
                                                            
                                                        }
                                                        
                                                        [self.tableView reloadData];
                                                                                                                
                                                    }
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                    }];
    
    [operation start];
}

-(void)getEspecialidades:(NSString*)searchParam
{
    
    NSString *stringURL = [NSString stringWithFormat:@"%@%@/especialidades.json?clase_especialidad=%@", BASEURL, preSelectedMethod, searchParam];
    
    NSURL *url = [NSURL URLWithString:stringURL];
        
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        
                                                        Filter* r;
                                                        for (id probDict in JSON ) {
                                                            r = [[Filter alloc] initWithDictionary:probDict];
                                                            [dataSource addObject:r];
                                                            
                                                        }
                                                        
                                                        [self.tableView reloadData];

                                                    }
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                    }];
    
    [operation start];

}


-(void)getRegiones:(NSString*)searchParam{
    
    NSString *stringURL = [NSString stringWithFormat:@"%@%@/region.json?", BASEURL ,preSelectedMethod] ;
    
    NSURL *url = [NSURL URLWithString:stringURL];
        
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        
                                                        Filter* r;
                                                        for (id probDict in JSON ) {
                                                            r = [[Filter alloc] initWithDictionary:probDict];
                                                            [dataSource addObject:r];
                                                            
                                                        }
                                                        
                                                        [self.tableView reloadData];

                                                        
                                                    }
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                    }];
    
    [operation start];
}


-(void)getZonas:(NSString*)searchParam
{
    searchParam = ((Filter*)[selectedFilters objectForKey:@"regiones"])._id;
    
    NSString *stringURL = [NSString stringWithFormat:@"%@%@/zona.json?region_id=%@", BASEURL,preSelectedMethod, searchParam];
    
    NSURL *url = [NSURL URLWithString:stringURL];
        
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        
                                                        Filter* r;
                                                        for (id probDict in JSON ) {
                                                            r = [[Filter alloc] initWithDictionary:probDict];
                                                            [dataSource addObject:r];
                                                            
                                                        }
                                                        
                                                        [self.tableView reloadData];
                                                        
                                                    }
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                    }];
    
    [operation start];
}

-(void)getPlanes:(NSString*)searchParam
{
    
    NSString *stringURL = [NSString stringWithFormat:@"%@%@/plan.json", BASEURL, preSelectedMethod] ;
    
    NSURL *url = [NSURL URLWithString:stringURL];
        
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        
                                                        Filter* r;
                                                        for (id probDict in JSON ) {
                                                            r = [[Filter alloc] initWithDictionary:probDict];
                                                            [dataSource addObject:r];
                                                            
                                                        }
                                                        
                                                        [self.tableView reloadData];
                                                        
                                                    }
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                    }];
    
    [operation start];
}

-(void)getLocalidades:(NSString*)searchParam
{
    searchParam = ((Filter*)[selectedFilters objectForKey:@"zonas"])._id;

    NSString *stringURL = [NSString stringWithFormat:@"%@%@/localidad.json?region_id=%@", BASEURL,preSelectedMethod, searchParam];
    
    NSURL *url = [NSURL URLWithString:stringURL];
        
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        
                                                        Filter* r;
                                                        for (id probDict in JSON ) {
                                                            r = [[Filter alloc] initWithDictionary:probDict];
                                                            [dataSource addObject:r];
                                                            
                                                        }
                                                        
                                                        [self.tableView reloadData];
                                                        
                                                    }
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                    }];
    
    [operation start];
    
}





@end
