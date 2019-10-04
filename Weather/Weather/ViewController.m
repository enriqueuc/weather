//
//  ViewController.m
//  Weather
//
//  Created by Enrique Ugalde on 10/3/19.
//  Copyright © 2019 Enrique Ugalde. All rights reserved.
//

#import "ViewController.h"
#import "ConsumeServiceViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *txfCP;
@property (strong, nonatomic) IBOutlet UIButton *btnConsume;
@property (strong, nonatomic) IBOutlet UILabel *lblInfo;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)setInfo:(id)sender
{
    if([_txfCP.text isEqualToString:@""])
    {
        [self showMessage:@"Llena el CP" title:@"Atención" button:@"Ok"];
        return;
    }
    ConsumeServiceViewController *consume = [[ConsumeServiceViewController alloc] init];
    
    if(![consume consumeService:@"URL"])
    {
        [self showMessage:@"No se pudo hacer el consumo del servicio" title:@"Atención" button:@"Ok"];
        return;
    }
    
    _lblInfo.text = @"GOOD WEATHER";
    
}

-(void)showMessage:(NSString *)message title:(NSString *)title button:(NSString *)button
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    alert.view.tintColor = [UIColor colorWithRed:63.0/255.0 green:83.0/255.0 blue:121.0/255.0 alpha:1.0];
    [alert addAction:[UIAlertAction actionWithTitle:button style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
