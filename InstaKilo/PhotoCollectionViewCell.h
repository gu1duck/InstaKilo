//
//  PhotoCollectionViewCell.h
//  InstaKilo
//
//  Created by Jeremy Petter on 2015-05-21.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellPhoto;
@property (strong, nonatomic) NSString* subject;



@end
