
//
//  HCCCViewController.m
//  Horoscope
//
//  Created by 刘杰 on 2019/1/14.
//  Copyright © 2019 makerLJ. All rights reserved.
//

#import "HCCCViewController.h"
#import "HNormalNavView.h"
#import "HabbViewController.h"

@interface HCCCViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
}
@property(nonatomic,strong) HNormalNavView * navView;
@end

@implementation HCCCViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //设置代理即可
    self.navigationController.delegate = self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.navView];
    
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kstatusBarH + 44, KScreenWidth, KScreenHeight - (kstatusBarH + 44)) style:(UITableViewStylePlain)];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
}

-(HNormalNavView *)navView{
    if (!_navView) {
        _navView = [[HNormalNavView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kstatusBarH + 44)];
        _navView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"123"]];
        _navView.backButton.hidden = YES;
        _navView.title = @"自定义小标题";
        UIButton *s = [[UIButton alloc]init];
        s.backgroundColor = [UIColor redColor];
        [s addTarget:self action:@selector(hhh) forControlEvents:(UIControlEventTouchUpInside)];
        _navView.rightView = s;
    }
    return _navView;
}


-(void)hhh{
    
    [self presentViewController:[HabbViewController new] animated:YES completion:nil];
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
    [self.navView dynamicNavViewAnimationWithYoffset: scrollView.contentOffset.y withView:tableView];
}

@end
