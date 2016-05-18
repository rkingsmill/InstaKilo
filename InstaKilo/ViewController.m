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

@property (weak, nonatomic) IBOutlet UISegmentedControl *segControl;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) UICollectionViewFlowLayout *customLayout;

@property Photo *photo;
@property NSArray <Photo *> *dataArray;
@property NSDictionary *dataDictionary;
@property NSArray *sectionsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Photo *photo1 = [[Photo alloc]initWithImage:[UIImage imageNamed: @"IMG_8602.jpg"] location:@"Argentina" subject:@"Food"];
    Photo *photo2 = [[Photo alloc]initWithImage:[UIImage imageNamed: @"IMG_8601.jpg"] location:@"Argentina" subject:@"Food"];
    Photo *photo3 = [[Photo alloc]initWithImage:[UIImage imageNamed: @"IMG_8603.jpg"] location:@"Argentina" subject:@"Food"];
    Photo *photo4 = [[Photo alloc]initWithImage:[UIImage imageNamed: @"IMG_1527.jpg"] location:@"Alberta" subject:@"Animal"];
    Photo *photo5 = [[Photo alloc]initWithImage:[UIImage imageNamed: @"IMG_5720.jpg"] location:@"Turkey" subject:@"Animal"];
    
    Photo *photo6 = [[Photo alloc]initWithImage:[UIImage imageNamed: @"IMG_4774.jpg"] location:@"Alberta" subject:@"Landscapes"];
    Photo *photo7 = [[Photo alloc]initWithImage:[UIImage imageNamed: @"IMG_5465.jpg"] location:@"Turkey" subject:@"Landscapes"];
    Photo *photo8 = [[Photo alloc]initWithImage:[UIImage imageNamed: @"IMG_5134.jpg"] location:@"Turkey" subject:@"Landscapes"];
    Photo *photo9 = [[Photo alloc]initWithImage:[UIImage imageNamed: @"condo1.jpg"] location:@"Alberta" subject:@"Condo"];
    Photo *photo10 = [[Photo alloc]initWithImage:[UIImage imageNamed: @"condo2.jpg"] location:@"Alberta" subject:@"Condo"];

    self.dataArray = @[photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10];
    
    [self sort];
    
//    for (data in self.dataArray)
//    
//    NSArray *food = @[[UIImage imageNamed: @"IMG_8602.jpg"],
//                    [UIImage imageNamed: @"IMG_8601.jpg"],
//                    [UIImage imageNamed: @"IMG_8603.jpg"]];
//    
//    NSArray *animal = @[[UIImage imageNamed: @"IMG_1527.jpg"],
//                        [UIImage imageNamed: @"IMG_5720.jpg"]];
//    
//    NSArray *landscapes = @[[UIImage imageNamed: @"IMG_4774.jpg"],
//                            [UIImage imageNamed: @"IMG_5465.jpg"],
//                            [UIImage imageNamed: @"IMG_5134.jpg"]];
//    
//    NSArray *apt = @[[UIImage imageNamed: @"condo1.jpg"],
//                    [UIImage imageNamed: @"condo2.jpg"]];
//    
//    self.arrayOfImageArrays = @[food,
//                                animal,
//                                landscapes,
//                                apt];
//    
//    self.subjectSections = @[@"Food",
//                             @"Animals",
//                             @"Landscapes",
//                             @"Condo"];
//    
//    NSArray *alberta = @[[UIImage imageNamed: @"condo1.jpg"],
//                         [UIImage imageNamed: @"condo2.jpg"],
//                         [UIImage imageNamed: @"IMG_1527.jpg"],
//                         [UIImage imageNamed: @"IMG_4774.jpg"]];
//    
//    NSArray *turkey = @[[UIImage imageNamed:@"IMG_5720.jpg"],
//                        [UIImage imageNamed:@"IMG_5465.jpg"]];
//                         
//    NSArray *argentina = @[[UIImage imageNamed: @"IMG_8602.jpg"],
//                           [UIImage imageNamed: @"IMG_8601.jpg"],
//                           [UIImage imageNamed: @"IMG_8603.jpg"]];
//    
//    self.arrayofImageArraysLocation = @[alberta,
//                                        argentina,
//                                        turkey];
//    
//    self.locationSections = @[@"Alberta",
//                              @"Argentina",
//                              @"Turkey"];
//    
//    self.displayArray = [NSArray arrayWithArray:self.arrayOfImageArrays];
//    self.displaySections = [NSArray arrayWithArray:self.subjectSections];
    
    self.customLayout = [[UICollectionViewFlowLayout alloc] init];
    self.customLayout.itemSize = CGSizeMake(100, 100);
    self.customLayout.headerReferenceSize = CGSizeMake(0, 150);
    self.collectionView.collectionViewLayout = self.customLayout;
}

#pragma mark Button

- (IBAction)changeModel:(UISegmentedControl*)sender {

    [self sort];
}

#pragma mark UICollectioViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.sectionsArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   
    NSString *key = self.sectionsArray[section];
    NSArray *photoObjects = self.dataDictionary[key];
    NSLog(@"==>>>> %@", @(photoObjects.count));
    return photoObjects.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"system wants cell %ld", indexPath.item);
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
  
    NSString *key = self.sectionsArray[indexPath.section];
    NSArray *photoArray = self.dataDictionary[key];
    Photo* photo = photoArray[indexPath.row];
    
    cell.imageView.image = photo.image;
   
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
            UILabel *label = [header viewWithTag:100];
        
        NSString* key = self.sectionsArray[indexPath.section];
           label.text = key;
        
          return header;
    }
    
    return nil;
}

-(void)sort {
    
    NSInteger index = [self.segControl selectedSegmentIndex];
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    if (index == 0) {
        
    for (Photo* photo in self.dataArray) {
        NSString *subjectKey = photo.subject;
        NSMutableArray *data = dictionary[subjectKey];
        if (!data) {
            data = [NSMutableArray new];
            [data addObject:photo];
            [dictionary setObject:data forKey:subjectKey];
            continue;
        }
        
        [data addObject:photo];
    }
        NSLog (@"%@", dictionary);
    }
    
    if (index == 1) {
        
        for (Photo* photo in self.dataArray) {
            NSString *locationKey = photo.location;
            NSMutableArray *photoArray = dictionary[locationKey];
            if (!photoArray) {
                photoArray = [NSMutableArray new];
                [photoArray addObject:photo];
                [dictionary setObject:photoArray forKey:locationKey];
                continue;
            }
            
            [photoArray addObject:photo];
        }
    }
    
    self.dataDictionary = dictionary;
    self.sectionsArray = [[dictionary allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    [self.collectionView reloadData];
}


@end
