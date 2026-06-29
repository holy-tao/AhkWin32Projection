#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if the authentication of a method call succeeded or failed.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomsecurityevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComSecurityEvents extends IUnknown {
    /**
     * The interface identifier for IComSecurityEvents
     * @type {Guid}
     */
    static IID := Guid("{683130ac-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComSecurityEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnAuthenticate     : IntPtr
        OnAuthenticateFail : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComSecurityEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when a method call level authentication succeeds.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The identifier of the activity in which the object is created.
     * @param {Integer} _ObjectID The just-in-time activated object.
     * @param {Pointer<Guid>} guidIID The IID of the method.
     * @param {Integer} iMeth The v-table index of the method.
     * @param {Integer} cbByteOrig The number of bytes in the security identifier for the original caller.
     * @param {Pointer<Integer>} pSidOriginalUser The security identifier for the original caller.
     * @param {Integer} cbByteCur The number of bytes in the security identifier for the current caller.
     * @param {Pointer<Integer>} pSidCurrentUser The security identifier for the current caller.
     * @param {BOOL} bCurrentUserInpersonatingInProc Indicates whether the current user is impersonating.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomsecurityevents-onauthenticate
     */
    OnAuthenticate(pInfo, guidActivity, _ObjectID, guidIID, iMeth, cbByteOrig, pSidOriginalUser, cbByteCur, pSidCurrentUser, bCurrentUserInpersonatingInProc) {
        pSidOriginalUserMarshal := pSidOriginalUser is VarRef ? "char*" : "ptr"
        pSidCurrentUserMarshal := pSidCurrentUser is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, "uint", _ObjectID, Guid.Ptr, guidIID, "uint", iMeth, "uint", cbByteOrig, pSidOriginalUserMarshal, pSidOriginalUser, "uint", cbByteCur, pSidCurrentUserMarshal, pSidCurrentUser, BOOL, bCurrentUserInpersonatingInProc, "HRESULT")
        return result
    }

    /**
     * Generated when a method call level authentication fails.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The identifier of the activity in which the object is created.
     * @param {Integer} _ObjectID The just-in-time activated object.
     * @param {Pointer<Guid>} guidIID The IID of the method.
     * @param {Integer} iMeth The v-table index of the method.
     * @param {Integer} cbByteOrig The number of bytes in the security identifier for the original caller.
     * @param {Pointer<Integer>} pSidOriginalUser The security identifier for the original caller.
     * @param {Integer} cbByteCur The number of bytes in the security identifier for the current caller.
     * @param {Pointer<Integer>} pSidCurrentUser The security identifier for the current caller.
     * @param {BOOL} bCurrentUserInpersonatingInProc Indicates whether the current user is impersonating.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomsecurityevents-onauthenticatefail
     */
    OnAuthenticateFail(pInfo, guidActivity, _ObjectID, guidIID, iMeth, cbByteOrig, pSidOriginalUser, cbByteCur, pSidCurrentUser, bCurrentUserInpersonatingInProc) {
        pSidOriginalUserMarshal := pSidOriginalUser is VarRef ? "char*" : "ptr"
        pSidCurrentUserMarshal := pSidCurrentUser is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, "uint", _ObjectID, Guid.Ptr, guidIID, "uint", iMeth, "uint", cbByteOrig, pSidOriginalUserMarshal, pSidOriginalUser, "uint", cbByteCur, pSidCurrentUserMarshal, pSidCurrentUser, BOOL, bCurrentUserInpersonatingInProc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComSecurityEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnAuthenticate := CallbackCreate(GetMethod(implObj, "OnAuthenticate"), flags, 11)
        this.vtbl.OnAuthenticateFail := CallbackCreate(GetMethod(implObj, "OnAuthenticateFail"), flags, 11)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnAuthenticate)
        CallbackFree(this.vtbl.OnAuthenticateFail)
    }
}
