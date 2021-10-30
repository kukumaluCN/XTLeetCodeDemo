//
//  ViewController.m
//  TheFirstIncorrectVersion
//
//  Created by JXT on 2021/10/30.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    /**
     278. 第一个错误的版本
     你是产品经理，目前正在带领一个团队开发新的产品。不幸的是，你的产品的最新版本没有通过质量检测。由于每个版本都是基于之前的版本开发的，所以错误的版本之后的所有版本都是错的。

     假设你有 n 个版本 [1, 2, ..., n]，你想找出导致之后所有版本出错的第一个错误的版本。

     你可以通过调用 bool isBadVersion(version) 接口来判断版本号 version 是否在单元测试中出错。实现一个函数来查找第一个错误的版本。你应该尽量减少对调用 API 的次数。

      
     示例 1：

     输入：n = 5, bad = 4
     输出：4
     解释：
     调用 isBadVersion(3) -> false
     调用 isBadVersion(5) -> true
     调用 isBadVersion(4) -> true
     所以，4 是第一个错误的版本。
     示例 2：

     输入：n = 1, bad = 1
     输出：1
      

     提示：

     1 <= bad <= n <= 231 - 1

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/first-bad-version
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    [self.class firstBadVersionWithTotal:10];
}



/** 本质还是二分查找，isBadVersion() 函数，实现逻辑大致就是
```
func isBadVersion(_ version: Int) -> Bool {
    // 假设第一个错误版本是4
    return version >= 4
}
```
那么如果判断条件是错误版本，就可以设置右区间，因为此时第一个错误版本一定在左侧，反之就是在右侧。
*/
+ (NSInteger)firstBadVersionWithTotal:(NSInteger)n
{
    NSInteger left = 1;
    NSInteger right = n;
    while (left <= right) {
        NSInteger middle = left + (right - left) / 2;
        NSLog(@"middle - %zd", middle);
        // 5是错误版本 1234567890 右侧肯定是，需要排除，左侧可能也是，需要判断
        if ([self isBadVersion:middle]) {
            right = middle - 1;
            NSLog(@"right - %zd", right);
        } else {
            left = middle + 1;
            NSLog(@"left - %zd", left);
        }
    }
    return left;
}

static NSInteger firstBadVersion = 4;
+ (BOOL)isBadVersion:(NSInteger)ver
{
    NSInteger bad = firstBadVersion;
    return ver >= bad;
}



/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

//class Solution : VersionControl {
//    func firstBadVersion(_ n: Int) -> Int {
//        var left = 1
//        var right = n
//        while left <= right {
//            var middle = left + (right - left) / 2
//            // 是错误版本 1234567 左侧可能也是
//            if isBadVersion(middle) {
//                right = middle - 1
//            } else {
//                left = middle + 1
//            }
//        }
//        return left
//    }
//}


@end
