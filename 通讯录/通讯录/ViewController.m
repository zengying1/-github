//
//  ViewController.m
//  通讯录
//
//  Created by 1808 on 15/8/14.
//  Copyright (c) 2015年 1808. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "FirstViewController.h"
#import "search.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (strong,nonatomic)UITableView  *tableview;
@property (strong,nonatomic)NSMutableArray *infos;
@property(strong,nonatomic)UISearchBar *searchBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 75, 375, 50)];
    _searchBar.placeholder = @"查询";   //设置占位符
    _searchBar.delegate = self;
    [self.view addSubview:self.tableview];
    [self.view addSubview:_searchBar];
 }

- (void) click:(UIButton *)sender
{
    FirstViewController *fvc = [[FirstViewController alloc]init];
    fvc.title = sender.currentTitle;
    [self.navigationController pushViewController:fvc animated:YES];
}

- (UITableView *)tableview
{
    if (!_tableview) {
        _infos = [[NSMutableArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:@"my List.plist"]];
        _tableview =[[UITableView alloc]initWithFrame:CGRectMake(0,60 , 375, 700) style:UITableViewStylePlain];
        _tableview.dataSource = self;
        _tableview.delegate = self;
        
        UINib *nib = [UINib nibWithNibName:@"MyCell" bundle:nil];
        [_tableview registerNib:nib forCellReuseIdentifier:@"cell"];
    }
    return _tableview;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _infos.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"cell";
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[ MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.backView.layer.cornerRadius = 10;
    cell.nameLable.text = _infos[indexPath.row][@"name"];
    cell.phoneLable.text = _infos[indexPath.row][@"phone"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}
//实现 tableView点动
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstViewController *fvc = [[FirstViewController alloc]init];   
    [self.navigationController pushViewController:fvc animated:YES];

}

@end
