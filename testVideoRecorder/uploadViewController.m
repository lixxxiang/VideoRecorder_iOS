//
//  uploadViewController.m
//  testVideoRecorder
//
//  Created by yyfwptz on 2017/3/16.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import "uploadViewController.h"
#import "UIImage+PKShortVideoPlayer.h"
#import "PKFullScreenPlayerViewController.h"
@interface uploadViewController ()

@end

@implementation uploadViewController
UIImage *image;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    image = [UIImage pk_previewImageWithVideoURL:[NSURL fileURLWithPath:_videoUrl]];
    self.imageView.image = image;
    [_imageView setUserInteractionEnabled:YES];
    [_imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory:)]];
    
    
    UITextView *textView =[[UITextView alloc]initWithFrame:CGRectMake(20,70,[[UIScreen mainScreen] bounds].size.width - 200,400)];
    textView.backgroundColor= [UIColor whiteColor];
    textView.text = @"说说您的新鲜事";
    textView.textColor = [UIColor grayColor];
    textView.font = [UIFont systemFontOfSize:18];
    textView.delegate = self;
    [self.view addSubview:textView];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView
{
    if(textView.text.length < 1){
        textView.text = @"说说您的新鲜事";
        textView.textColor = [UIColor grayColor];
        textView.font = [UIFont systemFontOfSize:18];
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if([textView.text isEqualToString:@"说说您的新鲜事"]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
        textView.font = [UIFont systemFontOfSize:18];

    }
}

-(void)clickCategory:(UITapGestureRecognizer *)gestureRecognizer
{
    UIView *viewClicked=[gestureRecognizer view];
    if (viewClicked==_imageView){
        PKFullScreenPlayerViewController *vc = [[PKFullScreenPlayerViewController alloc] initWithVideoPath:_videoUrl previewImage:image];
        [self presentViewController:vc animated:NO completion:NULL];
    }
}

-(void)passViewController:(NSString *)str{
    _videoUrl = str;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)send:(id)sender {
}
@end
