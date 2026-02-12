#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TensorBoolean.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ITensorBooleanStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITensorBooleanStatics2
     * @type {Guid}
     */
    static IID => Guid("{a3a4a501-6a2d-52d7-b04b-c435baee0115}")

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
     * @param {Pointer<Boolean>} data 
     * @returns {TensorBoolean} 
     */
    CreateFromShapeArrayAndDataArray(shape_length, shape, data_length, data) {
        shapeMarshal := shape is VarRef ? "int64*" : "ptr"
        dataMarshal := data is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "uint", shape_length, shapeMarshal, shape, "uint", data_length, dataMarshal, data, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorBoolean(result_)
    }

    /**
     * 
     * @param {Integer} shape_length 
     * @param {Pointer<Integer>} shape 
     * @param {IBuffer} buffer_ 
     * @returns {TensorBoolean} 
     */
    CreateFromBuffer(shape_length, shape, buffer_) {
        shapeMarshal := shape is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, "uint", shape_length, shapeMarshal, shape, "ptr", buffer_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorBoolean(result_)
    }
}
