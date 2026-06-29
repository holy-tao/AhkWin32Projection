#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ICEnroll.ahk" { ICEnroll }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The ICEnroll2 interface is one of several interfaces that represent the Certificate Enrollment Control.
 * @see https://learn.microsoft.com/windows/win32/api/xenroll/nn-xenroll-icenroll2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICEnroll2 extends ICEnroll {
    /**
     * The interface identifier for ICEnroll2
     * @type {Guid}
     */
    static IID := Guid("{704ca730-c90b-11d1-9bec-00c04fc295e1}")

    /**
     * The class identifier for CEnroll2
     * @type {Guid}
     */
    static CLSID := Guid("{127698e4-e730-4e5c-a2b1-21490a70c8a1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICEnroll2 interfaces
    */
    struct Vtbl extends ICEnroll.Vtbl {
        addCertTypeToRequest        : IntPtr
        addNameValuePairToSignature : IntPtr
        get_WriteCertToUserDS       : IntPtr
        put_WriteCertToUserDS       : IntPtr
        get_EnableT61DNEncoding     : IntPtr
        put_EnableT61DNEncoding     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICEnroll2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    WriteCertToUserDS {
        get => this.get_WriteCertToUserDS()
        set => this.put_WriteCertToUserDS(value)
    }

    /**
     * @type {BOOL} 
     */
    EnableT61DNEncoding {
        get => this.get_EnableT61DNEncoding()
        set => this.put_EnableT61DNEncoding(value)
    }

    /**
     * Adds a certificate template to a request (used to support the enterprise certification authority (CA)). This method was first defined by the ICEnroll2 interface.
     * @remarks
     * This method can be called multiple times if more than one certificate template is desired for the request.
     * @param {BSTR} CertType The certificate template fully qualified name which is being added to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a>. This value is interpreted by the certification authority.
     * @returns {HRESULT} <h3>VB</h3>
     *  The return value is an <b>HRESULT</b>, with <b>S_OK</b> returned if the call is successful.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll2-addcerttypetorequest
     */
    addCertTypeToRequest(CertType) {
        CertType := CertType is String ? BSTR.Alloc(CertType).Value : CertType

        result := ComCall(63, this, BSTR, CertType, "HRESULT")
        return result
    }

    /**
     * Adds the authenticated name-value pair of an attribute to the request. It is up to the certification authority (CA) to interpret the meaning of the name-value pair.
     * @remarks
     * The <b>addNameValuePairToSignature</b> method is used  to add attributes to the request.
     * @param {BSTR} Name The name of the attribute, such as "2.5.4.6" for the country/region name.
     * @param {BSTR} Value The value of the attribute, such as "US".
     * @returns {HRESULT} <h3>VB</h3>
     *  The return value is an <b>HRESULT</b>, with <b>S_OK</b> returned if the call is successful.
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll2-addnamevaluepairtosignature
     */
    addNameValuePairToSignature(Name, Value) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(64, this, BSTR, Name, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a Boolean value that determines whether the certificate is written to the user's Active Directory store. (Get)
     * @remarks
     * <b>WriteCertToUserDS</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll2-get_writecerttouserds
     */
    get_WriteCertToUserDS() {
        result := ComCall(65, this, BOOL.Ptr, &fBool := 0, "HRESULT")
        return fBool
    }

    /**
     * Sets or retrieves a Boolean value that determines whether the certificate is written to the user's Active Directory store. (Put)
     * @remarks
     * <b>WriteCertToUserDS</b> affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptpkcs7">acceptPKCS7</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-acceptfilepkcs7">acceptFilePKCS7</a>
     * </li>
     * </ul>
     * 
     * 
     * The ability to set this property is disabled when  the Certificate Enrollment Control is executed as a scripted control.
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll2-put_writecerttouserds
     */
    put_WriteCertToUserDS(fBool) {
        result := ComCall(66, this, BOOL, fBool, "HRESULT")
        return result
    }

    /**
     * The EnableT61DNEncoding property of ICEnroll4 sets or retrieves a Boolean value that determines whether the distinguished name in the request is encoded as a T61 string instead of as a Unicode string. (Get)
     * @remarks
     * The <b>EnableT61DNEncoding</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll2-get_enablet61dnencoding
     */
    get_EnableT61DNEncoding() {
        result := ComCall(67, this, BOOL.Ptr, &fBool := 0, "HRESULT")
        return fBool
    }

    /**
     * The EnableT61DNEncoding property of ICEnroll4 sets or retrieves a Boolean value that determines whether the distinguished name in the request is encoded as a T61 string instead of as a Unicode string. (Put)
     * @remarks
     * The <b>EnableT61DNEncoding</b> property affects the behavior of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createpkcs10">createPKCS10</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/xenroll/nf-xenroll-icenroll-createfilepkcs10">createFilePKCS10</a>
     * </li>
     * </ul>
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll2-put_enablet61dnencoding
     */
    put_EnableT61DNEncoding(fBool) {
        result := ComCall(68, this, BOOL, fBool, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICEnroll2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.addCertTypeToRequest := CallbackCreate(GetMethod(implObj, "addCertTypeToRequest"), flags, 2)
        this.vtbl.addNameValuePairToSignature := CallbackCreate(GetMethod(implObj, "addNameValuePairToSignature"), flags, 3)
        this.vtbl.get_WriteCertToUserDS := CallbackCreate(GetMethod(implObj, "get_WriteCertToUserDS"), flags, 2)
        this.vtbl.put_WriteCertToUserDS := CallbackCreate(GetMethod(implObj, "put_WriteCertToUserDS"), flags, 2)
        this.vtbl.get_EnableT61DNEncoding := CallbackCreate(GetMethod(implObj, "get_EnableT61DNEncoding"), flags, 2)
        this.vtbl.put_EnableT61DNEncoding := CallbackCreate(GetMethod(implObj, "put_EnableT61DNEncoding"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.addCertTypeToRequest)
        CallbackFree(this.vtbl.addNameValuePairToSignature)
        CallbackFree(this.vtbl.get_WriteCertToUserDS)
        CallbackFree(this.vtbl.put_WriteCertToUserDS)
        CallbackFree(this.vtbl.get_EnableT61DNEncoding)
        CallbackFree(this.vtbl.put_EnableT61DNEncoding)
    }
}
