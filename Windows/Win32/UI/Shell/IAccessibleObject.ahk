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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAccessibleName"]

    /**
     * Sets text that is retrieved by IAccessible::get_accName which accessibility tools use to obtain the Name Property of an object.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated, Unicode string containing the name.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-iaccessibleobject-setaccessiblename
     */
    SetAccessibleName(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(3, this, "ptr", pszName, "HRESULT")
        return result
    }
}
