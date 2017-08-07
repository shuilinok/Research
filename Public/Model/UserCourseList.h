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

@interface UserCourseListActionContext : NSObject

@property (strong, nonatomic) NSString *loadActionName;

@property (strong, nonatomic) NSString *reloadActionName;

@property (strong, nonatomic) NSString *freshActionName;

@property (strong, nonatomic) NSString *moreActionName;

@property (assign, nonatomic) NSUInteger offset;

@property (assign, nonatomic) NSUInteger limit;

- (void)changeToReload;

- (void)changeToFresh;

- (void)changeToMore;

@end


@interface UserCourseList : NSObject

@property (weak, nonatomic) User *user;

@property (strong, nonatomic) UserCourseListActionContext *actionContext;

- (void)setWithInfos:(NSArray *)infos;

- (void)load:(ResultCallback)callback;

- (void)cancelLoad;

@end





