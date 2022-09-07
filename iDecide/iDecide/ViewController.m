//
//  ViewController.m
//  iDecide
//
//  Created by Ariadne on 8/25/22.
//

#import "ViewController.h"

@interface ViewController () {
    UILabel* decisionText;
    NSString* buttonResponse;
}

@property (strong, nonatomic) IBOutlet UILabel *decisionText;

@end

@implementation ViewController
- (int)generateRandomNumberWithLower:(int)lowerIndex andUpper:(int)upperIndex {
      return lowerIndex + arc4random() % (upperIndex - lowerIndex);}

-(void)changeLabel:(NSString*) initialText {
    [decisionText setText:initialText]; }

//fixes synthesis error
@synthesize decisionText = decisionText;

- (void)viewDidLoad {
    [super viewDidLoad];
    decisionText.text = @"What should I do?";
    // Do any additional setup after loading the view.
}

#pragma mark - Action Items
- (IBAction)buttonPressed:(id)sender {
   
    NSLog(@"Button was pressed!");
    NSArray *possibleResponses = @[@"Go for it!", @"Don't do it", @"Stay home",
                                   @"Ask your mom", @"Think about it", @"Give it a try",
                                   @"Not sure", @"Ask again later"];
   
    if ([decisionText.text isEqualToString:@"What should I do?"]) {
        int count = (int)[possibleResponses count];    // possibleResponses is the NSMutableArray*
        buttonResponse = possibleResponses[[self generateRandomNumberWithLower:0 andUpper: count]];
        decisionText.text = buttonResponse;
    } else {
        decisionText.text = @"What should I do?";
    }
}

@end
