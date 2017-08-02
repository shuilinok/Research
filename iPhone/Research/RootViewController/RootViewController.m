//
//  RootViewController.m
//  Research
//
//  Created by shuilin on 26/04/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "RootViewController.h"
#import "ASwitchViewController.h"
#import "BSwitchViewController.h"

@interface RootViewController ()
@property (strong, nonatomic) UIViewController *contentController;
@end

@implementation RootViewController

+ (instancetype)instance;
{
    RootViewController *rootController = [[RootViewController alloc] init];
    
    ASwitchViewController *aController = [ASwitchViewController instance];
    aController.toBCommand = [MCProtocolCommand command:rootController selector:@selector(AtoBProc:)];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:aController];
    
    rootController.contentController = navController;
    
    return rootController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.contentController.view];
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

- (id)AtoBProc:(ASwitchViewController *)aController
{
    BSwitchViewController *bController = [BSwitchViewController instance];
    bController.backCommand = [MCProtocolCommand command:self selector:@selector(BtoAProc:)];
    
    UserCourseList *list = [[UserCourseList alloc] init];
    UserCourseListLocalRemoteLoadAction *action = [[UserCourseListLocalRemoteLoadAction alloc] init];
    action.list = list;
    list.loadAction = action;
    
    [aController.navigationController pushViewController:bController animated:YES];
    
    return nil;
}

- (id)BtoAProc:(BSwitchViewController *)bController
{
    [bController.navigationController popViewControllerAnimated:YES];
    
    return nil;
}

@end
