//
//  ViewController.m
//  SortedSquares
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
     977. 有序数组的平方
     给你一个按 非递减顺序 排序的整数数组 nums，返回 每个数字的平方 组成的新数组，要求也按 非递减顺序 排序。

      

     示例 1：

     输入：nums = [-4,-1,0,3,10]
     输出：[0,1,9,16,100]
     解释：平方后，数组变为 [16,1,0,9,100]
     排序后，数组变为 [0,1,9,16,100]
     示例 2：

     输入：nums = [-7,-3,2,3,11]
     输出：[4,9,9,49,121]
      

     提示：

     1 <= nums.length <= 104
     -104 <= nums[i] <= 104
     nums 已按 非递减顺序 排序
      

     进阶：

     请你设计时间复杂度为 O(n) 的算法解决本问题

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/squares-of-a-sorted-array
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    
    /**
     解析：
     
     数组其实是有序的， 只不过负数平方之后可能成为最大数了。

     那么数组平方的最大值就在数组的两端，不是最左边就是最右边，不可能是中间。

     此时可以考虑双指针法了，i指向起始位置，j指向终止位置。

     定义一个新数组result，和A数组一样的大小，让k指向result数组终止位置。

     作者：carlsun-2
     链接：https://leetcode-cn.com/problems/squares-of-a-sorted-array/solution/dai-ma-sui-xiang-lu-shu-zu-ti-mu-zong-ji-1rtz/
     来源：力扣（LeetCode）
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    NSLog(@"---- %@", [self.class sortedSquares:@[@-99, @-10, @-3, @0, @1, @9, @10]]);
}


+ (NSArray <NSNumber *>*)sortedSquares:(NSArray <NSNumber *>*)nums
{
    __block NSInteger first = 0;
    __block NSInteger last = nums.count - 1;
    __block NSInteger tempLast = nums.count - 1;
    NSMutableArray <NSNumber *>*sortedArray = [NSMutableArray arrayWithArray:nums];
    [nums enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger firstSquares = [nums[first] integerValue] * [nums[first] integerValue];
        NSInteger lastSquares = [nums[last] integerValue] * [nums[last] integerValue];
        if (firstSquares < lastSquares) {
            sortedArray[tempLast] = @(lastSquares);
            last -= 1;
        } else {
            sortedArray[tempLast] = @(firstSquares);
            first += 1;
        }
        tempLast -= 1;
    }];
    return sortedArray;
}



/**
 class Solution {
     func sortedSquares(_ nums: [Int]) -> [Int] {
         var first = 0
         var last = nums.count - 1
         var tempLast = nums.count - 1
         var sortedArray = Array(repeating: -1, count: nums.count)
         for index in 0..<nums.count {
             var firstSquares = nums[first] * nums[first]
             var lastSquares = nums[last] * nums[last]
             if firstSquares < lastSquares {
                 sortedArray[tempLast] = lastSquares
                 last -= 1
             } else {
                 sortedArray[tempLast] = firstSquares
                 first += 1
             }
             tempLast -= 1
         }
         return sortedArray
     }
 }
 */

@end
