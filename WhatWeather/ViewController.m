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


NSString *cellId = @"cellId";
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
    [self myArray:[self jsonRequestWithURL:urlString]];
    
}

- (NSMutableDictionary *)jsonRequestWithURL:(NSString *)url {
    NSError *error;
    NSData *jsonData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:url]];
    NSMutableDictionary *allElements = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    
    // 1 element in dictionary
//    country = Ukraine;
//    lat = "48.45";
//    localtime = "2019-01-15 15:47";
//    "localtime_epoch" = 1547560039;
//    lon = "34.98";
//    name = Dnipropetrovsk;
//    region = "Dnipropetrovs'ka Oblast'";
//    "tz_id" = "Europe/Kiev";
    //
//    id val = [[allElements allValues] objectAtIndex:1];
//    id val2 = []allElements al;
//    NSLog(@"Your value is ----- %@", val);
    
    
    
//    NSMutableArray *arrForA = [[NSMutableArray alloc] initWithObjects:@"Apple", @"Ant", @"Arc", nil];
//    NSMutableArray *arrForB = [[NSMutableArray alloc] initWithObjects:@"Ball", @"Bat", @"Box", nil];
//    NSMutableDictionary *dictAlpha = [[NSMutableDictionary alloc] initWithObjectsAndKeys: arrForA, @"A", arrForB, @"B", nil];
//    NSLog(@"%@",dictAlpha); // 1
//
//    NSArray *keys=[allElements allKeys];
//    NSArray *value=[allElements valueForKey:@"location"];
//
//    NSLog(@"my keys is %@", keys);
//    NSLog(@"my value is %@", value);
//
//
//    for (id obj in value) {
//        NSLog(@"obj: %@", obj);
//    }
//
//
//
    
//    for (int i = 0; i< keys.count; i++) {
//
//        NSArray *arrVal = [allElements objectForKey:keys[i]];
//
//        for (int j=0; j<arrVal.count; j++) {
//            NSLog(@"%@ for %@", keys[i], arrVal[j]); // 2
//        }
//
//    }
    
    return allElements;
}

-(NSArray *) myArray:(NSMutableDictionary *)dictionary {
    NSArray *keys = [dictionary allKeys];
    NSArray *value = [dictionary valueForKey:@"location"];
    
    NSLog(@"my keys is %@", keys);
    NSLog(@"my value is %@", value);
    
    
    for (id obj in value) {
        NSLog(@"obj: %@", obj);
    }
    
    return value;
}


-(void) showDictionary {
    for(NSString *key in [[self jsonRequestWithURL:urlString] allKeys]) {
        NSLog(@"%@",[[self jsonRequestWithURL:urlString] objectForKey:key]);
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    
    cell.textLabel.text = @"Text";
//    cell.textLabel.text =
    return cell;
}



@end
