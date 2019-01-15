//
//  WeatherData.h
//  WhatWeather
//
//  Created by Artem Karmaz on 1/15/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherData : NSObject


//country = Ukraine;
//lat = "48.45";
//localtime = "2019-01-15 15:47";
//"localtime_epoch" = 1547560039;
//lon = "34.98";
//name = Dnipropetrovsk;
//region = "Dnipropetrovs'ka Oblast'";
//"tz_id" = "Europe/Kiev";

@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSNumber *lat;
@property (strong, nonatomic) NSNumber *localtime;
@property (strong, nonatomic) NSNumber *lon;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *region;
@property (strong, nonatomic) NSString *tz_id;


@end

NS_ASSUME_NONNULL_END
