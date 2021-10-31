//
//  ViewController.m
//  RotateArray
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
     189. 旋转数组
     
     给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。

      

     进阶：

     尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
     你可以使用空间复杂度为 O(1) 的 原地 算法解决这个问题吗？
      

     示例 1:

     输入: nums = [1,2,3,4,5,6,7], k = 3
     输出: [5,6,7,1,2,3,4]
     解释:
     向右旋转 1 步: [7,1,2,3,4,5,6]
     向右旋转 2 步: [6,7,1,2,3,4,5]
     向右旋转 3 步: [5,6,7,1,2,3,4]
     示例 2:

     输入：nums = [-1,-100,3,99], k = 2
     输出：[3,99,-1,-100]
     解释:
     向右旋转 1 步: [99,-1,-100,3]
     向右旋转 2 步: [3,99,-1,-100]
      

     提示：

     1 <= nums.length <= 2 * 104
     -231 <= nums[i] <= 231 - 1
     0 <= k <= 105

     来源：力扣（LeetCode）
     链接：https://leetcode-cn.com/problems/rotate-array
     著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
     */
    
    NSArray *arr = @[@1, @2, @3, @4, @5, @6, @7];
    NSLog(@"arr - %@", arr);
    NSLog(@"new arr - %@", [self.class rotateArray:arr :3]);
}

+ (NSArray <NSNumber *>*)rotateArray:(NSArray <NSNumber *>*)nums :(NSInteger)k
{
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:nums];
    [nums enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        newArray[(idx + k) % nums.count] = obj;
    }];
    return newArray;
}



/**
 class Solution {
     func rotate(_ nums: inout [Int], _ k: Int) {
         var newArray = Array(repeating: -1, count: nums.count)
         for index in 0..<nums.count {
             newArray[(index + k) % nums.count] = nums[index]
         }
         nums = newArray
     }
 }
 */

/**
class Solution {
    
    // 方法一：复制数组后，根据移动索引重新赋值
    func rotate(_ nums: inout [Int], _ k: Int) {
        let copy = nums
        for index in 0..<nums.count {
            // 移动 k 后的索引
            let toIndex = (index + k) % nums.count
            nums[toIndex] = copy[index]
        }
    }

    
    方法二:
    先翻转 整个数组
    再翻转前 k 个元素 [0, k - 1]
    最后翻转后 n-k 个元素 [k, count - 1]
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count // 处理输入 k 大于数组长度问题。
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, k - 1)
        reverse(&nums, k, nums.count - 1)
    }

    // 翻转数组指定区间的数据
    func reverse(_ nums: inout [Int], _ begin: Int, _ end: Int) {
        var l = begin
        var r = end
        while l < r {
            // 原地对换两数 方法一：
            nums[l] = nums[l] + nums[r]
            nums[r] = nums[l] - nums[r]
            nums[l] = nums[l] - nums[r]
            /
            
            //原地对换两数 方法二
            nums[l] = nums[l]^nums[r]
            nums[r] = nums[l]^nums[r]
            nums[l] = nums[l]^nums[r]
            l += 1
            r -= 1
        }
    }

}

作者：CoderWangx
链接：https://leetcode-cn.com/problems/rotate-array/solution/swift-ji-bai-100-by-coderwangx-9qg9/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
*/

@end
