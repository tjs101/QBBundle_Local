//
//  NSBundle+QBBundle.h
//  QBFramework
//
//  Created by quentin on 2019/7/10.
//  Copyright © 2019 Quentin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define QBLocalizedString(KEY) [[NSBundle mainBundle] localizedStringForKey:KEY value:nil table:@"Localizable"]


@interface NSBundle (QBBundle)

+ (void)setLanguage:(NSString *)language;

@end

NS_ASSUME_NONNULL_END
