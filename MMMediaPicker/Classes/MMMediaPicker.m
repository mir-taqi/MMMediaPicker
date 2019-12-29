//
//  MMMediaPicker.m
//  ImagePicker
//
//  Created by Mohammed Mir on 26/12/2019.
//  Copyright © 2019 Sejel Technology. All rights reserved.
//

#import "MMMediaPicker.h"
#import "MMAlbumPickerViewController.h"

@interface MMMediaPicker ()

@end

@implementation MMMediaPicker


- (instancetype)init {
    if ((self = [super init])) {
        [MMAssetsManager shared];
    }
    return self;
}

-(void)cancelPicking:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)donePicking:(id)sender{
      _pickingResult(MMAssetsManager.shared.selectedAssets, self);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if(_tintColor != nil)
    [self setTintColor:_tintColor];
    if(_navigationTitle != nil)
    self.title = _navigationTitle;
    
    MMAlbumPickerViewController *vc = [[MMAlbumPickerViewController alloc]init];
    vc.maximumNumberOfSelections = _maximumNumberOfSelects;
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:_cancelNavigationButtonTitle style:UIBarButtonItemStylePlain target:self action:@selector(cancelPicking:)];
          self.viewControllers = @[vc];
    
   
    // Do any additional setup after loading the view.
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
