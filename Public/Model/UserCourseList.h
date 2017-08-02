//
//  UserCourseList.h
//  Research
//
//  Created by shuilin on 20/07/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserCourse.h"

//策略模式演示

@class User;

@interface UserCourseList : NSObject

@property (weak, nonatomic) User *user;

@property (strong, nonatomic) MCAction *loadAction;

- (void)setWithInfos:(NSArray *)infos;

@end



@interface UserCourseListLoadAction : MCAction

@property (weak, nonatomic) UserCourseList *list;

@end



@interface UserCourseListLocalLoadAction : MCAction

@property (weak, nonatomic) UserCourseList *list;

@end



@interface UserCourseListLocalRemoteLoadAction : MCAction

@property (weak, nonatomic) UserCourseList *list;

@end




