//
//  User.h
//  MRR Task1
//
//  Created by Mikhail Yaskou on 18.04.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Friend;

@interface User : NSObject

@property (atomic, retain) NSNumber *userId; // уникальный идентификатор пользователя, переопределить get/set методы
@property (nonatomic, retain) NSMutableString *firstName; // переопределить get/set методы
@property (nonatomic, copy) NSMutableString *lastName; // переопределить get/set методы
@property(nonatomic, unsafe_unretained) NSMutableString *middleName; //unsafe_unretained
@property (nonatomic, retain) NSDate *birthDate;
@property (atomic, copy) NSArray *followers; // содержит экземпляры Friend // переопределить get/set методы
@property (nonatomic, copy) NSArray *following; // содержит экземпляры Friend
@property (nonatomic, retain) NSDictionary *address; // map, содержащий информации о city, country, postCode
@property (nonatomic, copy, readonly) NSString *city; // на основе инфы в address
@property (nonatomic, copy, readonly) NSString *country; // на основе инфы в address
@property(nonatomic, assign, getter=isContactUser) BOOL contactUser; // сделать readonly, сделать get-метод isContactUser  // переопределить get/set методы // допустим, что есть модель описывающая какие пользователи в контактной книги😃

- (id)initWithUserId:(NSNumber *)userId firstName: (NSMutableString *)firstName lastName:(NSMutableString *)lastName;

- (void)dealloc;


- (void)printFullName; // выводит на консоль имя
- (void)addFollower:(Friend *) friend; // добавление friend в follower
- (void)removeFollower:(Friend*) friend; // удаление friend в follower
- (BOOL)isFollowerUser: (User *)user;  // возвращает bool value
- (void)addFollowing:(Friend*) friend; // добавление friend в following
- (void)removeFollowing:(Friend*) friend;
- (BOOL)isFollowingUser:(User *)user;

- (NSString *)description;


@end
