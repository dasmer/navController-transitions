//
//  MasterViewController.m
//  NavTransitions
//
//  Created by dasmer on 10/19/13.
//  Copyright (c) 2013 Columbia University. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "FlipAnimationController.h"


@interface MasterViewController ()
@end

@implementation MasterViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.textLabel.text = [NSString stringWithFormat: @"Button %d" ,indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {

    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    FlipAnimationController *animationController = [[FlipAnimationController alloc] init];
    animationController.reverse = operation == UINavigationControllerOperationPop;
    return animationController;
    
}


@end
