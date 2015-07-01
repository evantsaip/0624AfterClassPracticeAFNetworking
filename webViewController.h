//
//  webViewController.h
//  0623AfterClassPracticeAFNetworking
//
//  Created by lalaleelala on 7/1/15.
//  Copyright (c) 2015 lalaleelala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *viewWeb;
@property (strong, nonatomic) NSString *url;
@end
