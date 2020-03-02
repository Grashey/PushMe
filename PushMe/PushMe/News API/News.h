//
//  News.h
//  PushMe
//
//  Created by Aleksandr Fetisov on 02.03.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic, strong) NSString *sourceId;
@property (nonatomic, strong) NSString *sourceName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *descript;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSURL *urlToImage;
@property (nonatomic, strong) NSString *publishedAt;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

