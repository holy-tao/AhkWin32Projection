#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TensorFloat16Bit.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ITensorFloat16BitStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITensorFloat16BitStatics2
     * @type {Guid}
     */
    static IID => Guid("{68545726-2dc7-51bf-b470-0b344cc2a1bc}")

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
     * @param {Pointer<Float>} data 
     * @returns {TensorFloat16Bit} 
     */
    CreateFromShapeArrayAndDataArray(shape_length, shape, data_length, data) {
        shapeMarshal := shape is VarRef ? "int64*" : "ptr"
        dataMarshal := data is VarRef ? "float*" : "ptr"

        result := ComCall(6, this, "uint", shape_length, shapeMarshal, shape, "uint", data_length, dataMarshal, data, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorFloat16Bit(result_)
    }

    /**
     * 
     * @param {Integer} shape_length 
     * @param {Pointer<Integer>} shape 
     * @param {IBuffer} buffer_ 
     * @returns {TensorFloat16Bit} 
     */
    CreateFromBuffer(shape_length, shape, buffer_) {
        shapeMarshal := shape is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, "uint", shape_length, shapeMarshal, shape, "ptr", buffer_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorFloat16Bit(result_)
    }
}
