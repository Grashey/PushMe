//
//  TestViewController.m
//  PushMe
//
//  Created by Aleksandr Fetisov on 12.02.2020.
//  Copyright © 2020 Aleksandr Fetisov. All rights reserved.
//

#import "TestViewController.h"
#import "TestSecondViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

UIImageView *imageView;
NSString *imageName;

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
    
    CGRect colorButtonFrame = CGRectMake(width/2 - 100.0, height/2 - 75.0, 200.0, 50.0);
    UIButton *colorButton = [UIButton buttonWithType: UIButtonTypeSystem];
    [colorButton setTitle:@"ИЗМЕНИТЬ ЦВЕТ" forState:UIControlStateNormal];
    colorButton.backgroundColor = [UIColor blueColor];
    colorButton.tintColor = [UIColor whiteColor];
    colorButton.frame = colorButtonFrame;
    [colorButton addTarget:self action:@selector(changeColorButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:colorButton];
    
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
    [segmentedControl addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    
    CGRect sliderFrame = CGRectMake(width/2 - 100.0, height/2 + 150.0, 200.0, 50.0);
    UISlider *slider = [[UISlider alloc] init];
    slider.frame = sliderFrame;
    slider.tintColor = [UIColor blackColor];
    slider.value = 1.0;
    [slider addTarget:self action:@selector(changeAlpha:) forControlEvents:UIControlEventValueChanged];
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
    imageView = [[UIImageView alloc] initWithFrame: imageViewFrame];
    imageView.image = [UIImage imageNamed:@"Earth"];
    imageName = @"Earth";
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:imageView];
    
    CGRect nextVCButtonFrame = CGRectMake(width/2 - 100.0, height/2 - 225.0, 200.0, 50.0);
    UIButton *nextVCButton = [UIButton buttonWithType: UIButtonTypeSystem];
    [nextVCButton setTitle:@"Next VC" forState:UIControlStateNormal];
    nextVCButton.backgroundColor = [UIColor grayColor];
    nextVCButton.tintColor = [UIColor whiteColor];
    nextVCButton.frame = nextVCButtonFrame;
    [nextVCButton addTarget:self action:@selector(nextVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextVCButton];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:TRUE];
    [self.navigationController setNavigationBarHidden:TRUE];
}

- (void)changeColorButtonDidTap:(UIButton *) sender {
    if ([self.view.backgroundColor isEqual: [UIColor redColor]]) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor redColor];
    }
}

- (void)changeAlpha:(UISlider *) slider {
    imageView.alpha = slider.value;
}

- (void)changeImage:(UISegmentedControl *) switcher {
    if (switcher.selectedSegmentIndex == 0) {
        imageView.image = [UIImage imageNamed:@"Earth"];
        imageName = @"Earth";
    } else if (switcher.selectedSegmentIndex == 1) {
        imageView.image = [UIImage imageNamed:@"Moon"];
        imageName = @"Moon";
    }
}

- (void)nextVC:(UIButton *) sender {
    UIViewController * nextVC = [[TestSecondViewController alloc] init];
    nextVC.view.backgroundColor = self.view.backgroundColor;
    CGRect nameLabelFrame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 100.0, [UIScreen mainScreen].bounds.size.height/2 - 75.0, 200.0, 50.0);
    UILabel *nameLabel = [[UILabel alloc] initWithFrame: nameLabelFrame];
       nameLabel.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightBold];
       nameLabel.textColor = [UIColor darkGrayColor];
       nameLabel.textAlignment = NSTextAlignmentCenter;
       nameLabel.text = imageName;
       [nextVC.view addSubview: nameLabel];
    [self addChildViewController:nextVC];
    [self.navigationController pushViewController:nextVC animated:true];
    [nextVC.navigationController setNavigationBarHidden:FALSE];
    
}

@end
