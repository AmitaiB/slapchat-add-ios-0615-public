//
//  FISNewMessageViewController.m
//  slapChat
//
//  Created by Amitai Blickstein on 8/30/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//
#define DBLG NSLog(@"%@ reporting!", NSStringFromSelector(_cmd));


#import "FISNewMessageViewController.h"

@interface FISNewMessageViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addNewMessageTxF;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
- (IBAction)saveButtonTapped:(id)sender;

@end

@implementation FISNewMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.saveButton.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    //Edit as you like.
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField.text.length > 0) {
        self.saveButton.enabled = YES;
    } else {
        self.saveButton.enabled = NO;
    }
    
    return YES;
}

- (IBAction)saveButtonTapped:(id)sender {
        //add textfield to message.
    self.sharedStore = [FISDataStore sharedDataStore];
    NSManagedObjectContext *moc = self.sharedStore.managedObjectContext;
    NSEntityDescription *newMsgDscp = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:moc];
    [newMsgDscp setValue:self.addNewMessageTxF.text forKey:@"content"];
    [newMsgDscp setValue:[NSDate date] forKey:@"createdAt"];
    
    [self.sharedStore saveContext];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    DBLG
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
