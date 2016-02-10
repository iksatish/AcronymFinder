//
//  ViewController.m
//  AcronymFinder
//
//  Created by Satish Kumar R Kancherla on 2/9/16.
//  Copyright © 2016 Satish Kumar R Kancherla. All rights reserved.
//

#import "IKViewController.h"
#import "MBProgressHUD.h"
#import "IKAPIClient.h"
#import "IKAcronymModel.h"

@interface IKViewController ()
@property (nonatomic, strong) NSArray *resultdata;

@end

@implementation IKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Mark - Tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resultdata.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"datacell" forIndexPath:indexPath];
    cell.textLabel.text = self.resultdata[indexPath.row][@"lf"];
    return cell;
}

- (IBAction)onClickingSearchBtn:(UIButton *)sender {
    __weak IKViewController *weakSelf = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [IKAPIClient findAcronym:self.acrTextField.text
                       success:^(NSURLSessionDataTask *task, id response) {
                           dispatch_async(dispatch_get_main_queue(), ^{
                               [MBProgressHUD hideHUDForView:self.view animated:YES];
                               //response is always a single item array so we get the first element
                               if(((NSArray*)response).count > 0) {
                                   IKAcronymModel *searchResult = [[IKAcronymModel alloc] initWithDictionary:response[0]];
                                   weakSelf.resultdata = [searchResult.results mutableCopy];
                                   [weakSelf.tableview reloadData];
                               } else {
                                   [self showAlertMessage:@"Acronym not found."];
                               }
                           });
                       }
                       failure:^(NSURLSessionDataTask *task, NSError *error) {
                           dispatch_async(dispatch_get_main_queue(), ^{
                               [MBProgressHUD hideHUDForView:self.view animated:YES];
                               [self showAlertMessage:error.localizedDescription];
                           });
                       }
     ];

}

- (void) showAlertMessage:(NSString*)msg{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Error"
                                  message:msg
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
