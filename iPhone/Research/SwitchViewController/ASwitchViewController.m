//
//  ASwitchViewController.m
//  Research
//
//  Created by shuilin on 26/04/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "ASwitchViewController.h"

@interface ASwitchViewController ()

@end

@implementation ASwitchViewController

+ (instancetype)instance
{
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Switch" bundle:nil];
    
    ASwitchViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"ASwitchViewController"];
    
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickToB:(id)sender
{
    [self.toBCommand execute:1,self];
}

@end
