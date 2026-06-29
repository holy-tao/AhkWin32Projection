#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWSManConnectionOptions.ahk" { IWSManConnectionOptions }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWSManConnectionOptionsEx object is passed to the IWSMan::CreateSession method to provide the thumbprint of the client certificate used for authentication.
 * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nn-wsmandisp-iwsmanconnectionoptionsex
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct IWSManConnectionOptionsEx extends IWSManConnectionOptions {
    /**
     * The interface identifier for IWSManConnectionOptionsEx
     * @type {Guid}
     */
    static IID := Guid("{ef43edf7-2a48-4d93-9526-8bd6ab6d4a6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSManConnectionOptionsEx interfaces
    */
    struct Vtbl extends IWSManConnectionOptions.Vtbl {
        get_CertificateThumbprint : IntPtr
        put_CertificateThumbprint : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSManConnectionOptionsEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    CertificateThumbprint {
        get => this.get_CertificateThumbprint()
        set => this.put_CertificateThumbprint(value)
    }

    /**
     * Sets or gets the certificate thumbprint to use when authenticating by using client certificate authentication. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex-get_certificatethumbprint
     */
    get_CertificateThumbprint() {
        thumbprint := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, thumbprint, "HRESULT")
        return thumbprint
    }

    /**
     * Sets or gets the certificate thumbprint to use when authenticating by using client certificate authentication. (Put)
     * @param {BSTR} thumbprint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wsmandisp/nf-wsmandisp-iwsmanconnectionoptionsex-put_certificatethumbprint
     */
    put_CertificateThumbprint(thumbprint) {
        thumbprint := thumbprint is String ? BSTR.Alloc(thumbprint).Value : thumbprint

        result := ComCall(11, this, BSTR, thumbprint, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWSManConnectionOptionsEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CertificateThumbprint := CallbackCreate(GetMethod(implObj, "get_CertificateThumbprint"), flags, 2)
        this.vtbl.put_CertificateThumbprint := CallbackCreate(GetMethod(implObj, "put_CertificateThumbprint"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CertificateThumbprint)
        CallbackFree(this.vtbl.put_CertificateThumbprint)
    }
}
