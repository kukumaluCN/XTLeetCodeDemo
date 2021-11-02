# XTLeetCodeDemo
**LeetCode练习**

## 20211028 二分查找
1. BinarySearchDemo
leet 704. 二分查找
2. TheFirstIncorrectVersion
leet 278. 第一个错误的版本
解题思路:
本质还是二分查找，isBadVersion() 函数，实现逻辑大致就是
```swift
func isBadVersion(_ version: Int) -> Bool {
    // 假设第一个错误版本是4
    return version >= 4
}
```
那么如果判断条件是错误版本，就可以设置右区间，因为此时第一个错误版本一定在左侧，反之就是在右侧。
```swift
class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1
        var right = n
        while left <= right {
            var middle = left + (right - left) / 2
            // 是错误版本 1234567 左侧可能也是
            if isBadVersion(middle) {
                right = middle - 1
            } else {
                left = middle + 1
            }
        } 
        return left
    }
}
```

3. SearchInsert
leet 35. 搜索插入位置

[算法：从二分查找到时间复杂度](https://www.jianshu.com/p/fb7001a8e0b1)
> 运用简单查找算法，在n个元素的数组中查找一个数，情况最遭时，需要n步，所以简单查找的时间复杂度是O(n)；
> 运用二分查找算法，在n个元素的数组中查找一个数，情况最遭时，需要(log2 n)步，所以二分查找的时间复杂度是O(log2 n)。

## 20211030 双指针
1. SortedSquares
leet 977. 有序数组的平方
2. RotateArray
leet 189. 旋转数组

## 20211031 双指针
1. MoveZeroes
leet 283. 移动零
2. TwoSum
leet 167. 两数之和 II - 输入有序数组

## 20211031 双指针
1. ReverseString
leet 344. 反转字符串

解题思路：
只要遍历数组的一半，和另一半替换位置即可。
或者swift的作弊函数：
```swift
func reverseString(_ s: inout [Character]) {
    s.reverse()
}
```
这个效率也是最高的。
```swift
class Solution {
    func reverseString(_ s: inout [Character]) {
        for index in 0..<s.count/2 {
            s.swapAt(index, s.count-index-1)
        }
    }
}
```
2. ReverseWords
leet 557. 反转字符串中的单词 III

解题思路：
```objc
+ (NSString *)reverseWords:(NSString *)s
{
    NSMutableArray *sArray = [NSMutableArray array];
    // 倒序拆分单个字符字符串
    for (NSInteger i = s.length-1; i >= 0; i --) {
        unichar character = [s characterAtIndex:i];
        NSLog(@"%c", character);
        [sArray addObject:[NSString stringWithFormat:@"%c", character]];
    }
    // 组合完全倒序字符串
    NSString *reserseStr = [sArray componentsJoinedByString:@""];
    NSLog(@"%@", reserseStr);
    // 拆分单词数组，并倒序数组
    NSArray *reserseArr = [[[reserseStr componentsSeparatedByString:@" "] reverseObjectEnumerator] allObjects];
    NSLog(@"%@", reserseArr);
    // 空格拼接恢复字符串
    NSString *rlt = [reserseArr componentsJoinedByString:@" "];
    NSLog(@"%@", rlt);
    return rlt;
}
```
相对来说，Swift会大大简化语法：
```swift
class Solution {
    func reverseWords(_ s: String) -> String {
        let reverse = String(s.reversed())
        let array = reverse.split(separator: " ")
        let res = array.reversed().joined(separator: " ")
        return res
    }
}
```


## 20211101 双指针
1. MiddleNode
leet 876. 链表的中间结点

OC链表的简易实现
[OC实现一个简单的单链表](https://blog.csdn.net/Morris_/article/details/104439214)
2. RemoveNthFromEnd
leet 19. 删除链表的倒数第 N 个结点

## 20211102 滑动窗口
1. LengthOfLongestSubstring
leet 3. 无重复字符的最长子串

解题思路：
```objc
+ (NSInteger)lengthOfLongestSubstring:(NSString *)s
{
    NSMutableString *maxLengthStr = [NSMutableString string];
    NSMutableString *currentStr = [NSMutableString string];
    for (NSInteger i = 0; i < s.length; i ++) {
        NSString *charStr = [NSString stringWithFormat:@"%c", [s characterAtIndex:i]];
        while ([currentStr containsString:charStr]) {
            // 删除一个字符
            [currentStr deleteCharactersInRange:NSMakeRange(0, 1)];
        }
        [currentStr appendString:charStr];
        if (currentStr.length > maxLengthStr.length) {
            maxLengthStr = [currentStr mutableCopy]; // 这里必须是copy，否则后续逻辑会出错
        }
    }
    return maxLengthStr.length;
}
```
```swift
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxLengthStr = ""
        var currentStr = ""
        for char in s {
            while currentStr.contains(char) {
                //if let subRange = Range<String.Index>(NSRange(location: 0, length: 1), in: currentStr) { currentStr.removeSubrange(subRange) }
                currentStr.remove(at: currentStr.startIndex)
            }
            currentStr.append(char)
            if currentStr.length > maxLengthStr.length {
                maxLengthStr = currentStr
            }
        }
        return maxLengthStr.length
    }
}
```

2. CheckInclusion
leet 567. 字符串的排列
解题思路：
本质就是字符出现的频次map的匹配，因为map是无序的。
窗口长度就是s1的长度，s2会遍历s2-s1次，匹配到字符频次相同的map，就是结果。
也考虑了使用排序法，将s1固定排序，s2的窗口筛选出一个list后，依次排序匹配，但是超时了。
```objc
+ (BOOL)checkInclusion:(NSString *)s1 s2:(NSString *)s2
{
    if (s2.length < s1.length) {
        return NO;
    } else {
        // 计算窗口字符频次
        NSMutableDictionary <NSString *, NSNumber *>*dic1 = [NSMutableDictionary dictionary];
        for (NSInteger i = 0; i < s1.length; i ++) {
            NSString *charStr = [NSString stringWithFormat:@"%c", [s1 characterAtIndex:i]];
            NSInteger cur = [dic1[charStr] integerValue];
            dic1[charStr] = cur ? @(cur + 1) : @1;
        }
        NSLog(@"dic1 - %@", dic1);
        
        // 滑动窗口
        for (NSInteger i = 0; i <= (s2.length - s1.length); i ++) {
            NSInteger from = i;
//            NSInteger to = i + s1.length;
            NSString *temp = [s2 substringWithRange:NSMakeRange(from, s1.length)];
            NSLog(@"temp - %@", temp);
            // 窗口筛选频次
            NSMutableDictionary <NSString *, NSNumber *>*dic2 = [NSMutableDictionary dictionary];
            for (NSInteger j = 0; j < temp.length; j ++) {
                NSString *charStr = [NSString stringWithFormat:@"%c", [temp characterAtIndex:j]];
                NSInteger cur = [dic2[charStr] integerValue];
                dic2[charStr] = cur ? @(cur + 1) : @1;
            }
            NSLog(@"dic2 - %@", dic2);
            if ([dic1 isEqualToDictionary:dic2]) {
                return YES;
            }
        }
        return NO;
    }
}
```
```swift
class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s2.count < s1.count {
            return false
        } else {
            // 计算窗口字符频次
            var dic1: [Character: Int] = [:]
            for char in s1{
                dic1.updateValue((dic1[char] ?? 0) + 1, forKey: char)
            }
            
            let arr2 = Array(s2)
            
            for index in 0...(arr2.count - s1.count) {
                let from = index
                let to = index+s1.count
                let temp = arr2[from..<to]
                var dic2: [Character: Int] = [:]
                for tempChar in temp {
                    dic2.updateValue((dic2[tempChar] ?? 0) + 1, forKey: tempChar)
                }
                if dic2 == dic1 {
                    return true
                }
            }
            return false
        }
    }
}
```
