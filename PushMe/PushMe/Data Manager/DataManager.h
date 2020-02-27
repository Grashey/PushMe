//
//  DataManager.h
//  PushMe
//
//  Created by Aleksandr Fetisov on 13.02.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "Country.h"
#import "City.h"
#import "Airport.h"

//  константа, которая содержит имя уведомления
#define kDataManagerLoadDataDidComplete @"DataManagerLoadDataDidComplete"

//перечисление с возможными типами данных
typedef enum DataSourceType {
    DataSourceTypeCountry,
    DataSourceTypeCity,
    DataSourceTypeAirport
} DataSourceType;

@interface DataManager : NSObject

// синглтон  —  чтобы можно было однозначно определить существование лишь одного объекта этого класса
+ (instancetype)sharedInstance;

//метод для загрузки данных из файлов json
- (void)loadData;

// массивы для хранения готовых объектов данных, доступных только для чтения
@property (nonatomic, strong, readonly) NSArray *countries;
@property (nonatomic, strong, readonly) NSArray *cities;
@property (nonatomic, strong, readonly) NSArray *airports;

@end
