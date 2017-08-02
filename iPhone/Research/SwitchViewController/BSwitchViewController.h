//
//  BSwitchViewController.h
//  Research
//
//  Created by shuilin on 26/04/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserCourseList.h"

@interface BSwitchViewController : UIViewController

+ (instancetype)instance;

@property (strong, nonatomic) MCProtocolCommand *backCommand;

@property (strong, nonatomic) UserCourseList *list;

@end
