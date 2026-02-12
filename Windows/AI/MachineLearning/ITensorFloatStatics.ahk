#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TensorFloat.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ITensorFloatStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITensorFloatStatics
     * @type {Guid}
     */
    static IID => Guid("{dbcd395b-3ba3-452f-b10d-3c135e573fa9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "Create2", "CreateFromArray", "CreateFromIterable"]

    /**
     * Create Extended Stored Procedures
     * @returns {TensorFloat} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorFloat(result_)
    }

    /**
     * Create Extended Stored Procedures
     * @param {IIterable<Integer>} shape_ 
     * @returns {TensorFloat} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create2(shape_) {
        result := ComCall(7, this, "ptr", shape_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorFloat(result_)
    }

    /**
     * 
     * @param {IIterable<Integer>} shape_ 
     * @param {Integer} data_length 
     * @param {Pointer<Float>} data 
     * @returns {TensorFloat} 
     */
    CreateFromArray(shape_, data_length, data) {
        dataMarshal := data is VarRef ? "float*" : "ptr"

        result := ComCall(8, this, "ptr", shape_, "uint", data_length, dataMarshal, data, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorFloat(result_)
    }

    /**
     * 
     * @param {IIterable<Integer>} shape_ 
     * @param {IIterable<Float>} data 
     * @returns {TensorFloat} 
     */
    CreateFromIterable(shape_, data) {
        result := ComCall(9, this, "ptr", shape_, "ptr", data, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorFloat(result_)
    }
}
