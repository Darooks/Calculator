//
//  ViewController.m
//  SecondLab(calculator)
//
//  Created by Karol Jurczenia on 02.03.2017.
//  Copyright © 2017 Karol Jurczenia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSString *_digits;
    NSString *_sign;
    
    NSInteger _value;
    BOOL *_isTyping;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _digits = self.displayLabel.text;
    _isTyping = NO;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)equal:(UIButton *)sender {
    NSInteger result = 0;
    
    if ([_sign isEqualToString:@"+"]) {
        result = _value + [_digits integerValue];
    } else if ([_sign isEqualToString:@"-"]) {
        result = _value - [_digits integerValue];
    } else if ([_sign isEqualToString:@"x"]) {
        result = _value * [_digits integerValue];
    } else if ([_sign isEqualToString:@"/"]) {
        @try {
            result = _value / [_digits integerValue];
        } @catch (NSException *e) {
            _digits = @"0";
            _value = 0;
            self.displayLabel.text = _digits;
        }
    }
    
    _sign = nil;
    _value = result;
    _isTyping = false;
    self.displayLabel.text = [NSString stringWithFormat:@"%d", result];
}

- (IBAction)clear:(UIButton *)sender {
    _digits = @"0";
    _value = 0;
    self.displayLabel.text = _digits;
}

- (IBAction)operation:(UIButton *)sender {
    if (!_sign) {
        _sign = sender.titleLabel.text;
        _isTyping = NO;
        if (!_value) {
            _value = [_digits integerValue];
            self.displayLabel.text = _digits;
        }
    }
}

- (IBAction)numbers:(UIButton *)sender {
    if (!_isTyping) {
        _digits = @"";
        _isTyping = YES;
    }
    
    _digits = [_digits stringByAppendingString:sender.titleLabel.text];
    
    self.displayLabel.text = _digits;
}

@end
