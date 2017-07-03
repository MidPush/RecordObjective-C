//
//  NSDate+Category.h
//  RecordObjective-C
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 Xz Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Category)

@property (nonatomic, assign, readonly) NSInteger year;
@property (nonatomic, assign, readonly) NSInteger month;
@property (nonatomic, assign, readonly) NSInteger day;
@property (nonatomic, assign, readonly) NSInteger hour;
@property (nonatomic, assign, readonly) NSInteger minute;
@property (nonatomic, assign, readonly) NSInteger second;
@property (nonatomic, assign, readonly) NSInteger nanosecond;
@property (nonatomic, assign, readonly) NSInteger weekday;
@property (nonatomic, assign, readonly) NSInteger weekdayOrdinal;
@property (nonatomic, assign, readonly) NSInteger weekOfMonth;
@property (nonatomic, assign, readonly) NSInteger weekOfYear;
@property (nonatomic, assign, readonly) NSInteger yearForWeekOfYear;
@property (nonatomic, assign, readonly) NSInteger quarter;

@property (nonatomic, assign, readonly) BOOL isLeapMonth;   // 是否是闰月
@property (nonatomic, assign, readonly) BOOL isLeapYear;    // 是否是闰年
@property (nonatomic, assign, readonly) BOOL isToday;       // 是否是今天
@property (nonatomic, assign, readonly) BOOL isYesterday;   // 是否是昨天


@end
