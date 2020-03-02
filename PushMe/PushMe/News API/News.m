//
//  News.m
//  PushMe
//
//  Created by Aleksandr Fetisov on 02.03.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "News.h"

@implementation News

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _title = [dictionary valueForKey:@"title"];
        _author = [dictionary valueForKey:@"author"];
        _descript = [dictionary valueForKey:@"description"];
        _content = [dictionary valueForKey:@"content"];
        _url = [dictionary valueForKey:@"url"];
        _urlToImage = [dictionary valueForKey:@"urlToImage"];
        _publishedAt = [dictionary valueForKey:@"publishedAt"];
        NSDictionary *source = [dictionary valueForKey:@"source"];
        if (source) {
            _sourceId = [source valueForKey:@"id"];
            _sourceName = [source valueForKey:@"name"];
        }
    }
    return self;
}

@end
