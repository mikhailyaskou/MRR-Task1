//
//  main.m
//  MRR Task1
//
//  Created by Mikhail Yaskou on 18.04.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Friend.h"
#import "User+Addres.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        NSMutableString *myFirstName =[[NSMutableString alloc] initWithString:@"FirstName"];
        NSMutableString *myLastName = [[NSMutableString alloc] initWithString:@"LastName"];

        User * user1 = [[User alloc] initWithUserId:@1 firstName:myFirstName lastName:myLastName];
        User * user2 = [[User alloc] initWithUserId:@2 firstName: [[@"Jack" mutableCopy] autorelease] lastName: [[@"Noname" mutableCopy]autorelease]];
        User * user3 = [[User alloc] initWithUserId:@3 firstName:[NSMutableString stringWithString:@"Maloun"] lastName:[NSMutableString stringWithString:@"Snnoger"]];
        User * user4 = [[User alloc] initWithUserId:@4 firstName:[NSMutableString stringWithString:@"Snepot"] lastName: [NSMutableString stringWithString:@"Shrad"]];
        User * user5 = [[User alloc] initWithUserId:@5 firstName:[NSMutableString stringWithString:@"Melody"]  lastName:[NSMutableString stringWithString:@"Veregy"] ];
        User * user6 = [[User alloc] initWithUserId:@6 firstName:[NSMutableString stringWithString:@"Jeremy"] lastName:[NSMutableString stringWithString:@"Malkoy"] ];
        User * user7 = [[User alloc] initWithUserId:@7 firstName:[NSMutableString stringWithString:@"Veely" ] lastName:[NSMutableString stringWithString:@"Psykovki"] ];
        User * user8 = [[User alloc] initWithUserId:@8 firstName:[NSMutableString stringWithString:@"Shark"] lastName:[NSMutableString stringWithString:@"Grozny"]];
        User * user9 = [[User alloc] initWithUserId:@9 firstName:[NSMutableString stringWithString:@"Mark"] lastName:[NSMutableString stringWithString:@"Voychakovski"]];
        User * user10 = [[User alloc] initWithUserId:@10 firstName:[NSMutableString stringWithString:@"Makar"] lastName:[NSMutableString stringWithString:@"Laaazy"]];
        
        
        /* 1 что происходит с объектами добавляемыми в NSArray - assign, retain или copy?
         
         Происходит retain.
         
        */
        
        NSLog(@"%lu", (unsigned long)[user1 retainCount]);
        
        NSArray * users = [[NSArray alloc] initWithObjects: user1, user2, user3, user4, user5, user6, user7, user8, user9, user10, nil];
        
        NSLog(@"%lu", (unsigned long)[user1 retainCount]);
       
        [users[0] setFirstName : [NSMutableString stringWithString:@"changed by array index in array / "]];
        
        NSLog(@"%@", user1.firstName);

        [user1.firstName appendString:@" changed by object reference"];
        
        NSLog(@"%@", user1.firstName);

        
        [users release];
        
        
        /* 2 что происходит с объектами добавляемыми в NSDictionary, а точнее с key и value - assign, retain или copy
         
         c value происходит retain, c key происходит copy;
         
         */
        
        NSLog(@"%lu", (unsigned long)[user1 retainCount]);

        
        user1.firstName = myFirstName;
        user1.lastName = myLastName;
        
        NSString * oneKey = @"1";
        NSString * twoKey = @"2";
        
        
        NSDictionary *usersDictonary = @{oneKey : user1, twoKey : user2};
        
        NSLog(@"%lu", (unsigned long)[user1 retainCount]);
        
        oneKey = @"2";
        
        [usersDictonary[oneKey] setFirstName : [NSMutableString stringWithString:@"changed by dictonary index in dictonary / "]];
        
        NSLog(@"from dictonary - %@", user1.firstName);
        
       
        
        /* 3 что происходит при редактирование firstName и lastName?
        
        При редактировании firstName (retain).
         
        проперти сетера просто присваевает полю указатель на переданный в сеттер обьект и увеличивает счетчик удержания на 1,
         
        однако он все еще тот же объект, отредактировав переданную переменную (myFirstName) изменения отразятся и в поле объекта, т.к. это и есть один объект,
         
        вызвав через дот нотацию геттер мы можем обращаться с ней как NSMutableString.
         
         
        При редактировании lastName (copy).
         
        проперти сеттера создают копию нового объекта и мы получаем два абсолютно разных объекта, при этом если мы создали не мутабельную копию - то геттер вернет нам не NSMutableString, а просто NSString.
        
         */

        
        
        user1.firstName = myFirstName;
        user1.lastName = myLastName;
        
        NSLog(@"%@", user1.firstName);
        NSLog(@"%@", user1.lastName);
        
        
        [myFirstName appendString:@" FirstName changed by first reference / "];
        [myLastName appendString:@" LastName changed by first reference / "];
        
        
        NSLog(@"%@", user1.firstName);
        NSLog(@"%@", user1.lastName);

        
        [user1.firstName appendString:@" FirstName changed by getter reference"];
        [user1.lastName appendString:@" LastName changed by getter reference"];

        
        NSLog(@"%@", user1.firstName);
        NSLog(@"%@", user1.lastName);
        
        
    //     Friend * friend1 = [[Friend alloc] init];
    //     Friend * friend2 = [[Friend alloc] initWithUserId:@254 firstName:(NSMutableString *)@"Lena" lastName:(NSMutableString *)"konovalenko"];
        
     //    NSDictionary *adress = @{@"city" : @ "Gomel", @"country" : @"BLR", @"postcode" : @"246025"};
    //     NSDictionary *adress1 = @{ @"country" : @"BLR", @"postcode" : @"246025"};
    //     NSDictionary *adress2 = @{ @"postcode" : @"246025"};
       
      //  [friend1 release];
       // [friend2 release];
        [myFirstName release];
        [myLastName release];
        [user1 release];
        [user2 release];
        [user3 release];
        [user4 release];
        [user5 release];
        [user6 release];
        [user7 release];
        [user8 release];
        [user9 release];
        [user10 release];
    
    }
    return 0;
}
