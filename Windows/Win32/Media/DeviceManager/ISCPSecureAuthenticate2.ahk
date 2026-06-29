#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISCPSecureAuthenticate.ahk" { ISCPSecureAuthenticate }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISCPSession.ahk" { ISCPSession }

/**
 * The ISCPSecureAuthenticate2 interface extends ISCPSecureAuthenticate by providing a way to get a session object.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iscpsecureauthenticate2
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct ISCPSecureAuthenticate2 extends ISCPSecureAuthenticate {
    /**
     * The interface identifier for ISCPSecureAuthenticate2
     * @type {Guid}
     */
    static IID := Guid("{b580cfae-1672-47e2-acaa-44bbecbcae5b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISCPSecureAuthenticate2 interfaces
    */
    struct Vtbl extends ISCPSecureAuthenticate.Vtbl {
        GetSCPSession : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISCPSecureAuthenticate2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetSCPSession method is used to obtain a pointer to the ISCPSecureQuery interface that represents a session object.
     * @remarks
     * This method is used to obtain a secure content provider (SCP) session. An SCP session is useful during transfer of multiple files, where the session can help SCP do some of the operations only once instead of once for every file transfer. This results in better transfer performance.
     * @returns {ISCPSession} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iscpsession">ISCPSession</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureauthenticate2-getscpsession
     */
    GetSCPSession() {
        result := ComCall(4, this, "ptr*", &ppSCPSession := 0, "HRESULT")
        return ISCPSession(ppSCPSession)
    }

    Query(iid) {
        if (ISCPSecureAuthenticate2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSCPSession := CallbackCreate(GetMethod(implObj, "GetSCPSession"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSCPSession)
    }
}
