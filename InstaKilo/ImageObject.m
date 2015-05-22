//
//  ImageObject.m
//  InstaKilo
//
//  Created by Jeremy Petter on 2015-05-21.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "ImageObject.h"

@implementation ImageObject

+(instancetype)imageObjectWithImage: (UIImage*)image subject: (NSString*)subject andLocation:(NSString*)location{
    ImageObject* imageObject = [[ImageObject alloc] init];
    imageObject.location = location;
    imageObject.image = image;
    imageObject.subject = subject;
    return imageObject;
}

+(NSArray*) filterImageObjects:(NSArray*)imageObjects byLocationOrSubject:(NSString*)filter{
    NSMutableArray* array = [NSMutableArray array];
    for (ImageObject* imageObject in imageObjects){
        if ([imageObject.location isEqualToString:filter]){
            [array addObject:imageObject];
        }
    }
    return array;
}

+(NSArray*)sortImageObjectsBySubject:(NSArray*)imageObjects{
    NSMutableArray* sortedData = [NSMutableArray array];
    NSArray* subjects = [ImageObject getUniqueSubjects:imageObjects];
    
    int sortedDataIndex = 0;
    for (NSString* subject in subjects){
        NSMutableArray* subjectImages = [NSMutableArray array];
        for (ImageObject* object in imageObjects){
            if ([object.subject isEqualToString:subject]){
                [subjectImages addObject:object];
            }
        }
        if ([subjectImages count] > 0){
            sortedData[sortedDataIndex] = subjectImages;
            sortedDataIndex++;
        }
    }
    return sortedData;

}

+(NSArray*)sortImageObjectsByLocation:(NSArray*)imageObjects {
    NSMutableArray* sortedData = [NSMutableArray array];
    NSArray* locations = [ImageObject getUniqueLocations:imageObjects];
    
    int sortedDataIndex = 0;
    for (NSString* location in locations){
        NSMutableArray* locationImages = [NSMutableArray array];
        for (ImageObject* object in imageObjects){
            if ([object.location isEqualToString:location]){
                [locationImages addObject:object];
            }
        }
        if ([locationImages count] > 0){
            sortedData[sortedDataIndex] = locationImages;
            sortedDataIndex++;
        }
    }
    return sortedData;
}

+(NSArray*) getUniqueLocations:(NSArray*)imageObjects{
    NSArray* array = @[];
    for (ImageObject* imageObject in imageObjects){
        if(![array containsObject:imageObject.location]){
            array = [array arrayByAddingObject:imageObject.location];
        }
    }
    return array;
}

+(NSArray*) getUniqueSubjects:(NSArray*)imageObjects{
    NSArray* array = @[];
    for (ImageObject* imageObject in imageObjects){
        if(![array containsObject:imageObject.subject]){
            array = [array arrayByAddingObject:imageObject.subject];
        }
    }
    return array;
}

@end
