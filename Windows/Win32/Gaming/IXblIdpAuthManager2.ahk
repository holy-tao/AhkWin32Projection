#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Foundation\BOOL.ahk" { BOOL }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IXblIdpAuthTokenResult.ahk" { IXblIdpAuthTokenResult }

/**
 * @namespace Windows.Win32.Gaming
 */
export default struct IXblIdpAuthManager2 extends IUnknown {
    /**
     * The interface identifier for IXblIdpAuthManager2
     * @type {Guid}
     */
    static IID := Guid("{bf8c0950-8389-43dd-9a76-a19728ec5dc5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXblIdpAuthManager2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUserlessTokenAndSignatureWithTokenResult : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXblIdpAuthManager2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} appSid 
     * @param {PWSTR} msaTarget 
     * @param {PWSTR} msaPolicy 
     * @param {PWSTR} httpMethod 
     * @param {PWSTR} uri 
     * @param {PWSTR} headers 
     * @param {Pointer<Integer>} body 
     * @param {Integer} bodySize 
     * @param {BOOL} forceRefresh 
     * @returns {IXblIdpAuthTokenResult} 
     */
    GetUserlessTokenAndSignatureWithTokenResult(appSid, msaTarget, msaPolicy, httpMethod, uri, headers, body, bodySize, forceRefresh) {
        appSid := appSid is String ? StrPtr(appSid) : appSid
        msaTarget := msaTarget is String ? StrPtr(msaTarget) : msaTarget
        msaPolicy := msaPolicy is String ? StrPtr(msaPolicy) : msaPolicy
        httpMethod := httpMethod is String ? StrPtr(httpMethod) : httpMethod
        uri := uri is String ? StrPtr(uri) : uri
        headers := headers is String ? StrPtr(headers) : headers

        bodyMarshal := body is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", appSid, "ptr", msaTarget, "ptr", msaPolicy, "ptr", httpMethod, "ptr", uri, "ptr", headers, bodyMarshal, body, "uint", bodySize, BOOL, forceRefresh, "ptr*", &result := 0, "HRESULT")
        return IXblIdpAuthTokenResult(result)
    }

    Query(iid) {
        if (IXblIdpAuthManager2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUserlessTokenAndSignatureWithTokenResult := CallbackCreate(GetMethod(implObj, "GetUserlessTokenAndSignatureWithTokenResult"), flags, 11)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUserlessTokenAndSignatureWithTokenResult)
    }
}
