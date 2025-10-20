#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IBindHttpSecurity extends IUnknown{
    /**
     * The interface identifier for IBindHttpSecurity
     * @type {Guid}
     */
    static IID => Guid("{a9eda967-f50e-4a33-b358-206f6ef3086d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pdwIgnoreCertMask 
     * @returns {HRESULT} 
     */
    GetIgnoreCertMask(pdwIgnoreCertMask) {
        result := ComCall(3, this, "uint*", pdwIgnoreCertMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
