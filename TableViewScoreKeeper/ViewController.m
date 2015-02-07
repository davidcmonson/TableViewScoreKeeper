//
//  ViewController.m
//  TableViewScoreKeeper
//
//  Created by Jake Herrmann on 2/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "ViewController.h"
#import "TextFieldTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>;

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"Score Keeper";
    
    self.tableView = [UITableView new];
    self.tableView.frame = self.view.bounds;
    
    [self.tableView registerClass:[TextFieldTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
   
    UIBarButtonItem *titleButton = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(cellForRowAtIndexPath:)];

    self.navigationItem.rightBarButtonItem = titleButton;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.indexPathSelected = indexPath;
    
    return cell;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
