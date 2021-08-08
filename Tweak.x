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

#import "TwitterHeaders.h"

%hook TFNItemsDataViewController
- (id)tableViewCellForItem:(id)arg1 atIndexPath:(id)arg2 {
    UITableViewCell *tbvCell = %orig;
    id item = [self itemAtIndexPath: arg2];

    // Hide promoted tweets
    if ([item respondsToSelector: @selector(isPromoted)] && [item performSelector:@selector(isPromoted)]) {
        [tbvCell setHidden: YES];
        return tbvCell;
    }

    // Hide news and trending
    NSString *itemClassName = NSStringFromClass([item classForCoder]);
    if ([itemClassName isEqualToString:@"T1Twitter.URTTimelineTrendViewModel"]
        || [itemClassName isEqualToString:@"T1Twitter.URTTimelineEventSummaryViewModel"]
        || [itemClassName isEqualToString:@"T1URTTimelineMessageItemViewModel"]) {
        [tbvCell setHidden: YES];
        return tbvCell;
    }

    return tbvCell;
}

- (double)tableView:(id)arg1 heightForRowAtIndexPath:(id)arg2 {
    id item = [self itemAtIndexPath: arg2];

    // Hide promoted tweets
    if ([item respondsToSelector: @selector(isPromoted)] && [item performSelector:@selector(isPromoted)]) {
        return 0;
    }

    // Hide news and trending
    NSString *itemClassName = NSStringFromClass([item classForCoder]);
    if ([itemClassName isEqualToString:@"T1Twitter.URTTimelineTrendViewModel"]
        || [itemClassName isEqualToString:@"T1Twitter.URTTimelineEventSummaryViewModel"]
        || [itemClassName isEqualToString:@"T1URTTimelineMessageItemViewModel"]) {
        return 0;
    }

    return %orig;
}

- (double)tableView:(id)arg1 heightForHeaderInSection:(long long)arg2 {
    if (self.sections 
        && self.sections[arg2] 
        && ((NSArray* )self.sections[arg2]).count
        && self.sections[arg2][0]) {
        NSString *sectionClassName = NSStringFromClass([self.sections[arg2][0] classForCoder]);
        if ([sectionClassName isEqualToString:@"TFNTwitterUser"]) {
            return 0;
        }
    }
    return %orig;
}
%end