#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\CERTTRANSBLOB.ahk" { CERTTRANSBLOB }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertRequestD extends IUnknown {
    /**
     * The interface identifier for ICertRequestD
     * @type {Guid}
     */
    static IID := Guid("{d99e6e70-fc88-11d0-b498-00a0c90312f3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertRequestD interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Request   : IntPtr
        GetCACert : IntPtr
        Ping      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertRequestD.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pwszAuthority 
     * @param {Pointer<Integer>} pdwRequestId 
     * @param {Pointer<Integer>} pdwDisposition 
     * @param {PWSTR} pwszAttributes 
     * @param {Pointer<CERTTRANSBLOB>} pctbRequest 
     * @param {Pointer<CERTTRANSBLOB>} pctbCertChain 
     * @param {Pointer<CERTTRANSBLOB>} pctbEncodedCert 
     * @param {Pointer<CERTTRANSBLOB>} pctbDispositionMessage 
     * @returns {HRESULT} 
     */
    Request(dwFlags, pwszAuthority, pdwRequestId, pdwDisposition, pwszAttributes, pctbRequest, pctbCertChain, pctbEncodedCert, pctbDispositionMessage) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority
        pwszAttributes := pwszAttributes is String ? StrPtr(pwszAttributes) : pwszAttributes

        pdwRequestIdMarshal := pdwRequestId is VarRef ? "uint*" : "ptr"
        pdwDispositionMarshal := pdwDisposition is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwFlags, "ptr", pwszAuthority, pdwRequestIdMarshal, pdwRequestId, pdwDispositionMarshal, pdwDisposition, "ptr", pwszAttributes, CERTTRANSBLOB.Ptr, pctbRequest, CERTTRANSBLOB.Ptr, pctbCertChain, CERTTRANSBLOB.Ptr, pctbEncodedCert, CERTTRANSBLOB.Ptr, pctbDispositionMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fchain 
     * @param {PWSTR} pwszAuthority 
     * @returns {CERTTRANSBLOB} 
     */
    GetCACert(fchain, pwszAuthority) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority

        pctbOut := CERTTRANSBLOB()
        result := ComCall(4, this, "uint", fchain, "ptr", pwszAuthority, CERTTRANSBLOB.Ptr, pctbOut, "HRESULT")
        return pctbOut
    }

    /**
     * Use the Ping packet to establish a connection and negotiate security with the server.
     * @remarks
     * The **Ping** packet is optional. Instead of sending a **Ping** packet, you can use the [**Create-Session**](create-session.md) packet to establish a connection and negotiate security. However, it is more efficient to use the **Ping** packet for this purpose.
     * @param {PWSTR} pwszAuthority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/ping
     */
    Ping(pwszAuthority) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority

        result := ComCall(5, this, "ptr", pwszAuthority, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICertRequestD.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Request := CallbackCreate(GetMethod(implObj, "Request"), flags, 10)
        this.vtbl.GetCACert := CallbackCreate(GetMethod(implObj, "GetCACert"), flags, 4)
        this.vtbl.Ping := CallbackCreate(GetMethod(implObj, "Ping"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Request)
        CallbackFree(this.vtbl.GetCACert)
        CallbackFree(this.vtbl.Ping)
    }
}
