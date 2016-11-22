//
//  EssenceViewController.m
//  百思不得姐
//
//  Created by qianfeng on 16/11/21.
//  Copyright © 2016年 Jiangpeng. All rights reserved.
//

#import "EssenceViewController.h"
#import "BDJEssenceModel.h"
#import "EssenceVideoCell.h"
@interface EssenceViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tbView;
@property (nonatomic, strong)BDJEssenceModel *model;

@end

@implementation EssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //创建表格
    [self createTableView];
    //下载数据
    [self downloadListData];
    
    
}

- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tbView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tbView.delegate = self;
    self.tbView.dataSource = self;
    [self.view addSubview:self.tbView];
    
    //约束
    //__weak typeof(self) weakSelf = self;
    [self.tbView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 49, 0));
        
    }];
    
}


- (void)downloadListData {
    //http://s.budejie.com/topic/list/jingxuan/41/bs0315-iphone-4.3/0-20.json
    NSString *urlString = @"http://s.budejie.com/topic/list/jingxuan/41/bs0315-iphone-4.3/0-20.json";
    [BDJDownloader downloadWithURLString:urlString success:^(NSData *data) {
        NSError *error = nil;
        BDJEssenceModel *model = [[BDJEssenceModel alloc] initWithData:data error:&error];
        if (error) {
            NSLog(@"%@",error);
        }else {
            self.model = model;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tbView reloadData];
            });
        }
        
        
    } fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BDJEssenceDetail *detail = self.model.list[indexPath.row];
    EssenceVideoCell *cell = [EssenceVideoCell videoCellForTableView:tableView atIndexPath:indexPath WithModel:detail];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 500;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
