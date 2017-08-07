//
//  BSwitchViewController.m
//  Research
//
//  Created by shuilin on 26/04/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "BSwitchViewController.h"

@interface BSwitchViewController ()

@end

@implementation BSwitchViewController

+ (instancetype)instance
{
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Switch" bundle:nil];
    
    BSwitchViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"BSwitchViewController"];
    
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.list.actionContext changeToReload];
    
    [self.list load:^(NSError *error) {
        
        if(error.code == 700)
        {
            NSLog(@"手动取消");
        }
        else if(error.code == 800)
        {
            NSLog(@"有新加载时取消");
        }
    }];
    
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

- (IBAction)clickBack:(id)sender
{
    [self.backCommand execute:1,self];
}

- (IBAction)clickFresh:(id)sender
{
    [self.list.actionContext changeToFresh];
    
    [self.list load:^(NSError *error) {
        
    }];
}

- (IBAction)clickMore:(id)sender
{
    [self.list.actionContext changeToMore];
    
    [self.list load:^(NSError *error) {
        
    }];
}

- (IBAction)clickCancelLoad:(id)sender
{
    [self.list cancelLoad];
}

@end
