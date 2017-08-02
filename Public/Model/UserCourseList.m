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

- (void)setLoadAction:(MCAction *)loadAction
{
    if(loadAction == _loadAction)
    {
        return;
    }
    
    //把原来的行为取消
    [_loadAction cancel:800];
    
    _loadAction = loadAction;
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

@end



@implementation UserCourseListLoadAction

- (void)run:(ResultCallback)callback
{
    self.callback = callback;
    
    //从服务端加载
    //...
    
    [self callbackError:nil];
}

@end



@implementation UserCourseListLocalLoadAction

- (void)run:(ResultCallback)callback
{
    self.callback = callback;
    
    //从本地加载
    //...
    
    [self callbackError:nil];
}

@end



@implementation UserCourseListLocalRemoteLoadAction

- (void)run:(ResultCallback)callback
{
    self.callback = callback;
    
    //先从本地加载
    UserCourseListLocalLoadAction *action = [[UserCourseListLocalLoadAction alloc] init];
    action.list = self.list;
    
    [action run:^(NSError *error) {
       
        if(self.bCancel)
        {
            return;
        }
        
        //再从服务端加载
        UserCourseListLoadAction *action = [[UserCourseListLoadAction alloc] init];
        action.list = self.list;
        
        [action run:^(NSError *error) {
            
            [self callbackError:error];
        }];
    }];
}

@end





