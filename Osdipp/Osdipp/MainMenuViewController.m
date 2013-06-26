//
//  MainMenuViewController.m
//  Osdipp
//
//  Created by Alan Gostanian on 25/02/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainMenuViewController.h"
#import "LocationViewController.h"
#import "Filter.h"
#import "Location.h"
#import "Address.h"
#import "FormSelectionViewController.h"
#import "EmergenciasViewController.h"

#define MEDICA_PLACEHOLDER @"medica"
#define FARMACIA_PLACEHOLDER @"farmacia"

@implementation MainMenuViewController


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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menú"
                                                                            style:UIBarButtonItemStyleBordered
                                                                            target:nil
                                                                            action:nil];
    
    
    

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

/*
-(UIViewController *)getLastViewControllerWithOptions:(NSArray *)options{

    LocationViewController* vc;
    vc  = [self.storyboard instantiateViewControllerWithIdentifier:@"LocationVC"];
    
    NSArray* datasource;
    if ([[options objectAtIndex:0] isEqualToString:MEDICA_PLACEHOLDER]) 
        datasource = [self getCartilla:options];
    else
        datasource = [self getFarmacias:options];

    vc.dataSource = datasource;


    return vc;
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

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{

    if (item.tag == 1)
    {
        EmergenciasViewController *vc = [[EmergenciasViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
