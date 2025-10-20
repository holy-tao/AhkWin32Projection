#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.ML
 * @version v4.0.30319
 */
class ITensorStaticsNative extends IUnknown{
    /**
     * The interface identifier for ITensorStaticsNative
     * @type {Guid}
     */
    static IID => Guid("{39d055a4-66f6-4ebc-95d9-7a29ebe7690a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ID3D12Resource>} value 
     * @param {Pointer<Int64>} shape 
     * @param {Integer} shapeCount 
     * @param {Pointer<IUnknown>} result 
     * @returns {HRESULT} 
     */
    CreateFromD3D12Resource(value, shape, shapeCount, result) {
        result := ComCall(3, this, "ptr", value, "int64*", shape, "int", shapeCount, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
