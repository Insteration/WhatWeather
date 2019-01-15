//
//  ViewController.m
//  WhatWeather
//
//  Created by Artem Karmaz on 1/15/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

#import "ViewController.h"
#import "WeatherData.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray *weatherData;
}


//NSString *cellId = @"cellId";
// My URL
NSString *urlString = @"https://api.apixu.com/v1/current.json?key=c5d57f8a831c4dde8fd153715180512&q=Dnipropetrovsk";


- (void)navigationSetup {
    self.navigationItem.title = @"What weather in city?";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self navigationSetup];
//    [self showDictionary];
    
//    [self jsonRequestWithURL:urlString];
    weatherData = [self myArray:[self jsonRequestWithURL:urlString]];
}

- (NSMutableDictionary *)jsonRequestWithURL:(NSString *)url {
    NSError *error;
    NSData *jsonData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:url]];
    NSMutableDictionary *allElements = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    return allElements;
}

-(NSArray *) myArray:(NSMutableDictionary *)dictionary {
    NSArray *keys = [dictionary allKeys];
    NSArray *value = [dictionary valueForKey:@"location"];
    
//    NSLog(@"my keys is %@", keys);
//    NSLog(@"my value is %@", value);
    
    
//    for (id obj in value) {
//        NSLog(@"obj: %@", obj);
//    }
    
    return keys;
}


-(void) showDictionary {
    for(NSString *key in [[self jsonRequestWithURL:urlString] allKeys]) {
        NSLog(@"%@",[[self jsonRequestWithURL:urlString] objectForKey:key]);
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [weatherData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [weatherData objectAtIndex:indexPath.row];
    return cell;
}




@end
