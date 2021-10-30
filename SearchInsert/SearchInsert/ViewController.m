//
//  ViewController.m
//  SearchInsert
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
     35. 搜索插入位置
     给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

     请必须使用时间复杂度为 O(log n) 的算法。

      

     示例 1:

     输入: nums = [1,3,5,6], target = 5
     输出: 2
     示例 2:

     输入: nums = [1,3,5,6], target = 2
     输出: 1
     示例 3:

     输入: nums = [1,3,5,6], target = 7
     输出: 4
     示例 4:

     输入: nums = [1,3,5,6], target = 0
     输出: 0
     示例 5:

     输入: nums = [1], target = 0
     输出: 0
      

     提示:

     1 <= nums.length <= 104
     -104 <= nums[i] <= 104
     nums 为无重复元素的升序排列数组
     -104 <= target <= 104


     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/search-insert-position
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    [self.class searchInsertIn:@[@1, @3, @5, @9, @11, @20] with:2];
}


+ (NSInteger)searchInsertIn:(NSArray <NSNumber *>*)nums with:(NSInteger)target
{
    NSInteger left = 0;
    NSInteger right = nums.count - 1;
    while (left <= right) {
        NSInteger middle = left + (right - left) / 2;
        NSLog(@"middle - %zd", middle);
        NSInteger middleValue = [nums[middle] integerValue];
        NSLog(@"middleValue - %zd", middleValue);
        if (target < middleValue) {
            right = middle - 1;
            NSLog(@"right - %zd", right);
        } else if (target > middleValue) {
            left = middle + 1;
            NSLog(@"left - %zd", left);
        } else {
            NSLog(@"middle - %zd", middle);
            return middle;
        }
    }
    NSLog(@"end - left - %zd", left);
    return left;
}


/**
 class Solution {
     func searchInsert(_ nums: [Int], _ target: Int) -> Int {
         var left = 0
         var right = nums.count - 1
         while left <= right {
             var middle = left + (right - left) / 2
             if target < nums[middle] {
                 right = middle - 1
             } else if target > nums[middle] {
                 left = middle + 1
             } else {
                 return middle
             }
         }
         return left
     }
 }
 */


@end
