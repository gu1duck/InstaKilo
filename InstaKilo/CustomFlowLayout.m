//
//  CustomFlowLayout.m
//  InstaKilo
//
//  Created by Jeremy Petter on 2015-05-21.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "CustomFlowLayout.h"

@implementation CustomFlowLayout

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    NSIndexPath *decorationIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    
    UICollectionViewLayoutAttributes *decorationAttributes =[UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:@"BackgroundView" withIndexPath:decorationIndexPath];
    
    decorationAttributes.frame = CGRectMake(0.0f,
                                            0.0f,
                                            self.collectionViewContentSize.width,
                                            self.collectionViewContentSize.height);
    
    [attributes addObject:decorationAttributes];
    
    return attributes;
}


@end
