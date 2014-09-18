//
//  DetailViewController.h
//  ios-native-rest-client
//
//  Created by Wael Jammal on 18/09/2014.
//  Copyright (c) 2014 RS New Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Skill.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UITableViewDelegate>

@property (strong, nonatomic) Skill* detailItem;

@end
