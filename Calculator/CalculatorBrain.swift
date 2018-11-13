import Foundation

class CalculatorBrain {
    private struct PendingBinaryOperation {
        let firstOperand: Double
        let function: (Double, Double) -> Double
        
        func perform(secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double,Double) -> Double)
        case equals
    }
    
    private var currentPendingBinaryOperation: PendingBinaryOperation?
    
    var operations: [String: Operation] = [
        "𝛑": Operation.constant(Double.pi),
        "𝗲": Operation.constant(M_E),
        "x^2": Operation.unaryOperation({return $0 * $0}),
        "√": Operation.unaryOperation(sqrt),
        "cos": Operation.unaryOperation(cos),
        "sin": Operation.unaryOperation(sin),
        "+": Operation.binaryOperation({return $0 + $1}),
        "−": Operation.binaryOperation({return $0 - $1}),
        "×": Operation.binaryOperation({return $0 * $1}),
        "÷": Operation.binaryOperation({return $0 / $1}),
        "x^n": Operation.binaryOperation({return pow($0, $1)}),
        "=": Operation.equals
    ]
    
    var accumulator: Double?
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
    func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    func reset() {
        accumulator = 0
        currentPendingBinaryOperation = nil
    }
    
    func performBinaryOperation() {
        if let _ = currentPendingBinaryOperation, let secondOperand = accumulator {
            accumulator = currentPendingBinaryOperation?.perform(secondOperand: secondOperand)
        }
    }
    
    func performOperation(_ mathematicalSymbol: String) {
        if let operation = operations[mathematicalSymbol] {
            switch operation {
            case Operation.constant(let value):
                accumulator = value
            case Operation.unaryOperation(let function):
                if let value = accumulator {
                    accumulator = function(value)
                }
            case Operation.binaryOperation(let function):
                if let firstOperand = accumulator {
                    currentPendingBinaryOperation = PendingBinaryOperation(firstOperand: firstOperand, function: function)
                    accumulator = nil
                }
            case Operation.equals:
                performBinaryOperation()
                currentPendingBinaryOperation = nil
            }
        }
    }
}
