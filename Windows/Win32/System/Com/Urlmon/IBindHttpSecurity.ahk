#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IBindHttpSecurity extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIgnoreCertMask"]

    /**
     * 
     * @returns {Integer} 
     */
    GetIgnoreCertMask() {
        result := ComCall(3, this, "uint*", &pdwIgnoreCertMask := 0, "HRESULT")
        return pdwIgnoreCertMask
    }
}
