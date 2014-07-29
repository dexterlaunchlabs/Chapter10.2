//
//  BIDTaskDetailController.m
//  Seg Nav
//
//  Created by Dexter Launchlabs on 7/29/14.
//  Copyright (c) 2014 Dexter Launchlabs. All rights reserved.
//

#import "BIDTaskDetailController.h"

@interface BIDTaskDetailController ()

@end

@implementation BIDTaskDetailController
@synthesize textView;
@synthesize selection;
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    textView.text = [selection objectForKey:@"object"];
    [textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)viewWillDisappear:(BOOL)animated { [super viewWillDisappear:animated];
    if ([delegate respondsToSelector:@selector(setEditedSelection:)]) { // finish editing
        [textView endEditing:YES];
        // prepare selection info
        NSIndexPath *indexPath = [selection objectForKey:@"indexPath"];
        id object = textView.text;
        NSDictionary *editedSelection = [NSDictionary dictionaryWithObjectsAndKeys:
                                         indexPath, @"indexPath",object, @"object",
                                         nil];
        [delegate setValue:editedSelection forKey:@"editedSelection"];
    }
}
@end
