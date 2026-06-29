#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows an identity provider to associate identities with local user accounts.
 * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nn-identityprovider-iassociatedidentityprovider
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct IAssociatedIdentityProvider extends IUnknown {
    /**
     * The interface identifier for IAssociatedIdentityProvider
     * @type {Guid}
     */
    static IID := Guid("{2af066b3-4cbb-4cba-a798-204b6af68cc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAssociatedIdentityProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AssociateIdentity    : IntPtr
        DisassociateIdentity : IntPtr
        ChangeCredential     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAssociatedIdentityProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Associates an identity with a local user account.
     * @remarks
     * This method should call <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredentials</a> to collect account credentials.
     * @param {HWND} hwndParent A handle to the parent of the window used to collect account credentials.
     * @returns {IPropertyStore} A pointer to the <b>IPropertyStore</b> interface associated with the identity.
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iassociatedidentityprovider-associateidentity
     */
    AssociateIdentity(hwndParent) {
        result := ComCall(3, this, HWND, hwndParent, "ptr*", &ppPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppPropertyStore)
    }

    /**
     * Disassociates the specified identity from a local user account.
     * @param {HWND} hwndParent A handle to the parent of the window used to collect account credentials.
     * @param {PWSTR} lpszUniqueID The identity to disassociate.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iassociatedidentityprovider-disassociateidentity
     */
    DisassociateIdentity(hwndParent, lpszUniqueID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(4, this, HWND, hwndParent, "ptr", lpszUniqueID, "HRESULT")
        return result
    }

    /**
     * Changes the credentials associated with the specified identity.
     * @remarks
     * This method should call <a href="https://docs.microsoft.com/windows/desktop/api/wincred/nf-wincred-creduipromptforwindowscredentialsa">CredUIPromptForWindowsCredentials</a> to collect account credentials.
     * @param {HWND} hwndParent A handle to the parent of the window used to collect account credentials.
     * @param {PWSTR} lpszUniqueID The identity for which to change the credentials.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iassociatedidentityprovider-changecredential
     */
    ChangeCredential(hwndParent, lpszUniqueID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(5, this, HWND, hwndParent, "ptr", lpszUniqueID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAssociatedIdentityProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AssociateIdentity := CallbackCreate(GetMethod(implObj, "AssociateIdentity"), flags, 3)
        this.vtbl.DisassociateIdentity := CallbackCreate(GetMethod(implObj, "DisassociateIdentity"), flags, 3)
        this.vtbl.ChangeCredential := CallbackCreate(GetMethod(implObj, "ChangeCredential"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AssociateIdentity)
        CallbackFree(this.vtbl.DisassociateIdentity)
        CallbackFree(this.vtbl.ChangeCredential)
    }
}
