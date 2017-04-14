//
//  ViewController.m
//  demo
//
//  Created by tangyuhua on 2017/4/13.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ViewController.h"
#import "CustomActivity.h"


@interface ViewController ()<UITabBarDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource    = self;

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   // [self performSegueWithIdentifier:@"TableView" sender:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}

- (IBAction)tapbutton:(id)sender {

    
    
    
    NSString *title = @"My Title";
    NSString *content = @"My Content";
    UIImage *image = [UIImage imageNamed:@"chrome.png"];
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSArray *activityItems = @[title, content, image, url];
    CustomActivity *customActivity = [[CustomActivity alloc] initWithImage:image atURL:url atTitle:title atShareContentArray:activityItems];
    
    
    
    NSArray *apps = @[customActivity];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:apps];
    
    
    activityVC.excludedActivityTypes = @[UIActivityTypeCopyToPasteboard,UIActivityTypeMail, UIActivityTypeAddToReadingList, UIActivityTypeAssignToContact, UIActivityTypeAirDrop,UIActivityTypeOpenInIBooks,UIActivityTypeMessage,UIActivityTypePrint,UIActivityTypeSaveToCameraRoll,@"com.apple.mobilenotes.SharingExtension",     @"com.apple.reminders.RemindersEditorExtension"];
    
    
    
    [self presentViewController:activityVC animated:YES completion:nil];
    
    
    
}





@end
