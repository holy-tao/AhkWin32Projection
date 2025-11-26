#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * Allows an identity provider to associate identities with local user accounts.
 * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nn-identityprovider-iassociatedidentityprovider
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IAssociatedIdentityProvider extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AssociateIdentity", "DisassociateIdentity", "ChangeCredential"]

    /**
     * Associates an identity with a local user account.
     * @param {HWND} hwndParent A handle to the parent of the window used to collect account credentials.
     * @returns {IPropertyStore} A pointer to the <b>IPropertyStore</b> interface associated with the identity.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iassociatedidentityprovider-associateidentity
     */
    AssociateIdentity(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "ptr", hwndParent, "ptr*", &ppPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * Disassociates the specified identity from a local user account.
     * @param {HWND} hwndParent A handle to the parent of the window used to collect account credentials.
     * @param {PWSTR} lpszUniqueID The identity to disassociate.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iassociatedidentityprovider-disassociateidentity
     */
    DisassociateIdentity(hwndParent, lpszUniqueID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(4, this, "ptr", hwndParent, "ptr", lpszUniqueID, "HRESULT")
        return result
    }

    /**
     * Changes the credentials associated with the specified identity.
     * @param {HWND} hwndParent A handle to the parent of the window used to collect account credentials.
     * @param {PWSTR} lpszUniqueID The identity for which to change the credentials.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//identityprovider/nf-identityprovider-iassociatedidentityprovider-changecredential
     */
    ChangeCredential(hwndParent, lpszUniqueID) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(5, this, "ptr", hwndParent, "ptr", lpszUniqueID, "HRESULT")
        return result
    }
}
