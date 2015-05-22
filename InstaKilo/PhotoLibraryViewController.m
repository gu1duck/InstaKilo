//
//  ViewController.m
//  InstaKilo
//
//  Created by Jeremy Petter on 2015-05-21.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "PhotoLibraryViewController.h"
#import "PhotoCollectionViewCell.h"
#import "ImageObject.h"
#import "PhotoCollectionReusableView.h"

typedef enum ImageObjectSortOrder{
    ImageObjectSortOrderSubject,
    ImageObjectSortOrderLocation
} ImageObjectSortOrder;

@interface PhotoLibraryViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UICollectionView *photoCollectionView;
@property (nonatomic) ImageObjectSortOrder sort;
@property (nonatomic) NSArray* sortedData;

@end

@implementation PhotoLibraryViewController

- (void)viewDidLoad {
    self.sort = ImageObjectSortOrderSubject;
    self.sortedData = [self sortData];
    
    UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action: @selector(deletePhoto:)];
    [self.photoCollectionView addGestureRecognizer:doubleTap];
    doubleTap.numberOfTapsRequired = 2;
}


- (void)deletePhoto:(UITapGestureRecognizer*)gesture{
    if (gesture.state == UIGestureRecognizerStateEnded){
        CGPoint touchLocation = [gesture locationInView:self.photoCollectionView];
        NSIndexPath* path =[self.photoCollectionView indexPathForItemAtPoint:touchLocation];

        ImageObject* deletionTarget = self.sortedData[path.section][path.row];
        NSMutableArray *deletionArray = [self.photos mutableCopy];
        [deletionArray removeObject:deletionTarget];
        self.photos = [deletionArray copy];
        self.sortedData = [self sortData];
        [self.photoCollectionView deleteItemsAtIndexPaths:@[path]];
        [self.photoCollectionView reloadData];
        
        
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [self.sortedData count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.sortedData[section] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];
    ImageObject* targetObject = self.sortedData[indexPath.section][indexPath.row];
    cell.cellPhoto.image = targetObject.image;
    
    return cell;
}

-(NSArray*)sortData{
    if (self.sort == ImageObjectSortOrderSubject){
        return [ImageObject sortImageObjectsBySubject:self.photos];
    } else {
        return [ImageObject sortImageObjectsByLocation:self.photos];
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView* view = nil;
    if (kind == UICollectionElementKindSectionHeader){
        PhotoCollectionReusableView* headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"photoHeader" forIndexPath:indexPath];
        ImageObject* targetObject = self.sortedData[indexPath.section][indexPath.row];
        if (self.sort == ImageObjectSortOrderSubject){
            headerView.sectionLabel.text = targetObject.subject;
        } else {
            headerView.sectionLabel.text = targetObject.location;
        }
        view = headerView;
    }
    return view;
}

- (IBAction)sortOrderSegmentsedController:(id)sender {
    if(self.segmentedControl.selectedSegmentIndex == 0){
        self.sort = ImageObjectSortOrderSubject;
        self.sortedData = [self sortData];
    } else {
        self.sort = ImageObjectSortOrderLocation;
        self.sortedData = [self sortData];
    }
    [self.photoCollectionView reloadData];
}




@end
