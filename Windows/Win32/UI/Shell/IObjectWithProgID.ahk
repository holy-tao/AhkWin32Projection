#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide access to the ProgID associated with an object.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iobjectwithprogid
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IObjectWithProgID extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectWithProgID
     * @type {Guid}
     */
    static IID => Guid("{71e806fb-8dee-46fc-bf8c-7748a8a1ae13}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProgID", "GetProgID"]

    /**
     * 
     * @param {PWSTR} pszProgID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithprogid-setprogid
     */
    SetProgID(pszProgID) {
        pszProgID := pszProgID is String ? StrPtr(pszProgID) : pszProgID

        result := ComCall(3, this, "ptr", pszProgID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszProgID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iobjectwithprogid-getprogid
     */
    GetProgID(ppszProgID) {
        result := ComCall(4, this, "ptr", ppszProgID, "HRESULT")
        return result
    }
}
