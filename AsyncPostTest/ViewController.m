//
//  ViewController.m
//  AsyncPostTest
//
//  Created by JD Vega on 4/30/12.
//  Copyright (c) 2012 Boxcar Creative LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)postData:(id)sender {
    
    NSURL *myURL = [NSURL URLWithString:@"http://thesocialbull.com/dev/pad_dev/services/saveNewClientData.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:myURL
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:60];
    [request setHTTPMethod:@"POST"];
    NSMutableString *body = [[NSMutableString alloc] initWithFormat:@"FIRST_NAME=%@&LAST_NAME=%@&ADDRESS=%@&CITY=%@&STATE=%@&ZIP=%@&PHONE=%@&EMAIL=%@&GENDER=%@&AGE=%@&NOTES=%@",
                      @"Mickey", 
                      @"Mouse", 
                      @"123 Disney Dr.", 
                      @"Los Angeles", 
                      @"CA", 
                      @"12345", 
                      @"215-232-2334", 
                      @"mickey@disney.com", 
                      @"male",
                      @"99",
                      @"No Notes"];
    
    [request setHTTPBody: [body dataUsingEncoding:NSUTF8StringEncoding]] ; 
     //NSUTF8StringEncoding
     //NSISOLatin1StringEncoding
     //NSASCIIStringEncoding
    
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [responseData release];
    [connection release];
    NSLog(@"Unable to fetch data");
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Succeeded! Received %d bytes of data",[responseData
                                                   length]);
    NSString *s = [[[NSString alloc] initWithData:responseData encoding: NSASCIIStringEncoding] retain] ;
    NSLog( @"%@",s );
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return YES;
}

@end
