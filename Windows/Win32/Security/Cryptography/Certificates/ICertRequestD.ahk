#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CERTTRANSBLOB.ahk" { CERTTRANSBLOB }
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

        pwszAuthorityMarshal := pwszAuthority == 0 ? IntPtr : PWSTR
        pdwRequestIdMarshal := pdwRequestId is VarRef ? "uint*" : IntPtr
        pdwDispositionMarshal := pdwDisposition is VarRef ? "uint*" : IntPtr
        pwszAttributesMarshal := pwszAttributes == 0 ? IntPtr : PWSTR

        result := ComCall(3, this, UInt32, dwFlags, pwszAuthorityMarshal, pwszAuthority, pdwRequestIdMarshal, pdwRequestId, pdwDispositionMarshal, pdwDisposition, pwszAttributesMarshal, pwszAttributes, CERTTRANSBLOB.Ptr, pctbRequest, CERTTRANSBLOB.Ptr, pctbCertChain, CERTTRANSBLOB.Ptr, pctbEncodedCert, CERTTRANSBLOB.Ptr, pctbDispositionMessage, "HRESULT")
        return result
    }

    /**
     * @param {Integer} fchain 
     * @param {PWSTR} pwszAuthority 
     * @returns {CERTTRANSBLOB} 
     */
    GetCACert(fchain, pwszAuthority) {
        pwszAuthority := pwszAuthority is String ? StrPtr(pwszAuthority) : pwszAuthority

        pwszAuthorityMarshal := pwszAuthority == 0 ? IntPtr : PWSTR

        pctbOut := CERTTRANSBLOB()
        result := ComCall(4, this, UInt32, fchain, pwszAuthorityMarshal, pwszAuthority, CERTTRANSBLOB.Ptr, pctbOut, "HRESULT")
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

        pwszAuthorityMarshal := pwszAuthority == 0 ? IntPtr : PWSTR

        result := ComCall(5, this, pwszAuthorityMarshal, pwszAuthority, "HRESULT")
        return result
    }

    _Query(iid) {
        if (ICertRequestD.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Request := CallbackCreate(ObjBindMethod(implObj, "Request"), flags, 10)
        this.vtbl.GetCACert := CallbackCreate(ObjBindMethod(implObj, "GetCACert"), flags, 4)
        this.vtbl.Ping := CallbackCreate(ObjBindMethod(implObj, "Ping"), flags, 2)
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
