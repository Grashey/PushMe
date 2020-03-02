//
//  NewsViewController.m
//  PushMe
//
//  Created by Aleksandr Fetisov on 02.03.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsViewCell.h"
#define NewsCellReuseIdentifier @"NewsCellIdentifier"

@interface NewsViewController ()
@property (nonatomic, strong) NSMutableArray *news;
@end

@implementation NewsViewController

- (instancetype)init {
    self = [super init];
    if (self)
    {
        self.title = @"News";
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.tableView registerClass:[NewsViewCell class] forCellReuseIdentifier:NewsCellReuseIdentifier];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    
    NSURL *url = [NSURL URLWithString:@"https://newsapi.org/v2/top-headlines?country=ru&apiKey=0f49b9e1bf5847bc8e0d6bf1e4972cfb"];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *err = nil;
        if (data!=nil){
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&err];
            NSArray *newsJson = json[@"articles"];
            self->_news = [[NSMutableArray alloc] initWithArray:newsJson];
            }
        dispatch_sync(dispatch_get_main_queue(),^{
            [self.tableView reloadData];
        });
    }];
    [dataTask resume];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NewsCellReuseIdentifier forIndexPath:indexPath];
    cell.news = [_news objectAtIndex:indexPath.row];
    
    return cell;
}



@end
