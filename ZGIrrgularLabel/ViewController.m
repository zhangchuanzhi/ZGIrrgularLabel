//
//  ViewController.m
//  ZGIrrgularLabel
//
//  Created by offcn_zcz32036 on 2018/4/2.
//  Copyright © 2018年 cn. All rights reserved.
//

#import "ViewController.h"
#import <ZGFrameWorkTest/ZGShowResult.h>
#import "Masonry.h"
#import "ZGIrregularLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [ZGShowResult show];
    ZGIrregularLabel *label=[[ZGIrregularLabel alloc]initWithFrame:CGRectZero];
    [self.view addSubview:label];
    label.text=@"测试不规则label";
    label.backgroundColor=[UIColor cyanColor];
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont boldSystemFontOfSize:16];
    label.textAlignment=NSTextAlignmentCenter;
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.left.offset(90);
        make.right.offset(-90);
        make.size.mas_equalTo(CGSizeMake(200, 40));
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
