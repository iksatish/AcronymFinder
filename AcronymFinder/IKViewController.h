//
//  ViewController.h
//  AcronymFinder
//
//  Created by Satish Kumar R Kancherla on 2/9/16.
//  Copyright © 2016 Satish Kumar R Kancherla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IKViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *acrTextField;
- (IBAction)onClickingSearchBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

