#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.ML
 * @version v4.0.30319
 */
class ITensorNative extends IUnknown{
    /**
     * The interface identifier for ITensorNative
     * @type {Guid}
     */
    static IID => Guid("{52f547ef-5b03-49b5-82d6-565f1ee0dd49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} value 
     * @param {Pointer<UInt32>} capacity 
     * @returns {HRESULT} 
     */
    GetBuffer(value, capacity) {
        result := ComCall(3, this, "char*", value, "uint*", capacity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} result 
     * @returns {HRESULT} 
     */
    GetD3D12Resource(result) {
        result := ComCall(4, this, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
