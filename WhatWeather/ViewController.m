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
    self.navigationItem.title = @"What weather?";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self navigationSetup];
    [self showDictionary];

}

- (NSMutableDictionary *)jsonRequestWithURL:(NSString *)url {
    NSError *error;
    NSData *jsonData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:url]];
    NSMutableDictionary *allElements = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    return allElements;
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
    
    return cell;
}



@end
