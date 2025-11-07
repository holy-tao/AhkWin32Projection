#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class AsyncIAssociatedIdentityProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIAssociatedIdentityProvider
     * @type {Guid}
     */
    static IID => Guid("{2834d6ed-297e-4e72-8a51-961e86f05152}")

    /**
     * The class identifier for AsyncIAssociatedIdentityProvider
     * @type {Guid}
     */
    static CLSID => Guid("{2834d6ed-297e-4e72-8a51-961e86f05152}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_AssociateIdentity", "Finish_AssociateIdentity", "Begin_DisassociateIdentity", "Finish_DisassociateIdentity", "Begin_ChangeCredential", "Finish_ChangeCredential"]

    /**
     * 
     * @param {HWND} hwndParent 
     * @returns {HRESULT} 
     */
    Begin_AssociateIdentity(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPropertyStore} 
     */
    Finish_AssociateIdentity() {
        result := ComCall(4, this, "ptr*", &ppPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {PWSTR} lpszUniqueID 
     * @returns {HRESULT} 
     */
    Begin_DisassociateIdentity(hwndParent, lpszUniqueID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(5, this, "ptr", hwndParent, "ptr", lpszUniqueID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_DisassociateIdentity() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {PWSTR} lpszUniqueID 
     * @returns {HRESULT} 
     */
    Begin_ChangeCredential(hwndParent, lpszUniqueID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(7, this, "ptr", hwndParent, "ptr", lpszUniqueID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_ChangeCredential() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
