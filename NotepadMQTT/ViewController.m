//
//  ViewController.m
//  NotepadMQTT
//
//  Created by justin lee on 2020/2/11.
//  Copyright © 2020 justin lee. All rights reserved.
//

#import "ViewController.h"
#import "MQTTClient.h"

@interface ViewController ()

@end

@implementation ViewController

MQTTSession *session ;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MQTTCFSocketTransport *transport = [[MQTTCFSocketTransport alloc] init];
    transport.host = @"123.195.36.35";
    transport.port = 1883;
    
        
    session=[[MQTTSession alloc] init];
    session.transport = transport;
    session.clientId=@"3334";
    session.userName=@"tester";
    session.password=@"tester";
    [session connectWithConnectHandler:^(NSError *error) {
        // Do some work
        NSLog(@"====> 連線失敗");
    }];
    
}


- (IBAction)UIbtnPush:(id)sender {
    NSString *content = self.itxtMessage.text;
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    NSString *topic = self.itxtTopic.text;
    UInt16 result =  [session publishData:data onTopic:topic retain:YES qos:1 publishHandler:^(NSError *error) {
        
    if (error) {
    NSLog(@"====> 傳送失敗");
    } else {
    NSLog(@"====> 傳送成功");
    dispatch_async(dispatch_get_main_queue(), ^{
    self.itxtMessage.text = @"";
    });
    }
    }];
    NSLog(@"====> publish resutl:%d", result);}
@end
