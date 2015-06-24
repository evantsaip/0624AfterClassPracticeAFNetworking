//
//  FirstUserPassViewController.m
//  0623AfterClassPracticeAFNetworking
//
//  Created by lalaleelala on 6/24/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import "FirstUserPassViewController.h"
#import "BeginTabBarViewController.h"
@interface FirstUserPassViewController ()
@property (strong,nonatomic) NSString *correctUser;
@property (strong,nonatomic) NSString *correctPass;
@property (strong,nonatomic) NSString *insertUser;
@property (strong,nonatomic) NSString *insertPass;

@end

@implementation FirstUserPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //
    [self alertview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)presetAction
{
    //Presentview
    BeginTabBarViewController *tab = [self.storyboard instantiateViewControllerWithIdentifier:@"TEA"];
    [self presentViewController:tab animated:YES completion:nil];
    //
}

-(void)alertview{
    _correctUser = @"Evan";
    _correctPass = @"1111";
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"My Title"
                                  message:@"Enter User Credentials"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style: UIAlertActionStyleDefault handler:^(UIAlertAction * action) {

                                               }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault
        handler:^(UIAlertAction * action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];

    [alert addAction:ok];
    [alert addAction:cancel];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"Username";
        [textField addTarget:self action:@selector(saveUsername:) forControlEvents:UIControlEventEditingChanged];
        
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"Password";
        [textField addTarget:self action:@selector(savePassword:) forControlEvents:UIControlEventEditingChanged ];
        textField.secureTextEntry = YES;
    }];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)saveUsername:(UITextField *)username {
    _correctUser = username.text;
    NSLog(@"%@",_correctUser);
}
- (void)savePassword:(UITextField *)password {
    _correctPass = password.text;
    NSLog(@"%@",_correctPass);
}

@end
