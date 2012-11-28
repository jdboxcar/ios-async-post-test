//
//  ViewController.h
//  AsyncPostTest
//
//  Created by JD Vega on 4/30/12.
//  Copyright (c) 2012 Boxcar Creative LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSMutableData *responseData;
}

-(IBAction)postData:(id)sender;

@end
