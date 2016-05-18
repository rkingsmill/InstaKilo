//
//  ViewController.m
//  InstaKilo
//
//  Created by Rosalyn Kingsmill on 2016-05-18.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *customLayout;

@property NSArray <NSArray<UIImage*>*> *arrayOfImageArrays;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *food = @[[UIImage imageNamed: @"IMG_8602.jpg"],
                    [UIImage imageNamed: @"IMG_8601.jpg"],
                    [UIImage imageNamed: @"IMG_8603.jpg"]];
    
    NSArray *animal = @[[UIImage imageNamed: @"IMG_1527.jpg"],
                        [UIImage imageNamed: @"IMG_5720.jpg"]];
    
    NSArray *landscapes = @[[UIImage imageNamed: @"IMG_4774.jpg"],
                            [UIImage imageNamed: @"IMG_5465.jpg"],
                            [UIImage imageNamed: @"IMG_5134.jpg"]];
    
    NSArray *apt = @[[UIImage imageNamed: @"condo1.jpg"],
                    [UIImage imageNamed: @"condo2.jpg"]];
    
    self.arrayOfImageArrays = @[food,
                                animal,
                                landscapes,
                                apt];
    
    self.customLayout = [[UICollectionViewFlowLayout alloc] init];
    self.customLayout.itemSize = CGSizeMake(100, 100);
    self.customLayout.headerReferenceSize = CGSizeMake(0, 150);
    self.collectionView.collectionViewLayout = self.customLayout;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UICollectioViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.arrayOfImageArrays.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrayOfImageArrays[section].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"system wants cell %ld", indexPath.item);
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
  
    cell.imageView.image = self.arrayOfImageArrays[indexPath.section][indexPath.item];
   
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
        
        UILabel *label = [header viewWithTag:1];
        switch (indexPath.section) {
            case 0:
                label.text = [NSString stringWithFormat:@"Food"];
                return header;
                break;
                
            case 1:
                label.text = [NSString stringWithFormat:@"Animals"];
                return header;
                break;
                
            case 2:
                label.text = [NSString stringWithFormat:@"Landscapes"];
                return header;
                break;
                
            case 3:
                label.text = [NSString stringWithFormat:@"Condo"];
                return header;
                break;
                
            default:
                break;
        }
      
    }
    
    return nil;
}

@end
