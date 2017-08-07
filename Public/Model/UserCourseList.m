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

@property (strong, nonatomic) MCAction *loadAction;

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
    [self.loadAction cancel:800];//把原来的取消
    
    self.loadAction = [MCActionCreator createAction:self.actionContext.loadActionName];
    
    [self.loadAction run:self.actionContext callback:^(NSError *error) {
       
        callback(error);
    }];
}

- (void)cancelLoad
{
    [self.loadAction cancel:700];
}

@end


@interface UserCourseListLoadAction : MCAction

@end


@interface UserCourseListLocalLoadAction : MCAction

@end


@interface UserCourseListLocalRemoteLoadAction : MCAction

@end


@interface UserCourseListLoadMoreAction : MCAction

@end


@implementation UserCourseListLoadAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    UserCourseList *list = context;
    
    //从服务端加载
    list.actionContext.offset = 0;
    //...
    
    [self callbackError:nil];
}

@end



@implementation UserCourseListLocalLoadAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    UserCourseList *list = context;
    
    //从本地加载
    list.actionContext.offset = 0;
    //...
    
    [self callbackError:nil];
}

@end



@implementation UserCourseListLocalRemoteLoadAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    UserCourseList *list = context;
    
    list.actionContext.offset = 0;
    
    //先从本地加载
    UserCourseListLocalLoadAction *action = [[UserCourseListLocalLoadAction alloc] init];
    
    [action run:context callback:^(NSError *error) {
       
        if(self.bCancel)
        {
            return;
        }
        
        //再从服务端加载
        UserCourseListLoadAction *action = [[UserCourseListLoadAction alloc] init];
        
        [action run:context callback:^(NSError *error) {
            
            [self callbackError:error];
        }];
    }];
}

@end


@implementation UserCourseListLoadMoreAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    UserCourseList *list = context;
    
    //加载更多
    NSUInteger offset = list.actionContext.offset;
    NSUInteger limit = list.actionContext.limit;
    
    //...
    
    list.actionContext.offset += limit;
    
    [self callbackError:nil];
}

@end



@interface UserCourseListActionContext ()

@end

@implementation UserCourseListActionContext

- (void)changeToReload
{
    self.loadActionName = self.reloadActionName;
}

- (void)changeToFresh
{
    self.loadActionName = self.freshActionName;
}

- (void)changeToMore
{
    self.loadActionName = self.moreActionName;
}

@end

