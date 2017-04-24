//
//  Friend.m
//  MRR Task1
//
//  Created by Mikhail Yaskou on 18.04.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

#import "Friend.h"
#import "User.h"

@implementation Friend

-(id)initWithUserId:(NSNumber *)userId firstName:(NSMutableString *)firstName lastName:(NSMutableString *)lastName{
    
    self = [super initWithUserId:userId firstName:firstName lastName:lastName];
    return self;
    
}


-(BOOL)isBlocked{
        return [_blocked boolValue];
}
 
-(NSString *)description{
    
   return [NSString stringWithFormat:@"\n %@ \nBlocked :%@",
     [super description], [_blocked stringValue]];
}

-(void)dealloc{
    [_blocked release];
    [super dealloc];
    
}

@end
