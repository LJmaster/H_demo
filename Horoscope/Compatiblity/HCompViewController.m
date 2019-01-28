//
//  HCompViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/16.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HCompViewController.h"

@interface HCompViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
}

@property(nonatomic,strong) HDynmaicBigNavView  * navView;

@end

@implementation HCompViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hidenNaviBar];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KWhiteColor;
    
    [self.view addSubview:self.navView];
    
        tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kstatusBarH + 44+ 62, KScreenWidth, KScreenHeight - (kstatusBarH + 44+ 62)) style:(UITableViewStylePlain)];
        [self.view addSubview:tableView];
        tableView.delegate = self;
        tableView.dataSource = self;
}


-(HDynmaicBigNavView *)navView{
    if (!_navView) {
        _navView = [[HDynmaicBigNavView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kstatusBarH + 44+ 62)];
        _navView.bigTitle = @"二级标题，不滑动";
        [_navView.navView.backButton addTarget:self action:@selector(hhh) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _navView;
}

-(void)hhh{
    [self backBtnClicked];
}
#pragma mark - tableView delegate datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.navView dynamic_suspensionNavViewAnimationWithYoffset:scrollView.contentOffset.y withView:tableView];
}
@end
