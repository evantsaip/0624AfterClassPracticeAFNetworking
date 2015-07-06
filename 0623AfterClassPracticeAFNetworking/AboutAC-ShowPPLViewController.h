//
//  AboutAC-ShowPPLViewController.h
//  0623AfterClassPracticeAFNetworking
//
//  Created by lalaleelala on 6/30/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface AboutAC_ShowPPLViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *abACSegment;
@property (weak, nonatomic) IBOutlet UIImageView *abACImage;
@property (strong, nonatomic) IBOutlet UILabel *abACName;
@property (strong, nonatomic) IBOutlet UITextView *abACTextField;
@end
