//
//  AppDelegate.m
//  ios_demo
//
//  Created by zhongxiaoming on 2022/2/11.
//

#import "AppDelegate.h"
#import "NSObject+GACRetainCount.h"

@interface Person : NSObject


@end

@implementation Person

@end


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self autoreleaseTest];
    
    return YES;
}


- (void)autoreleaseTest
{
    @autoreleasepool {
        __strong id s_obj = Person.new;
        __weak id w_obj = s_obj;
        
        __weak id array = [NSArray arrayWithObject:s_obj];
        
        
        
        [s_obj printRetainCount];
        for (int i=0; i<764; i++) {
            [s_obj rq_retain];
        }
        
        for (int i=0; i<780; i++) {
            [s_obj rq_retain];
        }
        [w_obj printRetainCount];
//        [s_obj rq_autorelease];
    }
}



#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
