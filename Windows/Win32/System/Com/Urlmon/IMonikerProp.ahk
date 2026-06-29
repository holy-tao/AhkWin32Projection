#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MONIKERPROPERTY.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include ..\IUnknown.ahk
#Include ..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class IMonikerProp extends IUnknown {

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PutProperty"]

    /**
     * 
     * @param {MONIKERPROPERTY} mkp 
     * @param {PWSTR} _val 
     * @returns {HRESULT} 
     */
    PutProperty(mkp, _val) {
        _val := _val is String ? StrPtr(_val) : _val

        result := ComCall(3, this, "int", mkp, "ptr", _val, "HRESULT")
        return result
    }
}
