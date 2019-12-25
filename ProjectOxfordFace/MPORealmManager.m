//
//  MPORealmManager.m
//  ProjectOxfordFace_Example
//
//  Created by Duy Hung Le on 12/25/19.
//  Copyright © 2019 David Porter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface PersonModel : RLMObject
@property NSString *mhs;
@property NSString             *name;
@property NSString *dob;
@end
@implementation PersonModel
@end

@implementation Test : NSObject 

+ (void)test {
    RLMRealm *realm = [RLMRealm defaultRealm];

    // Get our Realm file's parent directory
    NSString *folderPath = realm.configuration.fileURL.URLByDeletingLastPathComponent.path;
    
    NSLog(@"%@", folderPath);
    
// Use them like regular Objective‑C objects
    PersonModel *p = [[PersonModel alloc] init];
    p.name = @"hung";
    p.mhs = @"20162009";
    p.dob = @"22/01/1998";
    
    // Query Realm for all dogs less than 2 years old
    RLMResults< PersonModel*> *puppies = [PersonModel objectsWhere:@"name = hung"];
    puppies.count; // => 0 because no dogs have been added to the Realm yet

    // Persist your data easily
    [realm transactionWithBlock:^{
        [realm addObject:p];
    }];
    
    // Queries are updated in realtime
    puppies.count; // => 1

    // Query and update the result in another thread
//    dispatch_async(dispatch_queue_create("background", 0), ^{
//        @autoreleasepool {
//            Dog *theDog = [[Dog objectsWhere:@"age == 1"] firstObject];
//            RLMRealm *realm = [RLMRealm defaultRealm];
//            [realm beginWriteTransaction];
//            theDog.age = 3;
//            [realm commitWriteTransaction];
//        }
//    });
}

@end
