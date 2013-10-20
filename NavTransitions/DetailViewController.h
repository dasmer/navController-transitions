//
//  DetailViewController.h
//  NavTransitions
//
//  Created by dasmer on 10/19/13.
//  Copyright (c) 2013 Columbia University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
