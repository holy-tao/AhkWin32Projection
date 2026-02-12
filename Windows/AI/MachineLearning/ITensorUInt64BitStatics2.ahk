#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TensorUInt64Bit.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ITensorUInt64BitStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITensorUInt64BitStatics2
     * @type {Guid}
     */
    static IID => Guid("{085a687d-67e1-5b1e-b232-4fabe9ca20b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromShapeArrayAndDataArray", "CreateFromBuffer"]

    /**
     * 
     * @param {Integer} shape_length 
     * @param {Pointer<Integer>} shape 
     * @param {Integer} data_length 
     * @param {Pointer<Integer>} data 
     * @returns {TensorUInt64Bit} 
     */
    CreateFromShapeArrayAndDataArray(shape_length, shape, data_length, data) {
        shapeMarshal := shape is VarRef ? "int64*" : "ptr"
        dataMarshal := data is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", shape_length, shapeMarshal, shape, "uint", data_length, dataMarshal, data, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorUInt64Bit(result_)
    }

    /**
     * 
     * @param {Integer} shape_length 
     * @param {Pointer<Integer>} shape 
     * @param {IBuffer} buffer_ 
     * @returns {TensorUInt64Bit} 
     */
    CreateFromBuffer(shape_length, shape, buffer_) {
        shapeMarshal := shape is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, "uint", shape_length, shapeMarshal, shape, "ptr", buffer_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorUInt64Bit(result_)
    }
}
