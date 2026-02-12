#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TensorInt8Bit.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ITensorInt8BitStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITensorInt8BitStatics
     * @type {Guid}
     */
    static IID => Guid("{b1a12284-095c-4c76-a661-ac4cee1f3e8b}")

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
     * @returns {TensorInt8Bit} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorInt8Bit(result_)
    }

    /**
     * Create Extended Stored Procedures
     * @param {IIterable<Integer>} shape_ 
     * @returns {TensorInt8Bit} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create2(shape_) {
        result := ComCall(7, this, "ptr", shape_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorInt8Bit(result_)
    }

    /**
     * 
     * @param {IIterable<Integer>} shape_ 
     * @param {Integer} data_length 
     * @param {Pointer<Integer>} data 
     * @returns {TensorInt8Bit} 
     */
    CreateFromArray(shape_, data_length, data) {
        dataMarshal := data is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "ptr", shape_, "uint", data_length, dataMarshal, data, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorInt8Bit(result_)
    }

    /**
     * 
     * @param {IIterable<Integer>} shape_ 
     * @param {IIterable<Integer>} data 
     * @returns {TensorInt8Bit} 
     */
    CreateFromIterable(shape_, data) {
        result := ComCall(9, this, "ptr", shape_, "ptr", data, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorInt8Bit(result_)
    }
}
