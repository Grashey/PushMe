//
//  Country.h
//  PushMe
//
//  Created by Aleksandr Fetisov on 13.02.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Country : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, strong) NSDictionary *translations;
@property (nonatomic, strong) NSString *code;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
