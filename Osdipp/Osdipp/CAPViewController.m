//
//  CAPViewController.m
//  Osdipp
//
//  Created by Alan Gostanian on 25/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CAPViewController.h"
#import "CAPCell.h"
#import "CAP.h"

@implementation CAPViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

-(NSMutableArray*)getCAPS{
    NSMutableArray *ret = [[NSMutableArray alloc] init];
    
    CAP* cap = [[CAP alloc] init];
    cap.name = @"Microcentro";
    cap.address = @"Leandro N. Alem 538/44";
    cap.city = @"Capital Federal (C1001AAN)";
    cap.telephone = @"(011) 5129-3900";
    cap.email = @"microcentro@osdipp.com";
    
    [ret addObject:cap];
    
    cap = [[CAP alloc] init];
    cap.name = @"Campana";
    cap.address = @"Güemes 865";
    cap.city = @"Campana (B2804AKI) Provincia de Buenos Aires";
    cap.telephone = @"(03489) 42-1129 / (03489) 42-6373";
    cap.email = @"campana@osdipp.com.ar";
    [ret addObject:cap];
    
    cap = [[CAP alloc] init];
    cap.name = @"Bahia Blanca";
    cap.address = @"Soler 160";
    cap.city = @"Bahía Blanca (B80000ZAA) Provincia de Buenos Aires";
    cap.telephone = @"(0291) 451-1022 / (0291) 400-2004 / (0291) 400-2005";
    cap.email = @"bahiablanca@osdipp.com";
    [ret addObject:cap];
    
    cap = [[CAP alloc] init];
    cap.name = @"Mendoza";
    cap.address = @"Arístides Villanueva 447";
    cap.city = @"Provincia de Mendoza (M5500AFR)";
    cap.telephone = @"(0261) 429-4460 / (0261) 420-4117 / (0261) 420-0741";
    cap.email = @"mendoza@osdipp.com";
    [ret addObject:cap];
    
    cap = [[CAP alloc] init];
    cap.name = @"Neuquén";
    cap.address = @"Alberdi 184";
    cap.city = @"Provincia de Neuquén (Q8300HLD)";
    cap.telephone = @"(0299) 442-5501 / (0299) 447-3814";
    cap.email = @"neuquen@osdipp.com";
    [ret addObject:cap];
    
    cap = [[CAP alloc] init];
    cap.name = @"Comodoro Rivadavia";
    cap.address = @"25 de Mayo 964";
    cap.city = @"Provincia de Chubut (U9000CUJ)";
    cap.telephone = @"(0297) 446-2356 / (0297) 447-5545 / (0297) 444-4946 / (0297) 444-4566";
    cap.email = @"crivadavia@osdipp.com";
    [ret addObject:cap];
    
    cap = [[CAP alloc] init];
    cap.name = @"Tartagal";
    cap.address = @"Centro de Atención";
    cap.city = @"Provincia de Salta";
    cap.telephone = @"(03873) 42-42215";
    cap.email = @"tartagal@osdipp.com";
    [ret addObject:cap];
    
    cap = [[CAP alloc] init];
    cap.name = @"Sede Administrativa";
    cap.address = @"25 de Mayo 537 1º subsuelo";
    cap.city = @"Capital Federal (C1200ABK)";
    cap.telephone = @"(011) 5129-3900";
    cap.email = @"info@osdipp.com";
    [ret addObject:cap];
    
    cap = [[CAP alloc] init];
    cap.name = @"Caleta Olivia";
    cap.address = @"San Jose Obrero 265";
    cap.city = @"Pcia. de Santa Cruz (Z9011HQE)";
    cap.telephone = @"(0297) 483-5942";
    cap.email = @"caletaolivia@osdipp.com";
    [ret addObject:cap];
    
    cap = [[CAP alloc] init];
    cap.name = @"Rio Gallegos";
    cap.address = @"Av. Pte. Néstor C. Kirchner 409";
    cap.city = @"Provincia de Santa Cruz - (Z9400BAD)";
    cap.telephone = @"(02966) 420620 / 15-489954";
    cap.email = @"riogallegos@osdipp.com";
    [ret addObject:cap];
    
    cap = [[CAP alloc] init];
    cap.name = @"Rio Grande";
    cap.address = @"Miguel Cané 28";
    cap.city = @"Pcia. de Tierra del Fuego (V9420CQB)";
    cap.telephone = @"(02964) 42-7608 Cel:(02964) 15-551715";
    cap.email = @"riogrande@osdipp.com";
    [ret addObject:cap];
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                  ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSMutableArray *sortedArray;
    sortedArray = (NSMutableArray*)[ret sortedArrayUsingDescriptors:sortDescriptors];
    
    return sortedArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIImage *backgroundImage = [UIImage imageNamed:@"navBarIpad.png"];
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    dataSource = [[NSMutableArray alloc] initWithArray:[self getCAPS]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor blackColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
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

    // Return the number of rows in the section.
    return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CAPCell";
    
    CAPCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CAPCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    CAP *cap = (CAP*)[dataSource objectAtIndex:indexPath.row];
    
    // Configure the cell...
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.txtTel.scrollEnabled = NO;
    cell.txtEmail.scrollEnabled = NO;
    
    
    cell.lblTitle.text = cap.name;
    cell.lblAddress1.text = cap.address;
    cell.lblAddress2.text = cap.city;
    cell.txtTel.text = cap.telephone; 
    cell.txtEmail.text = cap.email; 
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *deviceType = [UIDevice currentDevice].model;
    
    NSRange aRange = [deviceType rangeOfString:@"iPad"];
    if (aRange.location != NSNotFound) 
    {
        return 160.0;
    }
    else
    {
        return 230.0;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
