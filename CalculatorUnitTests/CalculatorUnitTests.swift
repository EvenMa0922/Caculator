import XCTest
@testable import Calculator

class CalculatorUnitTests: XCTestCase {
    var brain = CalculatorBrain()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEOperation() {
        brain.performOperation("𝗲")
        XCTAssertEqual(brain.result, M_E)
    }
    
    func testPiOperation() {
        brain.performOperation("𝛑")
        XCTAssertEqual(brain.result, Double.pi)
    }
    
    func testSquareRootOperation() {
        brain.setOperand(16.0)
        brain.performOperation("√")
        XCTAssertEqual(brain.result, 4.0)
    }
    
    func testSquareOperation() {
        brain.setOperand(7.0)
        brain.performOperation("x^2")
        XCTAssertEqual(brain.result, 49.0)
    }
    
    func testSinOperation() {
        brain.setOperand(1.0)
        brain.performOperation("sin")
        XCTAssertEqual(brain.result, sin(1.0))
    }
    
    func testCosOperation() {
        brain.setOperand(0.0)
        brain.performOperation("cos")
        XCTAssertEqual(brain.result, 1.0)
    }
    
    func testAddtionOperation() {
        brain.setOperand(2.5)
        brain.performOperation("+")
        brain.setOperand(1.5)
        brain.performOperation("=")
        XCTAssertEqual(brain.result, 4.0)
    }
    
    func testSubtractionOperation() {
        brain.setOperand(2.5)
        brain.performOperation("−")
        brain.setOperand(1.5)
        brain.performOperation("=")
        XCTAssertEqual(brain.result, 1.0)
    }
    
    func testMultiplicationOperation() {
        brain.setOperand(2.5)
        brain.performOperation("×")
        brain.setOperand(1.5)
        brain.performOperation("=")
        XCTAssertEqual(brain.result, 3.75)
    }
    
    func testDivisionOperation() {
        brain.setOperand(2.5)
        brain.performOperation("÷")
        brain.setOperand(2.0)
        brain.performOperation("=")
        XCTAssertEqual(brain.result, 1.25)
    }
    
    func testPowerOperation() {
        brain.setOperand(2.5)
        brain.performOperation("x^n")
        brain.setOperand(3.0)
        brain.performOperation("=")
        XCTAssertEqual(brain.result, 15.625)
    }
}
