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

//具体加载过程交给策略类去做
@interface UserCourseListLoadPolicy : NSObject

//加载用户的课程列表，返回CourseInfo数组
- (void)loadList:(NSString *)userID callback:(DataResultCallback)callback;

@end


@class User;

@interface UserCourseList : NSObject

@property (weak, nonatomic) User *user;

@property (strong, nonatomic) UserCourseListLoadPolicy *loadPolicy;

- (void)setWithInfos:(NSArray *)infos;

- (void)load:(ResultCallback)callback;

@end
