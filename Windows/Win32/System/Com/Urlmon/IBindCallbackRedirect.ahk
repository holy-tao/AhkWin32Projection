#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IBindCallbackRedirect extends IUnknown{
    /**
     * The interface identifier for IBindCallbackRedirect
     * @type {Guid}
     */
    static IID => Guid("{11c81bc2-121e-4ed5-b9c4-b430bd54f2c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} lpcUrl 
     * @param {Pointer<VARIANT_BOOL>} vbCancel 
     * @returns {HRESULT} 
     */
    Redirect(lpcUrl, vbCancel) {
        lpcUrl := lpcUrl is String ? StrPtr(lpcUrl) : lpcUrl

        result := ComCall(3, this, "ptr", lpcUrl, "ptr", vbCancel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
