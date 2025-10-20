#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IMonikerProp extends IUnknown{
    /**
     * The interface identifier for IMonikerProp
     * @type {Guid}
     */
    static IID => Guid("{a5ca5f7f-1847-4d87-9c5b-918509f7511d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} mkp 
     * @param {PWSTR} val 
     * @returns {HRESULT} 
     */
    PutProperty(mkp, val) {
        val := val is String ? StrPtr(val) : val

        result := ComCall(3, this, "int", mkp, "ptr", val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
