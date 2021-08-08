// Copyright (C) 2020 Hao Nguyen <hao.ict56@gmail.com>
// Copyright (C) 2021 Nicholas Lim <nicknitewolf@lineageos.org>

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TFNTwitterStatus : NSObject
@property(readonly, nonatomic) bool isPromoted;
@end

@interface TFNDataViewItem : NSObject
@property(retain, nonatomic) id _Nullable item;
@end

@interface TFNItemsDataViewController : NSObject
@property(copy, nonatomic) NSArray * _Nullable sections;
- (id _Nullable)itemAtIndexPath:(id _Nullable)arg1;
@end

@interface T1URTFooterViewModel : NSObject
@property(nonatomic, readonly) NSURL * _Nullable url;
@end

@interface TFNTwitterModuleFooter : NSObject
@property(nonatomic, readonly) NSURL * _Nullable url;
@end

@interface T1URTTimelineUserItemViewModel : NSObject
@property(readonly, nonatomic) NSString * _Nullable scribeComponent;
@end

@interface TFSTwitterEntityURL : NSObject
@property(readonly, copy, nonatomic) NSString * _Nullable expandedURL;
@end