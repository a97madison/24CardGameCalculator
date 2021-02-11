//
//  CalculateSolutions.swift
//  24Calculator
//
//  Created by The Madisons on 2021-02-10.
//

class CalculateSolutions {
    var nums: [Double] = []
    var target: Double = 0
    var res: [String] = []
    var usedPermutations: [[Double]] = []
    var path: [Double] = []
    var visited: [Bool] = []
    
    func findSolutions(n1: Double, n2: Double, n3: Double, n4: Double, target: Int) -> [String] {
        nums = [n1,n2,n3,n4]
        self.target = Double(target)
        res = []
        usedPermutations = []
        path = []
        visited = [Bool](repeating: false, count: nums.count)
        
        permutationDfs()//nums: nums, path: path, visited: visited, res: res, usedPermutations: usedPermutations, target: target)
        
        return res
    }
    
    // MARK: permutationDfs
    func permutationDfs() {//nums: [Int], path: [Int], visited: [Bool], res: [String], usedPermutations: [String], target: Int) {
        let len = nums.count
        if (path.count == len && !usedPermutations.contains(path)) {
            evaluateOperationsForPermutations(permutation: path)
            usedPermutations.append(path)
            return
        }
        
        // 4! = 24 permutations (at most) if all 24 permutations are unique
        for i in 0..<len {
            if (visited[i]) {continue}
            path.append(nums[i])
            visited[i] = true
            permutationDfs()
            path.popLast()
            visited[i] = false
        }
    }
    
    // MARK: evaluateOperationsForPermutations
    func evaluateOperationsForPermutations(permutation: [Double]) {//path: [Int], res: [String], target: target) {
        var expression = [permutation[0], "", permutation[1], "", permutation[2], "", permutation[3]] as [Any]
        let ops = ["+","-","*","/"]
        let len = ops.count
        
        // 4^3 = 64 possible combinations
        for i in 0..<len {
            expression[1] = ops[i]
            for j in 0..<len {
                expression[3] = ops[j]
                for k in 0..<len {
                    expression[5] = ops[k]
                    
                    evaluateEachBracketOptionForOperation(exp: expression)
                }
            }
        }
    }
    
    // MARK: evaluateEachBracketOptionForOperation
    func evaluateEachBracketOptionForOperation(exp: [Any]) {
        // evaluate all bracket possibililities that make unique expressions
        var expressions = [exp]
        let operation1 = exp[1] as! String
        let operation2 = exp[3] as! String
        let operation3 = exp[5] as! String
        
        if ((operation2 == "*" || operation2 == "/") &&
            (operation1 == "+" || operation1 == "-" || operation3 == "+" || operation3 == "-")) {
            let expression = [[exp[0],operation1,exp[2]], operation2, [exp[4],operation3,exp[6]]] as [Any]
            expressions.append(expression)
        }
        
        if ((operation1 == "+" || operation1 == "-") &&
            (operation2 == "*" || operation2 == "/")) {
            let expression = [[exp[0],operation1,exp[2]], operation2, exp[4], operation3, exp[6]]
            expressions.append(expression)
        }
        
        if ((operation3 == "*" || operation3 == "/") &&
            (operation1 == "+" || operation1 == "-" || operation2 == "+" || operation2 == "-")) {
            let expression = [[exp[0],operation1,exp[2],operation2,exp[4]], operation3, exp[6]]
            expressions.append(expression)
        }
        
        if (operation1 == "*" || operation1 == "/") {
            let expression = [exp[0], operation1, [exp[2],operation2,exp[4],operation3,exp[6]]]
            expressions.append(expression)
        }
        
        if ((operation3 == "+" || operation3 == "-") &&
            (operation2 == "*" || operation2 == "/")) {
            let expression = [exp[0], operation1, exp[2], operation2, [exp[4],operation3,exp[6]]]
            expressions.append(expression)
        }
        
        if ((operation1 == "+" || operation1 == "-") &&
            (operation2 == "*" || operation2 == "/") || operation3 == "*" || operation3 == "/") {
            let expression = [[[exp[0],operation1,exp[2]], operation2, exp[4]], operation3, exp[6]]
            expressions.append(expression)
        }
        
        if ((operation2 == "+" || operation2 == "-") &&
            (operation1 == "*" || operation1 == "/") || operation3 == "*" || operation3 == "/") {
            let expression1 = [exp[0], operation1, [exp[2],operation2,exp[4]], operation3, exp[6]]
            let expression2 = [[exp[0], operation1, [exp[2],operation2,exp[4]]], operation3, exp[6]]
            let expression3 = [exp[0], operation1, [[exp[2],operation2,exp[4]], operation3, exp[6]]]
            expressions.append(expression1)
            expressions.append(expression2)
            expressions.append(expression3)
        }
        
        if ((operation3 == "+" || operation3 == "-") &&
            (operation1 == "*" || operation1 == "/" || operation2 == "*" || operation2 == "/")) {
            let expression = [exp[0], operation1, [exp[2], operation2, [exp[4],operation3,exp[6]]]]
            expressions.append(expression)
        }
        
        evaluateAllExpressions(expressions: expressions)
    }
    
    // MARK: evaluateAllExpressions
    func evaluateAllExpressions(expressions: [[Any]]) {
        let len = expressions.count
        
        for i in 0..<len {
            let exp = expressions[i]
            
            let targetResult = evaluateBracketedExpression(expression: exp)
            if (targetResult == target) {
                let str = stringifyExpression(expression: exp)
                res.append(str)
            }
        }
    }
    
    // MARK: stringifyExpression
    func stringifyExpression(expression: [Any]) -> String {
        let len = expression.count
        var exp = expression
        
        for i in 0..<len {
            let element = expression[i]
            if (type(of: element) == type(of: [Any]())) {
                let substr = stringifyExpression(expression: element as! [Any])
                exp[i] = substr
            }
        }
        
        return stringifySimpleExpression(expression: exp)
    }
    
    // MARK: stringifySimpleExpression
    func stringifySimpleExpression(expression: [Any]) -> String {
        var str = "("
        let len = expression.count
        
        for i in 0..<len {
            if (type(of: expression[i]) == type(of: "")) {
                let str2: String = expression[i] as! String
                str = str + " " + str2 + " "
            } else {
                let num: Double? = expression[i] as? Double
                str = str + " " + String(Int(num!)) + " "
            }
        }
        
        str = str + ")"
        return str
    }
    
    // MARK: evaluateBracketedExpression
    func evaluateBracketedExpression(expression: [Any]) -> Double? {
        let len = expression.count
        var exp = expression
        
        for i in 0..<len {
            let element = expression[i]
            if (type(of: element) == type(of: [Any]())) {
                let value = evaluateBracketedExpression(expression: element as! [Any])
                if (value == nil) {return nil}
                exp[i] = value!
            }
        }
        
        return evaluateSimpleBracketedExpression(expression: exp)
    }
    
    // MARK: evaluateSimpleBracketedExpression
    func evaluateSimpleBracketedExpression(expression: [Any]) -> Double? {
        var performAddSubtract = false
        var signIndex = 1
        var temp: Double = 0
        var exp = expression
        
        while (exp.count > 1) {
            let sign = exp[signIndex] as! String
            let d1 = exp[signIndex-1] as? Double
            let d2 = exp[signIndex+1] as? Double
            
            if (d1 == nil || d2 == nil) {return nil}
            
            if (sign == "*" || sign == "/") {
                // perferm multiplication / division operations
                if (sign == "*") {
                    temp = d1! * d2!
                } else { // sign equals "/"
                    if (d2 == 0) {return nil}
                    temp = d1! / d2!
                }
                exp.remove(at: signIndex)
                exp.remove(at: signIndex)
                exp.remove(at: signIndex-1)
                exp.insert(temp, at: signIndex-1)
//                exp[signIndex-1] = temp
            } else if (!performAddSubtract) {
                signIndex = signIndex + 2
            } else {
                // perform addition / subtraction operations
                if (sign == "+") {
                    temp = d1! + d2!
                    
                } else { // sigm equals "-"
                    temp = d1! - d2!
                }
                exp.remove(at: signIndex)
                exp.remove(at: signIndex)
                exp.remove(at: signIndex-1)
                exp.insert(temp, at: signIndex-1)
            }
            
            if (signIndex >= exp.count) {
                  performAddSubtract = true
                  signIndex = 1
            }
        }
        
        return exp[0] as? Double
    }
}
