//
//  Friend.h
//  MRR Task1
//
//  Created by Mikhail Yaskou on 18.04.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"


@interface Friend : User


@property (nonatomic, copy)NSNumber * blocked;


-(BOOL)isBlocked;

-(id)initWithUserId:(NSNumber *)userId firstName:(NSMutableString *)firstName lastName:(NSMutableString *)lastName;


@end
