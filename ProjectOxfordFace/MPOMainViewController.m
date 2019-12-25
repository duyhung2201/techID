// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license.
//
// Microsoft Cognitive Services (formerly Project Oxford): https://www.microsoft.com/cognitive-services
//
// Microsoft Cognitive Services (formerly Project Oxford) GitHub:
// https://github.com/Microsoft/Cognitive-Face-iOS
//
// Copyright (c) Microsoft Corporation
// All rights reserved.
//
// MIT License:
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED ""AS IS"", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "MPOMainViewController.h"
#import "MPOIdentificationViewController.h"

@interface MPOMainViewController () <UIActionSheetDelegate>

@end

@implementation MPOMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"back";
    self.navigationItem.backBarButtonItem = backItem;
    [self buildMainUI];
}

- (void)buildMainUI {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS_BAR_HEIGHT-NAVIGATION_BAR_HEIGHT)];
    
    UIButton * detectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton * identificationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIButton * IDBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UILabel * detectionLabel = [[UILabel alloc] init];
    UILabel * identificationLabel = [[UILabel alloc] init];
//    UILabel * IDLabel = [[UILabel alloc] init];
    UILabel * descriptionLabel = [[UILabel alloc] init];
    
//    NSString * detectionHint = @"Detect faces, face landmarks, pose, gender, and age.";
//    NSString * identificationHint = @"Identify the person from a face.";
//    NSString * descriptionHint = @"Microsoft will receive the images you upload and may use them to improve Face API and related services. By submitting an image, you confirm that you have consent from everyone in it.";
//
    CGFloat btnWidth = SCREEN_WIDTH / 2 - 20;
    CGFloat btnHeight = btnWidth / 3;
    detectionBtn.width = identificationBtn.width = btnWidth;
    detectionBtn.height = identificationBtn.height = btnHeight;
    UIImage * btnBackImage = [CommonUtil imageWithColor:[UIColor robinEggColor]];
    [detectionBtn setBackgroundImage:btnBackImage forState:UIControlStateNormal];
    [identificationBtn setBackgroundImage:btnBackImage forState:UIControlStateNormal];
    [detectionBtn setTitle:@"DETECTION" forState:UIControlStateNormal];
    [identificationBtn setTitle:@"IDENTIFICATION" forState:UIControlStateNormal];
    detectionBtn.right = identificationBtn.right = scrollView.width - 105;
    
    detectionLabel.top = detectionBtn.top = 80;
    identificationLabel.top = identificationBtn.top = 400;
    
//    [detectionLabel setText:detectionHint];
//    [identificationLabel setText:identificationHint];
//    [descriptionLabel setText:descriptionHint];
    
    descriptionLabel.numberOfLines = detectionLabel.numberOfLines = identificationLabel.numberOfLines = 0;
    descriptionLabel.font = detectionLabel.font = identificationLabel.font = descriptionLabel.font = descriptionLabel.font = [UIFont systemFontOfSize:12];
    
    detectionLabel.width = identificationLabel.width = btnWidth - 10;
    detectionLabel.height = identificationLabel.height = btnHeight;
    detectionLabel.left = identificationLabel.left = 20;
    descriptionLabel.width = SCREEN_WIDTH - 20 * 2;
    [descriptionLabel sizeToFit];
    descriptionLabel.top = identificationBtn.bottom + 20;
    descriptionLabel.left = 20;
    
    [detectionBtn addTarget:self action:@selector(detectionAction:) forControlEvents:UIControlEventTouchUpInside];
    [identificationBtn addTarget:self action:@selector(identificationAction:) forControlEvents:UIControlEventTouchUpInside];
     
    [scrollView addSubview:detectionBtn];
    [scrollView addSubview:identificationBtn];
    [scrollView addSubview:detectionLabel];
    [scrollView addSubview:identificationLabel];
    
    scrollView.contentSize = CGSizeMake(scrollView.width, identificationBtn.bottom + 20);
    [self.view addSubview:scrollView];
    
    if ([ProjectOxfordFaceSubscriptionKey isEqualToString:@"Your Subscription Key"]) {
        detectionBtn.enabled = NO;
        identificationBtn.enabled = NO;
        [CommonUtil simpleDialog:@"You haven't input the subscription key. Please specify the subscription key in MPOAppDelegate.h"];
    }
}

- (void)detectionAction:(id)sender {
    UIViewController * controller = [[UICollectionViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}
//
//- (void)verificationAction:(id)sender {
//    UIActionSheet * verification_type_sheet = [[UIActionSheet alloc]
//                                          initWithTitle:@"Choose verification type"
//                                          delegate:self
//                                          cancelButtonTitle:@"Cancel"
//                                          destructiveButtonTitle:nil
//                                          otherButtonTitles:@"face and face", @"face and person",nil];
//    [verification_type_sheet showInView:self.view];
//}
//
//- (void)groupingAction:(id)sender {
//    UIViewController * controller = [[MPOMainViewController alloc] init];
//    [self.navigationController pushViewController:controller animated:YES];
//}
//
//- (void)similarFaceAction:(id)sender {
//    UIViewController * controller = [[MPOSimilarFaceViewController alloc] init];
//    [self.navigationController pushViewController:controller animated:YES];
//}

- (void)identificationAction:(id)sender {
    UIViewController * controller = [[MPOIdentificationViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - UIActionSheetDelegate
//
//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
//    if (buttonIndex == 0) {
//        UIViewController * controller = [[MPOVerificationViewController alloc] initWithVerificationType:VerificationTypeFaceAndFace];
//        [self.navigationController pushViewController:controller animated:YES];
//    } else if (buttonIndex == 1) {
//        UIViewController * controller = [[MPOVerificationViewController alloc] initWithVerificationType:VerificationTypeFaceAndPerson];
//        [self.navigationController pushViewController:controller animated:YES];
//    }
//}

@end
