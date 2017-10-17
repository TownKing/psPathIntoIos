//
//  ViewController.m
//  MusicPath
//
//  Created by 唐京 on 2017/9/28.
//  Copyright © 2017年 town. All rights reserved.
//

#import "ViewController.h"
#import "TJMusicPathView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TJMusicPathView *musicView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _iv.image = [self blurryImage:[UIImage imageNamed:@"s"] withBlurLevel:50.0];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)start:(id)sender {
    [self.musicView animate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
