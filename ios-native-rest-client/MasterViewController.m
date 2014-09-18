//
//  MasterViewController.m
//  ios-native-rest-client
//
//  Created by Wael Jammal on 18/09/2014.
//  Copyright (c) 2014 RS New Media. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import <RestKit/RestKit.h>
#import "Skill.h"
#import "Level.h"

@interface MasterViewController () {
    NSArray *_skills;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    [self configureRestKit];
    [self loadSkills];
}

- (void)configureRestKit
{
    // initialize AFNetworking HTTPClient
    NSURL *baseURL = [NSURL URLWithString:@"http://localhost:8080"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    
    // initialize RestKit
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    // setup object mappings
    RKObjectMapping *skillMapping = [RKObjectMapping mappingForClass:[Skill class]];
    [skillMapping addAttributeMappingsFromArray:@[@"title"]];
    
    RKObjectMapping *levelMapping = [RKObjectMapping mappingForClass:[Level class]];
    [levelMapping addAttributeMappingsFromDictionary:@{@"title": @"title"}];
    
    [skillMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"levels" toKeyPath:@"levels" withMapping:levelMapping]];
    
    // register mappings with the provider using a response descriptor
    RKResponseDescriptor *responseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:skillMapping
                                                 method:RKRequestMethodGET
                                            pathPattern:@"/allSkills.json"
                                                keyPath:@"skills"
                                            statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor];
}

- (void)loadSkills
{
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/allSkills.json"
                                     parameters: @{}
                                     success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                          _skills = mappingResult.array;
                                          [self.tableView reloadData];
                                     }
                                     failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                          NSLog(@"Something went wrong :( did you start the service?': %@", error);
                                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _skills.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Skill *skill = _skills[indexPath.row];
    cell.textLabel.text = [skill title];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
<<<<<<< HEAD
    return NO;
=======
    // Return NO if you do not want the specified item to be editable.
    return YES;
>>>>>>> FETCH_HEAD
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
<<<<<<< HEAD
        Skill *object = _skills[indexPath.row];
=======
        NSDate *object = _skills[indexPath.row];
>>>>>>> FETCH_HEAD
        self.detailViewController.detailItem = object;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
<<<<<<< HEAD
        Skill *object = _skills[indexPath.row];
=======
        NSDate *object = _skills[indexPath.row];
>>>>>>> FETCH_HEAD
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
