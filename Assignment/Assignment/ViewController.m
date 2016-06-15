//
//  ViewController.m
//  Assignment
//
//  Created by Cellpointmobile on 11/06/16.
//  Copyright © 2016 Swapnil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txtFieldNumber;
- (IBAction)click_Event_PrintMultiples:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *txtViewNumbers;
@end

@implementation ViewController


#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - textfield delegates

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - click events

- (IBAction)click_Event_PrintMultiples:(id)sender {
    // check whether txtfld has any value
    if ([self.txtFieldNumber.text length] > 0) {
        // check whether txtfld has numerical value
        NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        if ([self.txtFieldNumber.text rangeOfCharacterFromSet:notDigits].location == NSNotFound)
        {
            // self.txtFieldNumber.text consists only of the digits 0 through 9
            if ([self.txtFieldNumber.text intValue] != 0) {
                NSMutableString *strNumbers = [[NSMutableString alloc] init];
                for (int i = 300; i >=1; i--) {
                    if (i % [self.txtFieldNumber.text intValue] == 0) {
                        NSLog(@"%d,",i);
                        [strNumbers appendString:[NSString stringWithFormat:@"%d, ",i]];
                    }
                }
                
                self.txtViewNumbers.text = [NSString stringWithFormat:@"Numbers are :\n%@",strNumbers];
            }
            else
            {
                // notify user not to enter zero
                UIAlertView *alertZeroError = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please Enter Numbers greater than zero" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alertZeroError show];
            }
          
        }
        else
        {
            UIAlertView *alertEnterNum = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please Enter Numbers only" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alertEnterNum show];
        }
        
    }
    else
    {
        UIAlertView *alertEnterALNum = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please Enter atleast one Number" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertEnterALNum show];
    }
    
    
}
@end
