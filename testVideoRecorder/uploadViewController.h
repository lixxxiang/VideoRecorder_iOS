//
//  uploadViewController.h
//  testVideoRecorder
//
//  Created by yyfwptz on 2017/3/16.
//  Copyright © 2017年 yyfwptz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKRecordShortVideoViewController.h"

@interface uploadViewController : UIViewController <secondViewDelegate>{
    
}
- (IBAction)cancel:(id)sender;
- (IBAction)send:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property(assign) NSString* videoUrl;
@end
