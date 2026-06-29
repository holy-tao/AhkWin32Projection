#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct AsyncIAssociatedIdentityProvider extends IUnknown {
    /**
     * The interface identifier for AsyncIAssociatedIdentityProvider
     * @type {Guid}
     */
    static IID := Guid("{2834d6ed-297e-4e72-8a51-961e86f05152}")

    /**
     * The class identifier for AsyncIAssociatedIdentityProvider
     * @type {Guid}
     */
    static CLSID := Guid("{2834d6ed-297e-4e72-8a51-961e86f05152}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for AsyncIAssociatedIdentityProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Begin_AssociateIdentity     : IntPtr
        Finish_AssociateIdentity    : IntPtr
        Begin_DisassociateIdentity  : IntPtr
        Finish_DisassociateIdentity : IntPtr
        Begin_ChangeCredential      : IntPtr
        Finish_ChangeCredential     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := AsyncIAssociatedIdentityProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @returns {HRESULT} 
     */
    Begin_AssociateIdentity(hwndParent) {
        result := ComCall(3, this, HWND, hwndParent, "HRESULT")
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
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(5, this, HWND, hwndParent, "ptr", lpszUniqueID, "HRESULT")
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
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(7, this, HWND, hwndParent, "ptr", lpszUniqueID, "HRESULT")
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

    Query(iid) {
        if (AsyncIAssociatedIdentityProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Begin_AssociateIdentity := CallbackCreate(GetMethod(implObj, "Begin_AssociateIdentity"), flags, 2)
        this.vtbl.Finish_AssociateIdentity := CallbackCreate(GetMethod(implObj, "Finish_AssociateIdentity"), flags, 2)
        this.vtbl.Begin_DisassociateIdentity := CallbackCreate(GetMethod(implObj, "Begin_DisassociateIdentity"), flags, 3)
        this.vtbl.Finish_DisassociateIdentity := CallbackCreate(GetMethod(implObj, "Finish_DisassociateIdentity"), flags, 1)
        this.vtbl.Begin_ChangeCredential := CallbackCreate(GetMethod(implObj, "Begin_ChangeCredential"), flags, 3)
        this.vtbl.Finish_ChangeCredential := CallbackCreate(GetMethod(implObj, "Finish_ChangeCredential"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Begin_AssociateIdentity)
        CallbackFree(this.vtbl.Finish_AssociateIdentity)
        CallbackFree(this.vtbl.Begin_DisassociateIdentity)
        CallbackFree(this.vtbl.Finish_DisassociateIdentity)
        CallbackFree(this.vtbl.Begin_ChangeCredential)
        CallbackFree(this.vtbl.Finish_ChangeCredential)
    }
}
