#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Allows an identity provider to notify a calling application when an identity is updated.
 * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nn-identityprovider-iidentityadvise
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct IIdentityAdvise extends IUnknown {
    /**
     * The interface identifier for IIdentityAdvise
     * @type {Guid}
     */
    static IID := Guid("{4e982fed-d14b-440c-b8d6-bb386453d386}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIdentityAdvise interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IdentityUpdated : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIdentityAdvise.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Is called by an identity provider to notify a calling application that an identity event occurred.
     * @param {Integer} dwIdentityUpdateEvents 
     * @param {PWSTR} lpszUniqueID The identity associated with the events that occurred.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * 
     * If the method fails, it returns an error code. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/identityprovider/nf-identityprovider-iidentityadvise-identityupdated
     */
    IdentityUpdated(dwIdentityUpdateEvents, lpszUniqueID) {
        lpszUniqueID := lpszUniqueID is String ? StrPtr(lpszUniqueID) : lpszUniqueID

        result := ComCall(3, this, "uint", dwIdentityUpdateEvents, "ptr", lpszUniqueID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIdentityAdvise.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IdentityUpdated := CallbackCreate(GetMethod(implObj, "IdentityUpdated"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IdentityUpdated)
    }
}
