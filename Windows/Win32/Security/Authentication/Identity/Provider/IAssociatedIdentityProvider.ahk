#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * Allows an identity provider to associate identities with local user accounts.
 * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nn-identityprovider-iassociatedidentityprovider
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IAssociatedIdentityProvider extends IUnknown{
    /**
     * The interface identifier for IAssociatedIdentityProvider
     * @type {Guid}
     */
    static IID => Guid("{2af066b3-4cbb-4cba-a798-204b6af68cc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Pointer<IPropertyStore>} ppPropertyStore 
     * @returns {HRESULT} 
     */
    AssociateIdentity(hwndParent, ppPropertyStore) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr", ppPropertyStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {PWSTR} lpszUniqueID 
     * @returns {HRESULT} 
     */
    DisassociateIdentity(hwndParent, lpszUniqueID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(4, this, "ptr", hwndParent, "ptr", lpszUniqueID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {PWSTR} lpszUniqueID 
     * @returns {HRESULT} 
     */
    ChangeCredential(hwndParent, lpszUniqueID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(5, this, "ptr", hwndParent, "ptr", lpszUniqueID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
