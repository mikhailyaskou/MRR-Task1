//
//  PersonBirthday.h
//  MRR Task1
//
//  Created by Mikhail Yaskou on 18.04.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonBirthday <NSObject>

@required

- (BOOL)isTodayBirthDate; // required, возвращает bool
- (void)setBirthDateFromString:(NSString *) birthDateString; // required, задаем значение birthDate из строки

@optional

- (void)happyBirthday; // optional, поздравляем с ДР

@end
