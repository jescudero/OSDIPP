//
//  EmergenciasViewController.m
//  Osdipp
//
//  Created by Juan Escudero on 2/28/12.
//  Copyright (c) 2012 Three Pillar Global. All rights reserved.
//

#import "EmergenciasViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface EmergenciasViewController()
{
    NSMutableArray *telefonosEmergenciasNacionales;
    NSMutableArray *telefonosEmergenciasDomiciliarias;
}

@end

@implementation EmergenciasViewController

@synthesize scrollView;

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
    
    self.navigationController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Volver" style:UIBarButtonItemStyleDone target:self action:@selector(backButtonTapped:)];
    
    telefonosEmergenciasNacionales = [[NSMutableArray alloc]initWithObjects:@"0800-888-7654", @"0800-333-7654", @"(011) 4323-0423", @"(011) 4323-0433", @"(011) 4788-6666", @"(011) 4788-6688", @"0810-333-8888",nil];

    telefonosEmergenciasDomiciliarias = [[NSMutableArray alloc]initWithObjects:@"0810-333-8888",nil];
    
    [scrollView setScrollEnabled:YES];
    [scrollView setContentSize:CGSizeMake(320, 580)];
    
    self.tableViewNacional.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.tableViewNacional.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    self.tableViewNacional.layer.shadowOpacity = 0.4;
    self.tableViewNacional.layer.shadowRadius = 5.0f;
    self.tableViewNacional.clipsToBounds = NO;
    self.tableViewNacional.layer.masksToBounds = NO;

    self.tableViewDomicilio.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.tableViewDomicilio.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);
    self.tableViewDomicilio.layer.shadowOpacity = 0.4;
    self.tableViewDomicilio.layer.shadowRadius = 5.0f;
    self.tableViewDomicilio.clipsToBounds = NO;
    self.tableViewDomicilio.layer.masksToBounds = NO;
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.tableViewNacional)
        return [telefonosEmergenciasNacionales count];
    else
        return [telefonosEmergenciasDomiciliarias count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    NSString *tel;
    if (tableView == self.tableViewNacional)
        tel = [telefonosEmergenciasNacionales objectAtIndex:indexPath.row];
    else
        tel = [telefonosEmergenciasDomiciliarias objectAtIndex:indexPath.row];
    
    cell.textLabel.text = tel;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *tel;
    if (tableView == self.tableViewNacional)
        tel = [telefonosEmergenciasNacionales objectAtIndex:indexPath.row];
    else
        tel = [telefonosEmergenciasDomiciliarias objectAtIndex:indexPath.row];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", tel]]];

}
@end
