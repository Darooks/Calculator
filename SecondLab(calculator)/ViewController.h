//
//  ViewController.h
//  SecondLab(calculator)
//
//  Created by Karol Jurczenia on 02.03.2017.
//  Copyright © 2017 Karol Jurczenia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

- (IBAction)equal:(UIButton *)sender;
- (IBAction)clear:(UIButton *)sender;
- (IBAction)operation:(UIButton *)sender;
- (IBAction)numbers:(UIButton *)sender;

@end

