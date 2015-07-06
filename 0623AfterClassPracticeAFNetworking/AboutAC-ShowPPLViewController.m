//
//  AboutAC-ShowPPLViewController.m
//  0623AfterClassPracticeAFNetworking
//
//  Created by lalaleelala on 6/30/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import "AboutAC-ShowPPLViewController.h"

@interface AboutAC_ShowPPLViewController ()
@property (strong,nonatomic) NSArray *acMemberTest;
@property (strong,nonatomic) NSMutableArray *campNumber;
@property (strong,nonatomic) NSMutableArray *acDescription;
@property (strong,nonatomic) NSMutableArray *email;
@property (strong,nonatomic) NSMutableArray *firstName;
//@property (strong,nonatomic) NSMutableArray *isAvailable;
//@property (strong,nonatomic) NSMutableArray *isManager;
//@property (strong,nonatomic) NSMutableArray *lastName;
//@property (strong,nonatomic) NSMutableArray *major;
//@property (strong,nonatomic) NSMutableArray *memberType;
//@property (strong,nonatomic) NSMutableArray *phoneNumber;
//@property (strong,nonatomic) NSMutableArray *urlBlog;
//@property (strong,nonatomic) NSMutableArray *urlFacebook;
//@property (strong,nonatomic) NSMutableArray *urlGitHub;
//@property (strong,nonatomic) NSMutableArray *urlLinkedin;

@end

@implementation AboutAC_ShowPPLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    PFQuery *query = [PFQuery queryWithClassName:@"ACMember"];
    [query getObjectInBackgroundWithId:@"F8blQ21Yig" block:^(PFObject *acMember, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        //NSLog(@"%@", acMember);
        [self getACMemberData];
        //[self abACShowData];
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)getACMemberData{

        PFQuery *query = [PFQuery queryWithClassName:@"ACMember"];
        _campNumber = [[NSMutableArray alloc]init];
        _acDescription = [[NSMutableArray alloc]init];
        _firstName = [[NSMutableArray alloc]init];

        [query findObjectsInBackgroundWithBlock:^(NSArray *arrResult, NSError *error) {
                   // NSLog(@"%@", arrResult);
            for (PFObject *obj in arrResult) {
                //[_campNumber addObject:obj[@"image"]];
                
                [_campNumber addObject:obj[@"campNumber"]];
                [_acDescription addObject:obj[@"description"]];
                [_email addObject:obj[@"email"]];
                [_firstName addObject:obj[@"firstName"]];
                _acMemberTest = arrResult;

            }
               // NSLog(@"campNumber = %@",_campNumber);
              //  NSLog(@"acDescription = %@",_acDescription);
               // NSLog(@"email = %@", _email);
            
                //NSLog(@"description = %@",_acMemberTest);
            NSLog(@"Description %@",_acDescription[0]);
            NSLog(@"First Name %@",_firstName[0]);
            _abACTextField.text = _acDescription[0];
            _abACName.text = _firstName[0];

        }];

    }

- (void) abACShowData {
    _abACTextField.text = _acDescription[0];
    _abACName.text = _firstName[0];
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
