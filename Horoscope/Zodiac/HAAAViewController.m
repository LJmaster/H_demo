//
//  HAAAViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/10.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HAAAViewController.h"
#import "HabbViewController.h"


@interface HAAAViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView  * tableView;
@property(nonatomic,strong) HDynmaicBigNavView  * navView;
@end

@implementation HAAAViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hidenNaviBar];
}


-(HDynmaicBigNavView *)navView{
    if (!_navView) {
        _navView = [[HDynmaicBigNavView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kCustomizeNaiHeight)];
        _navView.backgroundColor = [UIColor whiteColor];
        _navView.bigTitle = @"这是个自定义的标题";
        _navView.detaileTitle = @"这是个小标题";
        _navView.isBackButtonHide = YES;
        _navView.titleColor = [UIColor redColor];
        
        UIButton *s = [[UIButton alloc]init];
        s.backgroundColor = [UIColor redColor];
        [s addTarget:self action:@selector(hhh) forControlEvents:(UIControlEventTouchUpInside)];
        _navView.titleRightView = s;
    }
    return _navView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.navView];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kCustomizeNaiHeight, KScreenWidth,
                                                                  KScreenHeight - kCustomizeNaiHeight - kBottomSafeHeight - kTabBarHeight) style:(UITableViewStylePlain)];
    [self.view addSubview:self.tableView ];
    self.tableView .delegate = self;
    self.tableView .dataSource = self;
    

}

-(void)hhh{
    [self.navigationController pushViewController:[HabbViewController new] animated:YES];
}

#pragma mark - tableView delegate datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.navView dynamic_allNavViewAnimationWithYoffset: scrollView.contentOffset.y withView:self.tableView ];

}


@end
