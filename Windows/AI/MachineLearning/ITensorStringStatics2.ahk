#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TensorString.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ITensorStringStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITensorStringStatics2
     * @type {Guid}
     */
    static IID => Guid("{9e355ed0-c8e2-5254-9137-0193a3668fd8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromShapeArrayAndDataArray"]

    /**
     * 
     * @param {Integer} shape_length 
     * @param {Pointer<Integer>} shape 
     * @param {Integer} data_length 
     * @param {Pointer<HSTRING>} data 
     * @returns {TensorString} 
     */
    CreateFromShapeArrayAndDataArray(shape_length, shape, data_length, data) {
        shapeMarshal := shape is VarRef ? "int64*" : "ptr"

        result := ComCall(6, this, "uint", shape_length, shapeMarshal, shape, "uint", data_length, "ptr", data, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TensorString(result_)
    }
}
