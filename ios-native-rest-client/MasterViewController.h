//
//  MasterViewController.h
//  ios-native-rest-client
//
//  Created by Wael Jammal on 18/09/2014.
//  Copyright (c) 2014 RS New Media. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
