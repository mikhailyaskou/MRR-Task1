//
//  User+Addres.m
//  MRR Task1
//
//  Created by Mikhail Yaskou on 18.04.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

#import "User+Addres.h"

@implementation User (Addres)

-(NSString *)compositeAddress{
    
    NSMutableString *compositeAddress = [[NSMutableString alloc] initWithString:@"Adreess is:"];
    
    
    NSString *city = self.address[@"city"];
    NSString *country = self.address[@"country"];
    
    
    if (city || country){
        
        if (city){
        
         [compositeAddress appendFormat:@" city - %@" , city];
        }
        
        if (country){
            
          [compositeAddress appendFormat:@" country - %@" , country];
        }
        
        }
        else{
       
             [compositeAddress appendFormat :@"Unknown"];
            
        }
    
    
    
    return [[[compositeAddress autorelease]copy] autorelease];
    
}

@end
