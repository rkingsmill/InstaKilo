//
//  Photo.m
//  InstaKilo
//
//  Created by Rosalyn Kingsmill on 2016-05-18.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(instancetype)initWithImage:(UIImage*)image location:(NSString*)location subject:(NSString*)subject {
    
    self = [super init];
    
    if (self) {
        
    _image = image;
    _location = location;
    _subject = subject;
        
    }
    
    return self;
}

@end
