//
//  TestViewController.m
//  PushMe
//
//  Created by Aleksandr Fetisov on 12.02.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGRect whiteViewFrame = CGRectMake(40.0, 40.0, width - 80.0, height - 80.0);
    UIView *whiteView = [[UIView alloc] initWithFrame: whiteViewFrame];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: whiteView];
    
    UILabel *label = [[UILabel alloc] initWithFrame: whiteViewFrame];
    label.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightBold];
    label.textColor = [UIColor darkGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Hello, World!";
    [self.view addSubview: label];
    
    CGRect buttonFrame = CGRectMake(width/2 - 100.0, height/2 - 75.0, 200.0, 50.0);
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle:@"ИЗМЕНИТЬ ЦВЕТ" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    button.tintColor = [UIColor whiteColor];
    button.frame = buttonFrame;
    [button addTarget:self action:@selector(changeColorButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    CGRect textFieldFrame = CGRectMake(width/2 - 100.0, height/2 + 25.0, 200.0, 50.0);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldFrame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Введите значение...";
    textField.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightLight];
    [self.view addSubview: textField];
    
    CGRect textViewFrame = CGRectMake(width/2 - 100.0, height/2 + 100.0, 200.0, 50.0);
    UITextView *textView = [[UITextView alloc] initWithFrame: textViewFrame];
    textView.backgroundColor = [UIColor blackColor];
    textView.textColor = [UIColor whiteColor];
    textView.text = @"Hello, World!";
    [self.view addSubview:textView];
    
    CGRect segmentedControlFrame = CGRectMake(width/2 - 100.0, height/2 - 150.0, 200.0, 50.0);
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Первый", @"Второй"]];
    segmentedControl.frame = segmentedControlFrame;
    segmentedControl.tintColor = [UIColor blackColor];
    segmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:segmentedControl];
    
    CGRect sliderFrame = CGRectMake(width/2 - 100.0, height/2 + 150.0, 200.0, 50.0);
    UISlider *slider = [[UISlider alloc] init];
    slider.frame = sliderFrame;
    slider.tintColor = [UIColor blackColor];
    slider.value = 0.5;
    [self.view addSubview:slider];
    
    CGRect activityIndicatorViewFrame = CGRectMake(width/2 - 25.0, 100.0, 50.0, 50.0);
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleLarge];
    activityIndicatorView.color = [UIColor blackColor];
    activityIndicatorView.frame = activityIndicatorViewFrame;
    activityIndicatorView.hidesWhenStopped = YES;
    [activityIndicatorView startAnimating];
    [self.view addSubview:activityIndicatorView];
    
    CGRect progressViewFrame = CGRectMake(width/2 - 100.0, height/2 + 200.0, 200.0, 50.0);
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle: UIProgressViewStyleDefault];
    progressView.progressTintColor = [UIColor blackColor];
    progressView.frame = progressViewFrame;
    progressView.progress = 0.5;
    [self.view addSubview:progressView];
    
    CGRect imageViewFrame = CGRectMake(40.0, height/2 + 225.0, width - 80.0, height/2 - 225 - 40);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame: imageViewFrame];
    imageView.image = [UIImage imageNamed:@"Earth"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:imageView];
    
}

- (void)changeColorButtonDidTap:(UIButton *) sender {
    if ([self.view.backgroundColor isEqual: [UIColor redColor]]) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor redColor];
    }
}

@end
