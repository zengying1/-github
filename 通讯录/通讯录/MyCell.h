//
//  MyCell.h
//  通讯录
//
//  Created by 1808 on 15/8/14.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;
@property (weak, nonatomic) IBOutlet UIView *backView;

@end
