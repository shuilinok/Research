//
//  UserCourseList.m
//  Research
//
//  Created by shuilin on 20/07/2017.
//  Copyright © 2017 enjoyloop. All rights reserved.
//

#import "UserCourseList.h"
#import "User.h"


@interface UserCourseList ()

@property (strong, nonatomic) NSMutableArray *courses;

@end


@implementation UserCourseList

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.courses = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)setWithInfos:(NSArray *)infos
{
    [self.courses removeAllObjects];
    
    for(CourseInfo *info in infos)
    {
        UserCourse *course = [[UserCourse alloc] init];
        [course setWithInfo:info];
        
        [self.courses addObject:course];
    }
}

- (void)load:(ResultCallback)callback
{
    NSString *userID = self.user.userID;
    
    [self.loadPolicy loadList:userID callback:^(id data, NSError *error) {
        
        if(error.code == noErr)
        {
            [self setWithInfos:data];
        }
        
        callback(error);
    }];
}

@end



@implementation UserCourseListLoadPolicy

//加载用户的课程列表，返回CourseInfo数组
- (void)loadList:(NSString *)userID callback:(DataResultCallback)callback
{
    //从服务端加载，或者从本地加载等；
    callback(nil,nil);
}

@end


@implementation UserCourseListRemoteLoadPolicy

//加载用户的课程列表，返回CourseInfo数组
- (void)loadList:(NSString *)userID callback:(DataResultCallback)callback
{
    //从服务端加载
    callback(nil,nil);
}

@end


@implementation UserCourseListLocalLoadPolicy

//加载用户的课程列表，返回CourseInfo数组
- (void)loadList:(NSString *)userID callback:(DataResultCallback)callback
{
    //从本地加载
    callback(nil,nil);
}

@end


@implementation UserCourseListLocalRemoteLoadPolicy

//加载用户的课程列表，返回CourseInfo数组
- (void)loadList:(NSString *)userID callback:(DataResultCallback)callback
{
    //先从本地加载
    UserCourseListLocalLoadPolicy *policy = [[UserCourseListLocalLoadPolicy alloc] init];
    [policy loadList:userID callback:^(id data, NSError *error) {
        
        callback(data,error);
        
        //再从服务端加载
        UserCourseListRemoteLoadPolicy *policy = [[UserCourseListRemoteLoadPolicy alloc] init];
        [policy loadList:userID callback:^(id data, NSError *error) {
            
            callback(data,error);
        }];
    }];
}

@end



