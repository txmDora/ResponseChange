//
//  ViewController.m
//  change
//
//  Created by 田晓梦 on 16/6/30.
//  Copyright © 2016年 田晓梦. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>{
    NSInteger textfieldStrLength;//需要控制的字符串的长度
}
@property (weak, nonatomic) IBOutlet UITextField *textfleld;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    textfieldStrLength = 16;
    self.textfleld.delegate = self;
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.textfleld resignFirstResponder];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@" "]) {
        return NO;
    }
    NSInteger strLength = textField.text.length;
    if (![string isEqualToString:@""]) {
#pragma mark===输入的时候===
        self.button.enabled = YES;
        self.button.backgroundColor = [UIColor redColor];
        if (range.location+string.length<=textfieldStrLength) {
            return YES;
        }else{
            return NO;
        }
        
    }else if ([string isEqualToString:@""]){
        strLength-=2;
        if(strLength < 0){
            self.button.enabled = NO;
            self.button.backgroundColor = [UIColor grayColor];
            
        }else{
            self.button.enabled = YES;
            self.button.backgroundColor = [UIColor redColor];
        }
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
