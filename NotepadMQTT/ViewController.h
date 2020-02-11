//
//  ViewController.h
//  NotepadMQTT
//
//  Created by justin lee on 2020/2/11.
//  Copyright © 2020 justin lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)UIbtnPush:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *itxtTopic;
@property (weak, nonatomic) IBOutlet UITextField *itxtMessage;

@end

