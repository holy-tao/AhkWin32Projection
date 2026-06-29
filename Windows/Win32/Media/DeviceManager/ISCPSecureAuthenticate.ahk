#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISCPSecureQuery.ahk" { ISCPSecureQuery }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ISCPSecureAuthenticate interface is the primary interface of the secure content provider, which Windows Media Device Manager queries to authenticate the secure content provider and to be authenticated by the secure content provider.
 * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nn-mswmdm-iscpsecureauthenticate
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct ISCPSecureAuthenticate extends IUnknown {
    /**
     * The interface identifier for ISCPSecureAuthenticate
     * @type {Guid}
     */
    static IID := Guid("{1dcb3a0f-33ed-11d3-8470-00c04f79dbc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISCPSecureAuthenticate interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSecureQuery : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISCPSecureAuthenticate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetSecureQuery method is used to obtain a pointer to the ISCPSecureQuery interface.
     * @returns {ISCPSecureQuery} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iscpsecurequery">ISCPSecureQuery</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iscpsecureauthenticate-getsecurequery
     */
    GetSecureQuery() {
        result := ComCall(3, this, "ptr*", &ppSecureQuery := 0, "HRESULT")
        return ISCPSecureQuery(ppSecureQuery)
    }

    Query(iid) {
        if (ISCPSecureAuthenticate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSecureQuery := CallbackCreate(GetMethod(implObj, "GetSecureQuery"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSecureQuery)
    }
}
