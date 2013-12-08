//
//  ViewController.m
//  sectionTable
//
//  Created by 田中順也 on 2013/12/08.
//  Copyright (c) 2013年 matouka-suzuki. All rights reserved.
//

#import "ViewController.h"

static  NSString* const kTableViewCellReuseIdentifier = @"com.matouka-suzuki.sectionTable.cellReuseIdentifier";

static NSString* const kTitlesKey = @"titles";
static NSString* const kRowsKey = @"rows";

@interface ViewController ()
<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) IBOutlet UITableView* tableView;
@property (nonatomic,strong) NSDictionary* dataSource;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray* titles = @[@"SECTION 0 TITLE",@"SECTION 1 TITLE",@"SECTION 2 TITLE"];
    NSArray* section0 = @[@"section0-0",@"section0-1",@"section0-2"];
    NSArray* section1 = @[@"section1-0",@"section1-1",@"section1-2"];
    NSArray* section2 = @[@"section2-0",@"section2-1",@"section2-2"];
    NSArray* sections = @[section0,section1,section2];
    
    _dataSource = [[NSDictionary alloc] initWithObjectsAndKeys:titles,kTitlesKey,
                                                               sections,kRowsKey,nil];
}

- (void)dealloc{
    _tableView.dataSource = nil;
    _tableView.delegate = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray* allRows = _dataSource[kRowsKey];
    NSArray* sectionRows = allRows[section];
    return [sectionRows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kTableViewCellReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    NSArray* allRows = _dataSource[kRowsKey];
    NSArray* rows = allRows[indexPath.section];
    cell.textLabel.text = rows[indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSArray* titles = _dataSource[kTitlesKey];
    return [titles count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray* titles = _dataSource[kTitlesKey];
    return titles[section];
}

@end
