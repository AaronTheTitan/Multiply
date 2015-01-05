//
//  ViewController.m
//  Multiply
//
//  Created by Aaron Bradley on 1/5/15.
//  Copyright (c) 2015 Aaron Bradley & Kyle Magnesen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *numberTextField;
@property (strong, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;

@property (strong, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;

@property NSString *multiply;
@property NSString *division;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.multiply = [NSString stringWithFormat:@"*"];
    self.division = [NSString stringWithFormat:@"/"];

}

- (IBAction)sliderMult:(UISlider *)sender {
    UISlider * slider = (UISlider*)sender;
    float sliderValue = [slider value];
    self.multiplierLabel.text = [NSString stringWithFormat:@"%.0f", sliderValue];
}


- (IBAction)onCalculateButtonPressed:(id)sender {
    [self.view endEditing:YES];


    NSString *userEntry = [self.numberTextField text];
    int numberEntered = [userEntry intValue];

    NSString *multiply = [self.multiplierLabel text];
    int multi = [multiply intValue];

    ///////
    int answer;



    if (self.operatorSegmentControl.selectedSegmentIndex == 0) {
        answer = numberEntered * multi;
    } else if (self.operatorSegmentControl.selectedSegmentIndex == 1){
        answer = numberEntered / multi;
    } else {
        NSLog(@"Something went wrong");
    }




    self.answerLabel.text = [NSString stringWithFormat:@"%d", answer];

    if (answer >= 20) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }

    if (answer % 3 == 0 && answer % 5 == 0) {
        self.answerLabel.text = @"FizzBuzz";
    } else if (answer % 5 == 0) {
        self.answerLabel.text = @"Buzz";
    } else if (answer % 3 == 0) {
        self.answerLabel.text = @"Fizz";
    } else {
        self.answerLabel.text = [NSString stringWithFormat:@"%d", answer];
    }
}



@end
