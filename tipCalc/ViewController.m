//
//  ViewController.m
//  tipCalc
//
//  Created by Navaneethan Sivabalaviknarajah on 2015-06-19.
//  Copyright (c) 2015 Navaneethan Sivabalaviknarajah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;

@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UITextField *tipPercentageField;
@property (weak, nonatomic) IBOutlet UISlider *moveSlider;



@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)tipPercentageFieldChanged:(id)sender {
  //  NSLog(@"Tip percent is %@", self.tipPercentageField.text);
    // update slider
//    NSNumber *tipValue = [NSNumber numberWithFloat:_moveSlider.value, self.tipPercentageField ];
    
    
    float tipPercentage = [self.tipPercentageField.text floatValue];
    
    //NSNumber *tipValue = [NSNumber numberWithFloat:@"%i", ];
    
    self.moveSlider.value = tipPercentage;
    
    // recalculate tip
    
    
    [self calculateTip:nil];
    
    
    
}



- (IBAction)billAmountFieldChanged:(id)sender {
    NSLog(@"Bill amount is is %@", self.billAmountTextField.text);
    
    // recalculat tip
    [self calculateTip:nil];

}

- (IBAction)moveSlider:(id)sender {
 
    // update tip field
    // recalulate tip
    
    NSString *stringValue = [NSString stringWithFormat:@"%f", self.moveSlider.value ];
    
    self.tipPercentageField.text = stringValue;
    
    
    if (([self.tipAmountLabel text] == nil) || ([self.tipAmountLabel.text isEqualToString:@""])){
        
        [self.tipAmountLabel setText:@"Please enter a bill amount"];
    } else {
        
        
        [self calculateTip:nil];
//        
//        float billAmount = [self.billAmountTextField.text doubleValue];
//        float tipAmount = [self.moveSlider value] *billAmount;
//        
//        NSString *tipPercentageString = [[NSString alloc]initWithFormat:@"%1.0f%%", [self.moveSlider value]];
//        
//        NSString *tipString = [[NSString alloc] initWithFormat:@"$%1.2f", tipAmount];
//        [self.tipPercentageField setText:tipPercentageString];
//        [self.tipAmountLabel setText:tipString];
    }
    }

- (IBAction)calculateTip:(UIButton *)sender {
    
    float billAmount = [self.billAmountTextField.text doubleValue];
    float tipAmount = [self.tipPercentageField.text doubleValue] *billAmount/100;
    
    
    NSString *tipString = [[NSString alloc] initWithFormat:@"$%1.2f", tipAmount];
    
    [self.tipAmountLabel setText:tipString];
}

    

@end
