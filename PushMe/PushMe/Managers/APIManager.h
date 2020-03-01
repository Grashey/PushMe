//
//  APIManager.h
//  PushMe
//
//  Created by Aleksandr Fetisov on 01.03.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "DataManager.h"

@interface APIManager : NSObject

+ (instancetype)sharedInstance;
- (void)cityForCurrentIP:(void (^)(City *city))completion;

@end


