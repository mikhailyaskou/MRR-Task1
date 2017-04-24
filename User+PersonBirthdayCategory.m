//
//  User+PersonBirthdayCategory.m
//  MRR Task1
//
//  Created by Mikhail Yaskou on 21.04.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

#import "User+PersonBirthdayCategory.h"

@implementation User (PersonBirthdayCategory)

- (BOOL)isTodayBirthDate{
    
    return [[NSCalendar currentCalendar] isDateInToday:self.birthDate];
}


- (void)setBirthDateFromString:(NSString *) birthDateString{
    
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"dd.MM.yyyy"];
    
    self.birthDate = [dateFormatter dateFromString:birthDateString];
    
    [dateFormatter release];
}

- (void)happyBirthday{
    
    NSLog(@"Happy birthday %@ %@!", self.firstName, self.lastName);
}

@end
