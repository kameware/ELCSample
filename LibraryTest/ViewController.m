//
//  ViewController.m
//  LibraryTest
//
//  Created by mineharu on 2015/12/04.
//  Copyright © 2015年 mine. All rights reserved.
//

#import "ViewController.h"
#import "ELCAlbumPickerController.h"
#import "ELCImagePickerController.h"

@interface ViewController () {
    NSArray *libNames;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    ELCAlbumPickerController *albumController = [[ELCAlbumPickerController alloc] init];
    ELCImagePickerController *elcPicerController = [[ELCImagePickerController alloc] init];
    [albumController setParent:elcPicerController];
    [elcPicerController setImagePickerDelegate:self];
    
    [self presentViewController:elcPicerController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ELCImagePickerControllerDelegate
- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    // 選択時の処理
    NSLog(@"%ld枚選びました！", (long)info.count);
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    // キャンセル時の処理
    NSLog(@"キャンセルしました。");
}


@end
