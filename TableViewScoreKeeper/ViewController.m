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
@property (nonatomic) int numberOfRows;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.numberOfRows = 1;
    
    self.title = @"Score Keeper";
    
    self.tableView = [UITableView new];
    self.tableView.frame = self.view.bounds;
    
    [self.tableView registerClass:[TextFieldTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *titleButton = [[UIBarButtonItem alloc] initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(addCell)];
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithTitle:@"-" style:UIBarButtonItemStylePlain target:self action:@selector(deleteCell)];
    
    self.navigationItem.rightBarButtonItem = titleButton;
    self.navigationItem.leftBarButtonItem = deleteButton;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.indexPathSelected = indexPath;
    if(indexPath.row % 2 == 0) {
        cell.backgroundColor = [UIColor colorWithRed:0.675 green:0.847 blue:0.961 alpha:1];
    }
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfRows;
}

- (void)addCell {
    if(self.numberOfRows < 15){
    self.numberOfRows++;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.numberOfRows - 1) inSection:0];
    
    NSArray *array = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationMiddle];
      }
}

-(void)deleteCell {    
    if(self.numberOfRows > 0){
        self.numberOfRows--;
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.numberOfRows inSection:0];
        
        NSArray *array = [NSArray arrayWithObject:indexPath];
        
        [self.tableView deleteRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationMiddle];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
