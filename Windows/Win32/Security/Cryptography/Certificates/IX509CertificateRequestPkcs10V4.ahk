#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\KeyAttestationClaimType.ahk" { KeyAttestationClaimType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IX509CertificateRequestPkcs10V3.ahk" { IX509CertificateRequestPkcs10V3 }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509CertificateRequestPkcs10V4 extends IX509CertificateRequestPkcs10V3 {
    /**
     * The interface identifier for IX509CertificateRequestPkcs10V4
     * @type {Guid}
     */
    static IID := Guid("{728ab363-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509CertificateRequestPkcs10V4 interfaces
    */
    struct Vtbl extends IX509CertificateRequestPkcs10V3.Vtbl {
        get_ClaimType                 : IntPtr
        put_ClaimType                 : IntPtr
        get_AttestPrivateKeyPreferred : IntPtr
        put_AttestPrivateKeyPreferred : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509CertificateRequestPkcs10V4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {KeyAttestationClaimType} 
     */
    ClaimType {
        get => this.get_ClaimType()
        set => this.put_ClaimType(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AttestPrivateKeyPreferred {
        get => this.get_AttestPrivateKeyPreferred()
        set => this.put_AttestPrivateKeyPreferred(value)
    }

    /**
     * 
     * @returns {KeyAttestationClaimType} 
     */
    get_ClaimType() {
        result := ComCall(76, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {KeyAttestationClaimType} Value 
     * @returns {HRESULT} 
     */
    put_ClaimType(Value) {
        result := ComCall(77, this, KeyAttestationClaimType, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AttestPrivateKeyPreferred() {
        result := ComCall(78, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_AttestPrivateKeyPreferred(Value) {
        result := ComCall(79, this, VARIANT_BOOL, Value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IX509CertificateRequestPkcs10V4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ClaimType := CallbackCreate(GetMethod(implObj, "get_ClaimType"), flags, 2)
        this.vtbl.put_ClaimType := CallbackCreate(GetMethod(implObj, "put_ClaimType"), flags, 2)
        this.vtbl.get_AttestPrivateKeyPreferred := CallbackCreate(GetMethod(implObj, "get_AttestPrivateKeyPreferred"), flags, 2)
        this.vtbl.put_AttestPrivateKeyPreferred := CallbackCreate(GetMethod(implObj, "put_AttestPrivateKeyPreferred"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ClaimType)
        CallbackFree(this.vtbl.put_ClaimType)
        CallbackFree(this.vtbl.get_AttestPrivateKeyPreferred)
        CallbackFree(this.vtbl.put_AttestPrivateKeyPreferred)
    }
}
