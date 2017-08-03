//
//  UserCourseList.h
//  Research
//
//  Created by shuilin on 20/07/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserCourse.h"

@class User;

//行为工厂
@protocol UserCourseListActionFactory <NSObject>

- (MCAction *)createLoadAction;

- (MCAction *)createFreshAction;

@end


@interface UserCourseList : NSObject

@property (weak, nonatomic) User *user;

@property (strong, nonatomic) MCAction *loadAction;

@property (strong, nonatomic) id<UserCourseListActionFactory> actionFactory;

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



@interface UserCourseListActionFactory : NSObject <UserCourseListActionFactory>

@property (weak, nonatomic) UserCourseList *list;

@end

