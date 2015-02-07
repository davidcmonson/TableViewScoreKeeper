//
//  TextFieldTableViewCell.m
//  TableViewScoreKeeper
//
//  Created by Jake Herrmann on 2/6/15.
//  Copyright (c) 2015 Jake Herrmann. All rights reserved.
//

#import "TextFieldTableViewCell.h"
#import "ViewController.h"

@interface TextFieldTableViewCell ()

@property (nonatomic, strong) UILabel *score;
@property (nonatomic, strong) UIStepper *stepper;


@end
static CGFloat topMargin = 8;


@implementation TextFieldTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  
  
    UITextField *playerName = [[UITextField alloc]initWithFrame:CGRectMake(30, topMargin, self.contentView.frame.size.width / 3, 20)];
    playerName.placeholder = @"Name";
    [self.contentView addSubview:playerName];
    
     self.score = [[UILabel alloc]initWithFrame:CGRectMake((self.contentView.frame.size.width / 2 + 15) , topMargin, self.contentView.frame.size.width / 2, 20)];
    self.score.text = @"0";
    [self.contentView addSubview:self.score];
    
    self.stepper = [[UIStepper alloc]initWithFrame:CGRectMake(((self.contentView.frame.size.width / 3) * 2) + 30, topMargin, self.contentView.frame.size.width / 3, 20)];
    
    self.stepper.maximumValue = 1000;
    self.stepper.minimumValue = -1000;
    [self.stepper addTarget:self action:@selector(stepperChanged:) forControlEvents:UIControlEventValueChanged];

    [self.contentView addSubview:self.stepper];
    
    
    
    
    return self;
    //.contentView
}
-(void)stepperChanged:(id)sender{
    double value = [self.stepper value];
    self.score.text = [NSString stringWithFormat:@"%d",(int)value];
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
