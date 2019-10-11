//
//  NSBundle+QBBundle.m
//  QBFramework
//
//  Created by quentin on 2019/7/10.
//  Copyright © 2019 Quentin. All rights reserved.
//

#import "NSBundle+QBBundle.h"
#import <objc/runtime.h>

static NSString *const QBLanguageKey = @"AppLanguagesKey";
@interface BundleLanguage : NSBundle

@end

@implementation BundleLanguage

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {

    NSString *currentLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:QBLanguageKey];
    currentLanguage = currentLanguage ? currentLanguage : @"zh-Hans";

    NSBundle *currentLanguageBundle = currentLanguage ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:currentLanguage ofType:@"lproj"]] : nil;

    return currentLanguageBundle ? [currentLanguageBundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}

@end

@implementation NSBundle (QBBundle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle], [BundleLanguage class]);
    });
}

+ (void)setLanguage:(NSString *)language
{
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:QBLanguageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end;
