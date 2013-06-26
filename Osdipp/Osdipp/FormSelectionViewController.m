//
//  FormSelectionViewController.m
//  Osdipp
//
//  Created by Juan Francisco on 21/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FormSelectionViewController.h"
#import "Preferences.h"
#import "HierarchyViewController.h"
#import "LocationViewController.h"
#import "AFNetworking.h"
#import "Filter.h"
#import "Location.h"
#import "Address.h"
#import "SelectorViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation FormSelectionViewController


@synthesize isCartilla;

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

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (isCartilla)
        opciones = [[NSMutableArray alloc]initWithObjects:@"Prestadores",@"Especialidades",@"Regiones",@"Zonas",@"Localidades",@"Planes", nil];
    else
        opciones = [[NSMutableArray alloc]initWithObjects:@"Regiones",@"Zonas",@"Localidades",@"Planes", nil];
    
    if (selected == nil) {
        selected = [[NSMutableDictionary alloc] init];
    }
    
    self.optionsTable.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.optionsTable.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    self.optionsTable.layer.shadowOpacity = 0.4;
    self.optionsTable.layer.shadowRadius = 5.0f;
    self.optionsTable.clipsToBounds = NO;
    self.optionsTable.layer.masksToBounds = NO;
    
    
    self.scrollView.contentSize = CGSizeMake(320, 500);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setSearchButtom:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [opciones count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    if ([selected objectForKey:[((NSString*)[opciones objectAtIndex:indexPath.row])lowercaseString]] == nil)
    {
        cell.textLabel.text = [opciones objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [NSString stringWithFormat:@"%@ > %@",[opciones objectAtIndex:indexPath.row], [selected objectForKey:[((NSString*)[opciones objectAtIndex:indexPath.row])lowercaseString]]];
    }
    
    
    return cell;
}


#pragma mark - Table view delegate
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     
    if (indexPath.section == 0)
    {
        SelectorViewController *vc = [[SelectorViewController alloc]init];
        if (isCartilla)
            vc.preSelectedMethod = @"cartilla";
        else
            vc.preSelectedMethod = @"farmacias";
        vc.selectedFilters = selected;
        vc.delegate = self;
        vc.selKey = [opciones objectAtIndex:indexPath.row];
    
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        LocationViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LocationVC"];
        if (isCartilla)
            vc.dataSource = [self getCartilla:selected];
        else
            vc.dataSource = [self getFarmacias:selected];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)getCartilla:(NSDictionary*)selectedOptions
{
     NSString *stringURL = [NSString stringWithFormat:@"%@cartilla?plan_id=%@&especialidad_id=%@&localidad_id=%@", BASEURL , [[selectedOptions objectForKey:@"planes"] _id], [[selectedOptions objectForKey:@"especialidades"] _id], [[selectedOptions objectForKey:@"localidades"] _id]];
    
    NSURL *url = [NSURL URLWithString:stringURL];

    NSMutableArray *ret = [[NSMutableArray alloc] init];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        
                                                            Location* l;
                                                            for (id locDict in JSON) {
                                                                l = [[Location alloc] initWithDictionary:locDict];
                                                                [ret addObject:l];
                                                                
                                                            }
                                                    
                                                    }
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                    }];
    
    // 5
    [operation start];
    
    
}

-(void)getFarmacias:(NSDictionary*)selectedOptions
{
    NSString *stringURL = [NSString stringWithFormat:@"%@%@farmacias?localidad_id?%@",BASEURL ,[[selectedOptions objectForKey:@"localidades"] _id]];
    
    NSURL *url = [NSURL URLWithString:stringURL];
    
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                        
                                                        Location* l;
                                                        for (id locDict in JSON) {
                                                            l = [[Location alloc] initWithDictionary:locDict];
                                                            [ret addObject:l];
                                                            
                                                        }
                                                        
                                                    }
                                                    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                                                     message:[NSString stringWithFormat:@"%@",error]
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK" otherButtonTitles:nil];
                                                        [av show];
                                                    }];
    
    // 5
    [operation start];
    
    

}

-(void)didSelectElement:(NSMutableDictionary *)options{
    NSLog(@"%@", options);
    selected = options;
    [self.optionsTable reloadData];

}

@end
