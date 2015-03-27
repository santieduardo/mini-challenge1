//
//  ShowInstitutionViewController.m
//  iDote
//
//  Created by Eduardo Santi on 25/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "ShowInstitutionViewController.h"

@interface ShowInstitutionViewController ()

@property NSMutableArray *list;

@end

@implementation ShowInstitutionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _list = [Institution loadInstitution];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InstitutionTableViewCell *cell = (InstitutionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.nameInstitution.text = [(Institution *)_list[indexPath.row] institutionName];
    cell.phoneInstitution.text = [(Institution *)_list[indexPath.row] institutionPhone];
    
    cell.institution = _list[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _list.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(InstitutionTableViewCell *)sender{
    
    if ([segue.identifier isEqualToString:@"segueDetailInstitution"]) {
        DetailInstitutionViewController *detail = (DetailInstitutionViewController *)segue.destinationViewController;
        
        detail.inst = sender.institution;
    }

}

@end