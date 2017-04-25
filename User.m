//
//  User.m
//  MRR Task1
//
//  Created by Mikhail Yaskou on 18.04.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

#import "User.h"

@interface User()

@property (nonatomic, retain) NSMutableArray* mutableFollowers;
@property (nonatomic, retain) NSMutableArray* mutableFollowings;

@end

@implementation User


@synthesize userId = _userId;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize middleName = _middleName;
@synthesize birthDate = _birthDate;
@synthesize address = _address;
@synthesize city = _city;
@synthesize country = _country;
@synthesize contactUser = _contactUser;
@synthesize mutableFollowers = _mutableFollowers;
@synthesize mutableFollowings = _mutableFollowings;

-(id)initWithUserId:(NSNumber *)userId firstName:(NSMutableString *)firstName lastName:(NSMutableString *)lastName{
    
    self = [super init];
    
    if (self) {
           self.userId = userId;
           self.firstName = firstName;
           self.lastName = lastName;
           self.mutableFollowings = nil;
           self.mutableFollowers = nil;
    }
    

    
    return self ;
}




-(NSNumber *)userId{
     @synchronized(self) {
         return [[_userId retain] autorelease];
     }
}

-(void)setUserId:(NSNumber *)userId{
    
    @synchronized(self) {
        if (_userId != userId){
            [_userId release];
            _userId = [userId retain];
        };
    }
}


-(NSMutableString *)firstName{
    return [[_firstName retain] autorelease];
}

-(void)setFirstName:(NSMutableString *)firstName{
        
        if (_firstName != firstName)
        {
            [_firstName release];
            _firstName = [firstName retain];
        }
    
}


-(NSMutableString*)lastName{
    return [[_lastName retain] autorelease];
}

-(void)setLastName:(NSMutableString *)lastName{
    
    if (_lastName != lastName)
    {
        [_lastName release];
        _lastName = [lastName mutableCopy];
    }
}


-(NSMutableString *)middleName{
    return [[_middleName retain] autorelease];
}


-(void)setMiddleName:(NSMutableString *)middleName{
    
   _middleName= middleName;
}


-(NSDate *)birthDate{
    return [[_birthDate retain] autorelease];
}

-(void)setBirthDate:(NSDate *)birthDate{
    
    if (_birthDate != birthDate){
        
        [_birthDate release];
        _birthDate = [birthDate retain];
    }
    
}


-(NSArray *)followers{
    
    @synchronized (self) {
        return [[_mutableFollowers copy]autorelease];
    }
}

-(void)setFollowers:(NSArray *)followers{
    
    @synchronized (self) {
        
        [_mutableFollowers release];
        
        _mutableFollowers = [NSMutableArray arrayWithArray:followers];
        
         }
}


-(NSArray *)following{
    return [[_mutableFollowings copy] autorelease];
}

-(void)setFollowing:(NSArray *)following{
    
    [_mutableFollowings release];
    
    _mutableFollowings = [NSMutableArray arrayWithArray:following];
    
}

-(NSDictionary *)address{
    return [[_address retain] autorelease];
}

-(void)setAddress:(NSDictionary *)address{
    
    if (_address != address){
        
        [_address release];
        _address = [address retain];
    }
}

-(NSString *)city{
    
    return [[_address[@"city"] retain] autorelease];
}

-(NSString *)country{
    
    return [[_address[@"country"] retain] autorelease];
}


-(BOOL)isContactUser{
    return _contactUser;
}


-(void)printFullName{
    
    NSLog(@"@First name: %@, LastName: @%@", _lastName, _firstName);
    }


-(void)addFollower:(Friend *) friend{
    
    if (![self isFollowerUser: (User *) friend]){
        
    [_mutableFollowers addObject:friend];
    } else{
        
        NSLog(@"This User: %@ already in followers!", _userId);
    }
}


-(void)removeFollower:(Friend *) friend{
    
    [_mutableFollowers removeObject:friend];
}


- (BOOL)isFollowerUser:(User *)user{
    
    return [_mutableFollowers containsObject: user];
}


- (void)addFollowing:(Friend*) friend {
    
    if (![self isFollowingUser: (User *) friend]){
        
    [_mutableFollowings addObject:friend];
    } else{
        
        NSLog(@"This User: %@ already in followings!", _userId);
    }
}

-(void)removeFollowing:(Friend *)friend{
    
    [_mutableFollowings removeObject:friend];
}

- (BOOL)isFollowingUser:(User *)user {
    
    return  [_mutableFollowings containsObject:user];
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"\nUserID: %@ \nFrist Name: %@\nLast Name: %@\nBirth Date : %@\nFollowers : %@\nFollowing : %@\nAddress : %@\nCity : %@\nCountry : %@\n",
             _userId, _firstName, _lastName, [NSString stringWithFormat:@"%@", _birthDate], self.followers, self.followers, _address, _city, _country];
}


- (void)dealloc{
    
    [_userId release];
    [_firstName release];
    [_lastName release];
    _middleName=nil;
    [_birthDate release];
    [_mutableFollowings release];
    [_mutableFollowers release];
    [_address release];
    [_city release];
    [_country release];
    [super dealloc];

}



@end
