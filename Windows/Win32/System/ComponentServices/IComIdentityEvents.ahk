#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber about an activity that is part of an Internet Information Services (IIS) Active Server Pages (ASP) page. For example, if a COM+ object is invoked in an ASP page, the user would be notified of this activity.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomidentityevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComIdentityEvents extends IUnknown {
    /**
     * The interface identifier for IComIdentityEvents
     * @type {Guid}
     */
    static IID := Guid("{683130b1-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComIdentityEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnIISRequestInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComIdentityEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when an activity is part of an ASP page.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} ObjId The unique identifier for this object.
     * @param {PWSTR} pszClientIP The Internet Protocol (IP) address of the IIS client.
     * @param {PWSTR} pszServerIP The IP address of the IIS server.
     * @param {PWSTR} pszURL The URL on IIS server generating object reference.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomidentityevents-oniisrequestinfo
     */
    OnIISRequestInfo(pInfo, ObjId, pszClientIP, pszServerIP, pszURL) {
        pszClientIP := pszClientIP is String ? StrPtr(pszClientIP) : pszClientIP
        pszServerIP := pszServerIP is String ? StrPtr(pszServerIP) : pszServerIP
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", ObjId, "ptr", pszClientIP, "ptr", pszServerIP, "ptr", pszURL, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComIdentityEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnIISRequestInfo := CallbackCreate(GetMethod(implObj, "OnIISRequestInfo"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnIISRequestInfo)
    }
}
