//
//  PharmacyViewController.m
//  Osdipp
//
//  Created by Alan Oscar Gostanian on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LocationViewController.h"
#import "LocationCellView.h"
#import "Location.h"
#import "Address.h"

@implementation LocationViewController
@synthesize dataSource;

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
    if ([[[UIDevice currentDevice] model] rangeOfString:@"iPad"].location != NSNotFound) {
        addressLabelWidth = 728;
    }else{
        addressLabelWidth = 280;
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor blackColor];    // Release any retained subviews of the main view.
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
    static NSString *CellIdentifier = @"LocationCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Location* loc = (Location*)[dataSource objectAtIndex:indexPath.row];
    UILabel* titleLabel = (UILabel*)[cell viewWithTag:1];
    titleLabel.text = loc.name;
    // Configure the cell...
    
    
    for (UIView* v in [cell.contentView subviews]) {
        NSLog(@"%d",v.tag);

        if (v.tag >= 99) {
            [v removeFromSuperview];
        }
    }
    

    int i = 0;

    for (Address* add in loc.addresses) {
        
        UILabel* lblAddress = [[UILabel alloc] initWithFrame:CGRectMake(20, 50+(i*90), addressLabelWidth, 53)];
        NSMutableString* fullAddress = [[NSMutableString alloc] init];
        [fullAddress appendString:add.street];
        [fullAddress appendString:@", "];
        [fullAddress appendString:add.locality];
        [fullAddress appendString:@", "];
        [fullAddress appendString:add.zone];
        [fullAddress appendString:@", "];
        [fullAddress appendString:add.state];
        
        lblAddress.text = fullAddress;
        lblAddress.tag = 200;
        lblAddress.font = [UIFont systemFontOfSize:17.0];
        lblAddress.lineBreakMode = UILineBreakModeTailTruncation;
        lblAddress.numberOfLines = 2;
        lblAddress.textColor = [UIColor grayColor];
        lblAddress.font = [UIFont boldSystemFontOfSize:17.0];
        
        [cell.contentView addSubview:lblAddress];
        
        UITextView* txtTels = [[UITextView alloc] initWithFrame:CGRectMake(14, 102+(i*90), addressLabelWidth + 6, 48)];
        txtTels.editable = NO;
        txtTels.font = [UIFont italicSystemFontOfSize:14.0];
        txtTels.dataDetectorTypes = UIDataDetectorTypeAll;
        
        NSMutableString* tels = [[NSMutableString alloc] init];
        [tels appendString:@"Tels: "];
        for (NSString* t in add.tels) {
            [tels appendString:t];
            if ([add.tels lastObject] != t) {
                [tels appendString:@", "];                
            }
        }
        txtTels.text = tels;
        txtTels.tag = 300;
        [cell.contentView addSubview:txtTels];
        
        i++;
    }


    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170.0+(100*([((Location*)[dataSource objectAtIndex:indexPath.row]).addresses count]-1));
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
