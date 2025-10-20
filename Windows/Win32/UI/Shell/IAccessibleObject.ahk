#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that can be used by an accessibility application.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iaccessibleobject
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAccessibleObject extends IUnknown{
    /**
     * The interface identifier for IAccessibleObject
     * @type {Guid}
     */
    static IID => Guid("{95a391c5-9ed4-4c28-8401-ab9e06719e11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     */
    SetAccessibleName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
