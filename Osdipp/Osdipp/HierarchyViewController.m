//
//  HierarchyViewController.m
//  test
//
//  Created by Alan Oscar Gostanian on 3/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HierarchyViewController.h"
#import "Filter.h"

@implementation HierarchyViewController
@synthesize dataSource, blocks, selectedOptions, delegate;

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
    NSArray* (^pointerToBlock)(NSString*) = [blocks lastObject];
    dataSource = [[NSArray alloc] initWithArray: pointerToBlock([[selectedOptions lastObject] isKindOfClass:[Filter class]] ? [[selectedOptions lastObject] _id] : @"")];
    if (selectedOptions == nil) {
        selectedOptions = [[NSMutableArray alloc] init];
    }
  //  dataSource = [[NSArray alloc] initWithObjects:@"hola", nil];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataSource count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"MyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    
    cell.textLabel.text = ((Filter*)[dataSource objectAtIndex:indexPath.row]).description;
    cell.textLabel.textColor = [UIColor grayColor];
    
    return cell;
}

-(void)pushLastViewController:(NSMutableArray*)optionList{
    //HERE GOES THE INSTANTIATION AND PARAMETERS SET TO THE LAST VIEW CONTROLLER TO PUSH.
    //OPTIONS SELECTED ARE IN selectedOptions
    UIViewController* vc = [delegate getLastViewControllerWithOptions:optionList];
    [self.navigationController pushViewController:vc animated:YES];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //[selectedOptions addObject:[dataSource objectAtIndex:indexPath.row]];
    if ([blocks count]>1) {
        HierarchyViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Hierarchy"];
        NSMutableArray* blocks2 = [[NSMutableArray alloc] initWithArray:blocks];
        [blocks2 removeObject:[blocks lastObject]];
        vc.blocks = blocks2;
        vc.selectedOptions = [[NSMutableArray alloc] initWithArray: selectedOptions];
        [vc.selectedOptions addObject:[dataSource objectAtIndex:indexPath.row]];
        vc.delegate = delegate;
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        NSMutableArray* finalOptionList = [[NSMutableArray alloc] initWithArray: selectedOptions];
        [finalOptionList addObject:[dataSource objectAtIndex:indexPath.row]];
        [self pushLastViewController:finalOptionList];
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


@end
