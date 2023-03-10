//
//  simple.swift
//  LeetCode-Tencent
//
//  Created by 程守斌 on 2023/2/28.
//

import Foundation

//MARK: - 292. Nim 游戏
/*
 你和你的朋友，两个人一起玩 Nim 游戏：

 桌子上有一堆石头。
 你们轮流进行自己的回合， 你作为先手 。
 每一回合，轮到的人拿掉 1 - 3 块石头。
 拿掉最后一块石头的人就是获胜者。
 假设你们每一步都是最优解。请编写一个函数，来判断你是否可以在给定石头数量为 n 的情况下赢得游戏。如果可以赢，返回 true；否则，返回 false 。

  

 示例 1：

 输入：n = 4
 输出：false
 解释：以下是可能的结果:
 1. 移除1颗石头。你的朋友移走了3块石头，包括最后一块。你的朋友赢了。
 2. 移除2个石子。你的朋友移走2块石头，包括最后一块。你的朋友赢了。
 3.你移走3颗石子。你的朋友移走了最后一块石头。你的朋友赢了。
 在所有结果中，你的朋友是赢家。
 示例 2：

 输入：n = 1
 输出：true
 示例 3：

 输入：n = 2
 输出：true

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/nim-game
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_292 {
    
    /// 将倒推简化
    /// 就是 4 的整倍数
    /// 时间复杂度 O(1)
    /// 空间复杂度 O(1)
    func canWinNim(_ n: Int) -> Bool {
        return n % 4 == 0 ? false : true
    }
    
    
    /// 倒推法
    /// 假设肯定能拿到最后一个 num
    /// 则必须要拿到 num - 4
    /// 依次倒推，如果 num - 4 落入先手优势区 [1,3]
    /// 则说明肯定能获胜
    /// 时间复杂的 O(n/4)
    /// 空间复杂度 O(1)
    func canWinNim11(_ n: Int) -> Bool {
        var num = n
        while num > 0 {
            if num >= 1 && num <= 3 {
                return true
            }
            num -= 4
        }
        return false
    }
    
}

//MARK: - 231. 2 的幂
/*
 给你一个整数 n，请你判断该整数是否是 2 的幂次方。如果是，返回 true ；否则，返回 false 。

 如果存在一个整数 x 使得 n == 2x ，则认为 n 是 2 的幂次方。

  

 示例 1：

 输入：n = 1
 输出：true
 解释：20 = 1
 示例 2：

 输入：n = 16
 输出：true
 解释：24 = 16
 示例 3：

 输入：n = 3
 输出：false
 示例 4：

 输入：n = 4
 输出：true
 示例 5：

 输入：n = 5
 输出：false
  

 提示：

 -231 <= n <= 231 - 1


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/power-of-two
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_231 {
    
    /// 数学法 + 计算机法
    /// 把乘除运算换成位移运算 >>>
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        if n == 1 {
            return true
        }
        var num = n
        while num > 1 {
            let newNum = num >> 1
            if num != newNum << 1 {
                return false
            }
            num = newNum
        }
        return true
    }
    
    
    /// 计算机法
    /// 1:000001 & 000000  = 0
    /// 2:000010 & 000001  = 0
    /// 4:000100 & 000011  = 0
    /// 时间复杂度 O(1)
    /// 空间复杂度 O(0)
    func isPowerOfTwo12(_ n: Int) -> Bool {
        if n <= 0 { return false }
        return n & (n - 1) == 0
    }
    
    /// 解题思路 数学法
    /// 2 的幂数肯定能被 2 整除
    /// 时间复杂度 O(log n)
    /// 空间复杂度 O(1)
    func isPowerOfTwo11(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        if n == 1 {
            return true
        }
        var num = n
        while num > 1 {
            if num == num / 2 * 2 {
                return false
            }
            num = num / 2
        }
        return true
    }
}

//MARK: - 217. 存在重复元素
/*
 给你一个整数数组 nums 。如果任一值在数组中出现 至少两次 ，返回 true ；如果数组中每个元素互不相同，返回 false 。
  

 示例 1：

 输入：nums = [1,2,3,1]
 输出：true
 示例 2：

 输入：nums = [1,2,3,4]
 输出：false
 示例 3：

 输入：nums = [1,1,1,3,3,4,3,2,4,2]
 输出：true
  

 提示：

 1 <= nums.length <= 105
 -109 <= nums[i] <= 109

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/contains-duplicate
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_217 {
    
    /// 解题思路：Set 集合法
    /// 如何 Set 的个数于数组的个数相同则 false，否则 true
    /// - 时间复杂度 O(n)
    /// - 空间复杂度 O(n)
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count != nums.count
    }
    
    /// 解题思路：hash 表
    /// - 时间复杂度 O(n)
    /// - 空间复杂度 O(n)
    func containsDuplicate11(_ nums: [Int]) -> Bool {
        var map:[Int:Int] = [:]
        for num in nums {
            if map[num] != nil {
                return true
            }
            map[num] = num
        }
        return false
    }
}

//MARK: - 206. 反转链表
/*
 给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
  
 示例 1：

 输入：head = [1,2,3,4,5]
 输出：[5,4,3,2,1]
 示例 2：

 输入：head = [1,2]
 输出：[2,1]
 示例 3：

 输入：head = []
 输出：[]

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/reverse-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_206 {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    /// 递归法
    /// 相等于把每一个节点的相连两个节点都放到方法栈中进行展开
    /// 当前方法栈只需要负责把后节点指针指向前节点，然后前节点指针设置为 nil
    /// 这里需要注意不能使用return 回来的newhead 节点做指向转变，以为return回来的是新的头节点只有一个
    /// - 时间复杂度为 O(n)
    /// - 空间复杂度为 O(n), 这里的n是节点个数，主要是开辟方法栈消耗的内存空间
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head, let next = head.next else {
            return head
        }
        let newHead = reverseList(next)
        /// 这里 newHead 是最后一个点，所以不能用 newHead?.next = head
        head.next?.next = head
        head.next = nil
        return newHead
    }
    
    /// 解题思路，while 循环遍历链表
    /// 取一个新进的 prev 用于每次前进一步
    /// 取一个 lastOne 用于记录上一个
    /// 取一个 newHead 记录最新的 head
    /// - 时间复杂度 O(n)
    /// - 空间复杂的 O(1)
    func reverseList11(_ head: ListNode?) -> ListNode? {
        var newHead = head
        var prev = head
        var lastOne: ListNode?
        while prev != nil {
            let currnet = prev
            let next = prev?.next
            currnet?.next = lastOne
            lastOne = currnet
            prev = next
            if prev != nil {
                newHead = prev
            }
        }
        return newHead
    }
    
    /// 数组创建链表
    /// - Parameters:
    ///   - nums: 数组
    ///   - pos: 环点的位置， -1 则无环
    /// - Returns: head
    func buildListWith(nums: [Int], pos: Int) -> ListNode? {
        if nums.isEmpty {
            return nil
        }
        let head: ListNode? = ListNode(0)
        var prev: ListNode? = head
        var posNode: ListNode?
        var buildCount = 0
        
        for num in nums {
            prev?.next = ListNode(num)
            if buildCount == pos {
                posNode = prev?.next
            }
            prev = prev?.next
            buildCount += 1
        }
        prev?.next = posNode
        return head?.next
    }
    
    func arrayWith(list head: ListNode?) -> [Int] {
        if head == nil {
            return []
        }
        var nums: [Int] = []
        var prev = head
        while prev != nil {
            nums.append(prev!.val)
            prev = prev?.next
        }
        return nums
    }
}


//MARK: - 557. 反转字符串中的单词 III
/*
 给定一个字符串 s ，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。

  

 示例 1：

 输入：s = "Let's take LeetCode contest"
 输出："s'teL ekat edoCteeL tsetnoc"
 示例 2:

 输入： s = "God Ding"
 输出："doG gniD"
  

 提示：

 1 <= s.length <= 5 * 104
 s 包含可打印的 ASCII 字符。
 s 不包含任何开头或结尾空格。
 s 里 至少 有一个词。
 s 中的所有单词都用一个空格隔开。

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/reverse-words-in-a-string-iii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_557 {
    
    /// 解题思路
    /// 将字符串转为字符数组
    /// 遍历字符数组，遇到 " " 就进行前面的字符倒序
    /// 到数组末尾时，再将前面的字符倒叙
    /// 最后把数组转为字符串返回
    /// - 时间复杂度 O(2n)
    /// - 空间复杂度 O(n), n为包含的字符个数
    func reverseWords(_ s: String) -> String {
        var charsArr = Array(s)
        var upIndex = 0
        for i in 0..<charsArr.count {
            let char = charsArr[i]
            if char == " " {
                for j in 0..<(i+1-upIndex)/2 {
                    charsArr.swapAt(upIndex+j, i-j-1)
                }
                upIndex = i+1 < charsArr.count ? i+1 : i
            } else if i == charsArr.count - 1 {
                for j in 0..<(i+1-upIndex)/2 {
                    charsArr.swapAt(upIndex+j, i-j)
                }
            }
        }
        return String(charsArr)
    }
    
    /// 解题思路2 (测试超时)
    /// 使用字符串替换的思路
    /// - 时间复杂度 O(2n)
    /// - 空间复杂度 O(n)
    func reverseWords12(_ s: String) -> String {
        var newStr = s
        var stack: [Substring] = []
        for i in 0..<newStr.count {
            let startIndex = newStr.index(newStr.startIndex, offsetBy: i)
            let endIndex = newStr.index(startIndex, offsetBy: 1)
            let range = startIndex..<endIndex
            let subStr = newStr[range]
            if subStr != " " {
                stack.append(subStr)
            } else {
                var start = startIndex
                var end = endIndex
                while !stack.isEmpty {
                    start = newStr.index(start, offsetBy: -1)
                    end = newStr.index(end, offsetBy: -1)
                    let range = start..<end
                    newStr.replaceSubrange(range, with: stack.remove(at: 0))
                }
            }
            print(subStr)
        }
        var start = newStr.endIndex
        while !stack.isEmpty {
            start = newStr.index(start, offsetBy: -1)
            let end = newStr.index(start, offsetBy: +1)
            let range = start..<end
            newStr.replaceSubrange(range, with: stack.remove(at: 0))
        }
        return newStr
    }
    
    /// 解题思路(首次实现)
    /// 先将字符串按空格切割为数组
    /// 在将数组中的每个字符串反转
    /// 将数组字符串按空格拼接成新的字符串
    /// 时间复杂度 O(2n)
    /// 空间复杂度 O(n)
    func reverseWords11(_ s: String) -> String {
        let strArr: [String] = s.components(separatedBy: " ")
        let newStrArr: [String] = strArr.map { String($0.reversed()) }
        var newStr = ""
        for i in 0..<newStrArr.count {
            newStr += newStrArr[i]
            if i != newStrArr.count-1 {
                newStr += " "
            }
        }
        return newStr
    }
}


//MARK: - 169. 多数元素
/*
 给定一个大小为 n 的数组 nums ，返回其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。

 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 示例 1：

 输入：nums = [3,2,3]
 输出：3
 示例 2：

 输入：nums = [2,2,1,1,1,2,2]
 输出：2
  

 提示：
 n == nums.length
 1 <= n <= 5 * 104
 -109 <= nums[i] <= 109
  

 进阶：尝试设计时间复杂度为 O(n)、空间复杂度为 O(1) 的算法解决此问题。

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/majority-element
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_169 {
    
    /// 审题很关键：{多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素}
    /// 因此只有拿最多的数与其他数碰撞抵消就好了
    /// - 时间复杂度 O(n)
    /// - 空间复杂度 O(1)
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0
        var candidate = 0
        for num in nums {
            if count == 0 {
                candidate = num
            }
            count += (num == candidate) ? 1 : -1
        }
        return candidate
    }
    
    
    /// 解题思路
    /// 先将数组排个序
    /// 然后遍历找出个数最多的数
    func majorityElement11(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        let sored = nums.sorted()
        var maxNum: Int = sored[0]
        var maxCount: Int = 0
        var currentNum: Int = sored[0]
        var currentCount: Int = 0
        for num in sored {
            if num == currentNum {
                currentCount += 1
            } else {
                currentNum = num
                currentCount = 1
            }
            if maxCount < currentCount {
                maxCount = currentCount
                maxNum = currentNum
            }
        }
        return maxNum
    }
}


//MARK: - 160. 相交链表
/*
 给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 null 。

 图示两个链表在节点 c1 开始相交：



 题目数据 保证 整个链式结构中不存在环。

 注意，函数返回结果后，链表必须 保持其原始结构 。

 自定义评测：

 评测系统 的输入如下（你设计的程序 不适用 此输入）：

 intersectVal - 相交的起始节点的值。如果不存在相交节点，这一值为 0
 listA - 第一个链表
 listB - 第二个链表
 skipA - 在 listA 中（从头节点开始）跳到交叉节点的节点数
 skipB - 在 listB 中（从头节点开始）跳到交叉节点的节点数
 评测系统将根据这些输入创建链式数据结构，并将两个头节点 headA 和 headB 传递给你的程序。如果程序能够正确返回相交节点，那么你的解决方案将被 视作正确答案 。

 示例 1：
 输入：intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
 输出：Intersected at '8'
 解释：相交节点的值为 8 （注意，如果两个链表相交则不能为 0）。
 从各自的表头开始算起，链表 A 为 [4,1,8,4,5]，链表 B 为 [5,6,1,8,4,5]。
 在 A 中，相交节点前有 2 个节点；在 B 中，相交节点前有 3 个节点。
 — 请注意相交节点的值不为 1，因为在链表 A 和链表 B 之中值为 1 的节点 (A 中第二个节点和 B 中第三个节点) 是不同的节点。换句话说，它们在内存中指向两个不同的位置，而链表 A 和链表 B 中值为 8 的节点 (A 中第三个节点，B 中第四个节点) 在内存中指向相同的位置。
  

 示例 2：
 输入：intersectVal = 2, listA = [1,9,1,2,4], listB = [3,2,4], skipA = 3, skipB = 1
 输出：Intersected at '2'
 解释：相交节点的值为 2 （注意，如果两个链表相交则不能为 0）。
 从各自的表头开始算起，链表 A 为 [1,9,1,2,4]，链表 B 为 [3,2,4]。
 在 A 中，相交节点前有 3 个节点；在 B 中，相交节点前有 1 个节点。
 
 示例 3：
 输入：intersectVal = 0, listA = [2,6,4], listB = [1,5], skipA = 3, skipB = 2
 输出：null
 解释：从各自的表头开始算起，链表 A 为 [2,6,4]，链表 B 为 [1,5]。
 由于这两个链表不相交，所以 intersectVal 必须为 0，而 skipA 和 skipB 可以是任意值。
 这两个链表不相交，因此返回 null 。
  

 提示：

 listA 中节点数目为 m
 listB 中节点数目为 n
 1 <= m, n <= 3 * 104
 1 <= Node.val <= 105
 0 <= skipA <= m
 0 <= skipB <= n
 如果 listA 和 listB 没有交点，intersectVal 为 0
 如果 listA 和 listB 有交点，intersectVal == listA[skipA] == listB[skipB]
  

 进阶：你能否设计一个时间复杂度 O(m + n) 、仅用 O(1) 内存的解决方案？

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/intersection-of-two-linked-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/// 扩展支持 hashable，才能在字典或Set集合中当 key 使用
extension ListNode : Hashable {
    public static func ==(lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self).hashValue)
    }
}

public class Solution_160 {
    
    
    /// 解题思路，hashMap 方法
    /// 先遍历链表 A，将每个节点当key存储于map中
    /// 再遍历链表 B，如果map中存在，则返回当前节点就是第一个公共节点
    /// 不存在，则结尾返回 nil
    /// - 时间复杂度为 O(n+m)
    /// - 空间复杂度为 O(n)
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var map: [ListNode:ListNode?] = [:]
        var prevA = headA
        var prevB = headB
        while let prev = prevA {
            map[prev] = prevA
            prevA = prevA?.next
        }
        while let prev = prevB {
            if map[prev] != nil {
                return prev
            }
            prevB = prevB?.next
        }
        return nil
    }
    
    
    /// 解题思路
    /// 把双链问题，以环的形式看待
    /// A 链到末尾，则跳到 B 链head位置继续
    /// B 链到末尾，则调到 A 链head位置继续
    /// 直到 A === B，则说明AB相交的交点为 A or B
    /// 如果没有交点，最终 A === B，A == nil， B === nil
    /// - 时间复杂度 O(N+M)
    /// - 空间复杂度 O(1)
    func getIntersectionNode2(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        if headA == nil || headB == nil {
            return nil
        }
        var prevA = headA
        var prevB = headB
        while prevA !== prevB {
            prevA = prevA == nil ? headB : prevA!.next
            prevB = prevB == nil ? headA : prevB!.next
        }
        return prevA
    }
    
    
    /// 解题思路: （性能比较慢）
    /// 遍历其中一条链表，把每个节点存入 map 。（ Swift 的 Dict 要求 key 必须实现 Hashable 协议，因此换成了数组）
    /// 再遍历另一条链表，每个节点比较 map 中是否存在
    /// 存在则为第一个共同节点，否则没有共同节点
    /// - 用数组时间复杂度就会高很多，时间复杂度为 O(n*m)
    /// - 空间复杂度为 O(n)
    func getIntersectionNode11(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        var quequ :[ListNode] = []
        var prevA = headA
        while prevA != nil {
            quequ.append(prevA!)
            prevA = prevA?.next
        }
        var prevB = headB
        while prevB != nil {
            if quequ.contains(where: { $0 === prevB }) {
                return prevB
            }
            prevB = prevB?.next
        }
        return nil
    }
    
    
}


//MARK: - 141. 环形链表
/*
 给你一个链表的头节点 head ，判断链表中是否有环。

 如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。注意：pos 不作为参数进行传递 。仅仅是为了标识链表的实际情况。

 如果链表中存在环 ，则返回 true 。 否则，返回 false 。

 示例 1：

 输入：head = [3,2,0,-4], pos = 1
 输出：true
 解释：链表中有一个环，其尾部连接到第二个节点。
 示例 2：



 输入：head = [1,2], pos = 0
 输出：true
 解释：链表中有一个环，其尾部连接到第一个节点。
 示例 3：



 输入：head = [1], pos = -1
 输出：false
 解释：链表中没有环。
  

 提示：

 链表中节点的数目范围是 [0, 104]
 -105 <= Node.val <= 105
 pos 为 -1 或者链表中的一个 有效索引 。
  

 进阶：你能用 O(1)（即，常量）内存解决此问题吗？

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/linked-list-cycle
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class Solution_141 {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    /// 解题思路：快慢指针
    /// 双指针相遇则说明有环
    /// 时间复杂度 O(n)
    /// 空间复杂度 O(1)
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil {
            return false
        }
        var man = head
        var kuai = head?.next
        
        while man != nil && kuai != nil {
            if man === kuai {
                return true
            }
            man = man?.next
            kuai = kuai?.next?.next
        }
        return false
    }
    
    
    /// 创建链表
    func buildListWith(nums: [Int], pos: Int) -> ListNode? {
        if nums.isEmpty {
            return nil
        }
        let head: ListNode? = ListNode(0)
        var prev: ListNode? = head
        var posNode: ListNode?
        var buildCount = 0
        
        for num in nums {
            prev?.next = ListNode(num)
            if buildCount == pos {
                posNode = prev?.next
            }
            prev = prev?.next
            buildCount += 1
        }
        prev?.next = posNode
        return head?.next
    }
}


//MARK: - 136. 只出现一次的数字
/*
 给你一个 非空 整数数组 nums ，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

 你必须设计并实现线性时间复杂度的算法来解决此问题，且该算法只使用常量额外空间。

  

 示例 1 ：

 输入：nums = [2,2,1]
 输出：1
 示例 2 ：

 输入：nums = [4,1,2,1,2]
 输出：4
 示例 3 ：

 输入：nums = [1]
 输出：1
  

 提示：

 1 <= nums.length <= 3 * 104
 -3 * 104 <= nums[i] <= 3 * 104
 除了某个元素只出现一次以外，其余每个元素均出现两次。

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/single-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_136 {
    /// 解题思路：亦或法
    /// 亦或同一个数两次，则原数不变
    /// 时间复杂度 O(n)
    /// 空间复杂度 O(1)
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
}


//MARK: - 121. 买卖股票的最佳时机
/*
 给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。

  
 示例 1：

 输入：[7,1,5,3,6,4]
 输出：5
 解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
 示例 2：

 输入：prices = [7,6,4,3,1]
 输出：0
 解释：在这种情况下, 没有交易完成, 所以最大利润为 0。
  

 提示：

 1 <= prices.length <= 105
 0 <= prices[i] <= 104

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/best-time-to-buy-and-sell-stock
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_121 {
    
    /// 解题思路：遍历取差
    /// - 时间复杂度 O(n)
    /// - 空间复杂度 O(1)
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        var min_p = prices[0], res = 0
        for price in prices {
            if price == min_p {
                continue
            }
            if price < min_p {
                min_p = price
            }
            res = max(price-min_p, res)
        }
        return res
    }
    
    /// 解题思路：动态分布算法 （LeetCode 测试超时）
    /// 记录每一天都买入的最大收益
    /// 最后遍历最大收益数组取最大值
    /// 时间复杂度 O(n^2)
    /// 空间复杂度 O(n)
    func maxProfit11(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        var maxArray: [Int] = Array(repeating: 0, count: prices.count)
        for i in 0..<prices.count {
            for j in i+1..<prices.count {
                maxArray[i] = max(maxArray[i], prices[j]-prices[i])
            }
        }
        guard let max = maxArray.max(), max > 0 else {
            return 0
        }
        return max
    }
}

//MARK: - 104. 二叉树的最大深度
/*
 给定一个二叉树，找出其最大深度。

 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

 说明: 叶子节点是指没有子节点的节点。

 示例：
 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。


 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/maximum-depth-of-binary-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

public class Solution_104 {
    
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
    
    /// 解题思路：广度优先搜索 BFS（Breadth First Search）
    /// - 时间复杂度为 O(n)
    /// - 空间复杂度为 O(w)，其中 W为二叉树的最大宽度，即某一层节点数的最大值
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue = [root]
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            let size = queue.count
            for _ in 0..<size {
                let node = queue.remove(at: 0)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        return depth
    }
    
    /// 解题思路:   深度优先搜索 DFS (Depth First Search)
    /// 使用递归求解，取左树和右数深度的最大值加上当前层 1
    /// node 为空则 return 0
    /// - 时间复杂度 O(n)，n为二叉树的节点数
    /// - 空间复杂度 O(height), height 表示二叉树的高度，递归函数需要栈空间。
    func maxDepth2(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
    }
    
    /// 数组转树
    /// 特点是，左节点永远指向 2*i + 1， 有节点指向 2*i+2
    /// 遍历完数组就可以生成树
    func createTreeWith(array: [Int?]) -> TreeNode? {
        if array.first == nil {
            return nil
        }
        let nodes = array.map { n in
            if let num = n {
                return Optional(TreeNode(num))
            } else {
                return nil
            }
        }
        
        for i in 0..<nodes.count {
            if let node = nodes[i] {
                let leftIndex = 2*i + 1
                let rightIndex = 2*i + 2
                if leftIndex < nodes.count {
                    node.left = nodes[leftIndex]
                }
                if rightIndex < nodes.count {
                    node.right = nodes[rightIndex]
                }
            }
        }
        return nodes[0]
    }
}

//MARK: - 88. 合并两个有序数组
/*
 给你两个按 非递减顺序 排列的整数数组 nums1 和 nums2，另有两个整数 m 和 n ，分别表示 nums1 和 nums2 中的元素数目。

 请你 合并 nums2 到 nums1 中，使合并后的数组同样按 非递减顺序 排列。

 注意：最终，合并后数组不应由函数返回，而是存储在数组 nums1 中。为了应对这种情况，nums1 的初始长度为 m + n，其中前 m 个元素表示应合并的元素，后 n 个元素为 0 ，应忽略。nums2 的长度为 n 。

  

 示例 1：

 输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 输出：[1,2,2,3,5,6]
 解释：需要合并 [1,2,3] 和 [2,5,6] 。
 合并结果是 [1,2,2,3,5,6] ，其中斜体加粗标注的为 nums1 中的元素。
 示例 2：

 输入：nums1 = [1], m = 1, nums2 = [], n = 0
 输出：[1]
 解释：需要合并 [1] 和 [] 。
 合并结果是 [1] 。
 示例 3：

 输入：nums1 = [0], m = 0, nums2 = [1], n = 1
 输出：[1]
 解释：需要合并的数组是 [] 和 [1] 。
 合并结果是 [1] 。
 注意，因为 m = 0 ，所以 nums1 中没有元素。nums1 中仅存的 0 仅仅是为了确保合并结果可以顺利存放到 nums1 中。
  

 提示：

 nums1.length == m + n
 nums2.length == n
 0 <= m, n <= 200
 1 <= m + n <= 200
 -109 <= nums1[i], nums2[j] <= 109
  

 进阶：你可以设计实现一个时间复杂度为 O(m + n) 的算法解决此问题吗？

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/merge-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_88 {
    
    /// 使用Swift 语法特性方案：从高位到低位
    /// - 时间复杂度 O(m+n)
    /// - 空间复杂度 O(1)
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var n1 = m - 1
        var n2 = n - 1
        for i in stride(from: (m + n - 1), through: 0, by: -1) where n2 >= 0 {
            if n2 < 0 {
                break
            }
            if n1 < 0 {
                nums1[i] = nums2[n2]
                n2 -= 1
            } else {
                if nums1[n1] >= nums2[n2] {
                    nums1[i] = nums1[n1]
                    n1 -= 1
                } else {
                    nums1[i] = nums2[n2]
                    n2 -= 1
                }
            }
        }
    }
    
    /// 最佳方案：从高位到低位，不需要开辟缓冲区
    /// - 时间复杂度 O(m+n)
    /// - 空间复杂度 O(1)
    func merge12(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if n <= 0 || nums2.count <= 0 {
            return
        }
        var n1 = m-1
        var n2 = n-1
        var index = nums1.count - 1
        while index >= 0 {
            if n1 < 0 {
                nums1[index] = nums2[n2]
                n2 -= 1
                index -= 1
            } else if n2 < 0 {
                nums1[index] = nums1[n1]
                n1 -= 1
                index -= 1
            } else if nums1[n1] >= nums2[n2] {
                nums1[index] = nums1[n1]
                n1 -= 1
                index -= 1
            } else {
                nums1[index] = nums2[n2]
                n2 -= 1
                index -= 1
            }
        }
    }
    
    
    /// 自己实现一遍：
    /// 解题思路： 从低位到高位遍历，需要缓存区
    /// nums1 挨个遍历去和 nums2，比较
    /// 把比 nums2 大的数先放到tmp缓存区，tmp缓存区可以改成 nums1 的末尾，这样可以减少空间复杂度
    /// 这份程序分为四段，第一段为从 0 遍历到 m
    /// 第二段为 nums2 遍历到末尾
    /// 第三段为遍历缓冲区中剩余内容
    /// - 时间复杂度为 O(m+n)
    /// - 空间复杂度为 O(m)
    func merge11(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if n <= 0 || nums2.count <= 0 {
            return
        }
        var n1 = 0
        var n2 = 0
        var tmpArr: [Int] = []
        while n1 < nums1.count && n1 < m && n2 < nums2.count {
            if !tmpArr.isEmpty {
                if tmpArr[0] <= nums2[n2] {
                    tmpArr.append(nums1[n1])
                    nums1[n1] = tmpArr.remove(at: 0)
                    n1 += 1
                } else {
                    tmpArr.append(nums1[n1])
                    nums1[n1] = nums2[n2]
                    n1 += 1
                    n2 += 1
                }
            } else if nums1[n1] <= nums2[n2] {
                n1 += 1
            } else {
                tmpArr.append(nums1[n1])
                nums1[n1] = nums2[n2]
                n1 += 1
                n2 += 1
            }
        }
        
        while n1 < nums1.count && n2 < nums2.count {
            if !tmpArr.isEmpty {
                if tmpArr[0] <= nums2[n2] {
                    nums1[n1] = tmpArr.remove(at: 0)
                    n1 += 1
                } else {
                    nums1[n1] = nums2[n2]
                    n2 += 1
                    n1 += 1
                }
            } else {
                nums1[n1] = nums2[n2]
                n1 += 1
                n2 += 1
            }
        }
        
        while n1 < nums1.count && n1 < m && !tmpArr.isEmpty {
            if nums1[n1] <= tmpArr[0] {
                n1 += 1
            } else {
                tmpArr.append(nums1[n1])
                nums1[n1] = tmpArr.remove(at: 0)
                n1 += 1
            }
        }
        
        while n1 < nums1.count && !tmpArr.isEmpty {
            nums1[n1] = tmpArr.remove(at: 0)
            n1 += 1
        }
           
    }
}


//MARK: - 70. 爬楼梯
/*
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 示例 1：
 n = 1
 1
 
 输入：n = 2
 输出：2
 解释：有两种方法可以爬到楼顶。
 1. 1 阶 + 1 阶
 2. 2 阶
 
 示例 2：
 输入：n = 3
 输出：3
 解释：有三种方法可以爬到楼顶。
 1. 1 阶 + 1 阶 + 1 阶
 2. 1 阶 + 2 阶
 3. 2 阶 + 1 阶
 
 输入：n = 4
 输出：5
 解释：有三种方法可以爬到楼顶。
 1. 1 阶 + 1 阶 + 1 阶 + 1 阶
 2. 1 阶 + 1 阶 + 2 阶
 3. 1 阶 + 2 阶 + 1 阶
 4. 2 阶 + 1 阶 + 1 阶
 5. 2 阶 + 2 阶
 
 输入：n = 5
 输出：8
 解释：有三种方法可以爬到楼顶。
 1. 1 阶 + 1 阶 + 1 阶 + 1 阶  + 1 阶
 2. 1 阶 + 1 阶 + 1 阶 + 2 阶
 3. 1 阶 + 1 阶 + 2 阶 + 1 阶
 4. 1 阶 + 2 阶 + 1 阶 + 1 阶
 5. 2 阶 + 1 阶 + 1 阶 + 1 阶
 6. 2 阶 + 2 阶 + 1 阶
 7. 2 阶 + 1 阶 + 2 阶
 8. 1 阶 + 2 阶 + 2 阶
 
 输入：n = 6
 输出：5
 解释：有三种方法可以爬到楼顶。
 1. 1 阶 + 1 阶 + 1 阶 + 1 阶  + 1 阶  + 1 阶
 2. 1 阶 + 1 阶 + 1 阶 + 1 阶 + 2 阶
 3. 1 阶 + 1 阶 + 1 阶 + 2 阶 + 1 阶
 4. 1 阶 + 1 阶 + 2 阶 + 1 阶 + 1 阶
 5. 1 阶 + 2 阶 + 1 阶 + 1 阶 + 1 阶
 6. 2 阶 + 1 阶 + 1 阶 + 1 阶 + 1 阶
 7. 2 阶 + 1 阶 + 2 阶 + 1 阶
 8. 1 阶 + 2 阶 + 2 阶 + 1 阶

 提示：

 1 <= n <= 45

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_70 {
    
    
    /// 累加法
    /// - 时间复杂度 O(n)
    /// - 空间复杂度 O(1)
    func climbStairs(_ n: Int) -> Int {
        var p = 0, q = 0, r = 1
        for _ in 0..<n {
            p = q
            q = r
            r = p + q
        }
        return r
    }
    
    /// 自己实现：累加法
    /// - 时间复杂度 O(n)
    /// - 空间复杂度 O(1)
    func climbStairs11(_ n: Int) -> Int {
        var total = 0
        var n1 = 0
        var n2 = 0
        for i in 1...n {
            if i == 1 {
                n1 = 1
                total = n1
            } else if i == 2 {
                n2 = 2
                total = n2
            } else {
                total = n1 + n2
                let temp = n1
                n1 = n2
                n2 = temp + n1
            }
        }
        return total
    }
    
    
    ///  递归法 (性能非常差)
    ///  因为爬 n 阶的方法数 f(n) = f(n-1) + f(n-2)
    ///  递归累加就可以得到总方法数
    ///  - 时间复杂度 O(2^n)
    ///  - 空间复杂度 O(2^n)
    func climbStairs1(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        return climbStairs1(n-1) + climbStairs1(n-2)
    }
}


//MARK: - 21. 合并两个有序链表
/*
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例 1：
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 
 示例 2：
 输入：l1 = [], l2 = []
 输出：[]
 示例 3：

 输入：l1 = [], l2 = [0]
 输出：[0]
  

 提示：

 两个链表的节点数目范围是 [0, 50]
 -100 <= Node.val <= 100
 l1 和 l2 均按 非递减顺序 排列

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
public class Solution_21 {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
        public init(_ val: Int, _ next: ListNode?) {
            self.val = val
            self.next = next
        }
    }
    
    /// 合并链表 （while）
    /// 时间复杂度 O(m+n)
    /// 空间复杂度 O(1)
    /// 没有开辟更多空间，比递归实现快了很多
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        var n1 = list1, n2 = list2
        let head = ListNode(0)
        var pre: ListNode? = head
        while n1 != nil && n2 != nil {
            if n1!.val > n2!.val {
                pre?.next = n2
                n2 = n2?.next
            } else {
                pre?.next = n1
                n1 = n1?.next
            }
            pre = pre?.next
        }
        
        pre?.next = n1 != nil ? n1 : n2
        
        return head.next
    }
    
    
    /// 合并链表 (递归实现)
    /// 没想到合并有序链表可以用递归这么简单
    /// 时间复杂度 O(m+n)
    /// 空间复杂度 O(m+n)，函数栈
    func mergeTwoLists2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        if list1!.val < list2!.val {
            list1!.next = mergeTwoLists(list1!.next, list2)
            return list1
        } else {
            list2!.next = mergeTwoLists(list1, list2!.next)
            return list2
        }
    }
    
    
    
    /// 数组转链表
    func arrayToList(_ array: [Int]) -> ListNode? {
        guard array.count > 0 else {
            return nil
        }
        var head: ListNode?
        for i in (0..<array.count).reversed() {
            if head == nil {
                head = ListNode(array[i])
            } else {
                let tmp = ListNode(array[i])
                tmp.next = head
                head = tmp
            }
        }
        return head
    }
    /// 链表转数组
    
    func listToArray(_ list: ListNode?) -> [Int] {
        guard list != nil else {
            return []
        }
        var head: ListNode? = list
        var arr: [Int] = []
        while let tmp = head {
            arr.append(tmp.val)
            head = head?.next
        }
        return arr
    }
}


//MARK: - 20. 有效的括号
/*
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 每个右括号都有一个对应的相同类型的左括号。
  

 示例 1：

 输入：s = "()"
 输出：true
 示例 2：

 输入：s = "()[]{}"
 输出：true
 示例 3：

 输入：s = "(]"
 输出：false

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/valid-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_20 {
    
    /// 自己实现
    /// 解题思路
    /// - 使用 map ，成对匹配好对应关系
    /// - 在结合使用栈先进后出的方式匹配，如果是左括号就压栈，如果是右括号，则看栈顶是否是对应的左括号，是则出栈，否则压栈
    /// - 最后如果栈是空的，说明字符串中全部的括号都是匹配的，否则就是不匹配的
    /// - 时间复杂度为 O(n)
    /// - 空间复杂度为 O(n)
    func isValid(_ s: String) -> Bool {
        if s.count < 1 || s.count % 2 != 0 {
            return false
        }
        let map:[String:String] = [")":"(", "]":"[", "}": "{"]
        var stack: [String] = []
        let sArray: [String] = s.map { String($0) }
        for char in sArray {
            if let left = map[char] {
                if stack.last == left {
                    let _ = stack.popLast()
                } else {
                    stack.append(char)
                }
            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}


//MARK: - 14. 最长公共前缀
/*
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。

  

 示例 1：

 输入：strs = ["flower","flow","flight"]
 输出："fl"
 示例 2：

 输入：strs = ["dog","racecar","car"]
 输出：""
 解释：输入不存在公共前缀。
  

 提示：

 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] 仅由小写英文字母组成

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/longest-common-prefix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_14 {
    
    /// 自己实现
    /// 取出字符数最短的字符串
    /// 每次减少一位遍历该字符串长度，去对比其他字符串
    /// 时间复杂度 O (n * min(length))，实际复杂度会小于这个值
    /// 空间复杂度 O(1)
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        if strs.count == 1 {
            return strs[0]
        }
        let shortStr: String! = strs.min { str1, str2 in
            str1.count < str2.count
        }
                
        var offset = shortStr.count
        var resultStr = ""
    flag: while offset > 0 {
            let compareStr = shortStr[shortStr.startIndex ..< shortStr.index(shortStr.startIndex, offsetBy: offset)]
            for str in strs {
                if !str.hasPrefix(compareStr) {
                    offset -= 1
                    continue flag
                }
            }
            resultStr = String(compareStr)
            break
        }
        return resultStr
    }
}

//MARK: - 9.回文数
/*
 给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。

 回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 例如，121 是回文，而 123 不是。
  

 示例 1：

 输入：x = 121
 输出：true
 示例 2：

 输入：x = -121
 输出：false
 解释：从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 示例 3：

 输入：x = 10
 输出：false
 解释：从右向左读, 为 01 。因此它不是一个回文数。
  

 提示：

 -231 <= x <= 231 - 1
  

 进阶：你能不将整数转为字符串来解决这个问题吗？

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/palindrome-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_9 {
    /// 最优解
    /// - 仅反转整数小的那一半
    /// - 剩余整数大的那一半 进行比较
    /// - 如果大半等于小半相等或者小半/10，则是回文串
    /// 时间复杂度 O(log n)
    /// 空间复杂度 O(1)
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var num = x
        var reversedNumber = 0
        while (num > reversedNumber) {
            reversedNumber = reversedNumber * 10 + num % 10
            num /= 10
        }
        return num == reversedNumber || num == reversedNumber / 10
    }
    
    /// 自己实现
    /// - % 10 取出每一位数存于数组中
    /// - 再用双指针头尾遍历获得
    /// - 时间复杂度 O(n) ，空间复杂度 O(ln)
    func isPalindrome12(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var stack: [Int] = []
        var num = x
        repeat {
            stack.append(num % 10)
            num /= 10
        } while num > 0
        
        var l = 0
        var r = stack.count - 1
        while l < r {
            if stack[l] != stack[r] {
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }
    
    /// 自己实现
    /// - 将 Int 型转换成 String
    /// - 用字符串自带方法 reversed() 反转字符串
    /// - 再用反转的字符串与原字符串比较
    func isPalindrome_11(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        let string = String(x)
        let reversed = String(string.reversed())
        return string == reversed
    }
}
