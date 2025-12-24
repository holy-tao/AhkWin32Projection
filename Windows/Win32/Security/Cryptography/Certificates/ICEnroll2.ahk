#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICEnroll.ahk

/**
 * The ICEnroll2 interface is one of several interfaces that represent the Certificate Enrollment Control.
 * @see https://docs.microsoft.com/windows/win32/api//xenroll/nn-xenroll-icenroll2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICEnroll2 extends ICEnroll{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICEnroll2
     * @type {Guid}
     */
    static IID => Guid("{704ca730-c90b-11d1-9bec-00c04fc295e1}")

    /**
     * The class identifier for CEnroll2
     * @type {Guid}
     */
    static CLSID => Guid("{127698e4-e730-4e5c-a2b1-21490a70c8a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 63

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["addCertTypeToRequest", "addNameValuePairToSignature", "get_WriteCertToUserDS", "put_WriteCertToUserDS", "get_EnableT61DNEncoding", "put_EnableT61DNEncoding"]

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
     * @param {BSTR} CertType The certificate template fully qualified name which is being added to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate request</a>. This value is interpreted by the certification authority.
     * @returns {HRESULT} <h3>VB</h3>
     *  The return value is an <b>HRESULT</b>, with <b>S_OK</b> returned if the call is successful.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll2-addcerttypetorequest
     */
    addCertTypeToRequest(CertType) {
        CertType := CertType is String ? BSTR.Alloc(CertType).Value : CertType

        result := ComCall(63, this, "ptr", CertType, "HRESULT")
        return result
    }

    /**
     * Adds the authenticated name-value pair of an attribute to the request. It is up to the certification authority (CA) to interpret the meaning of the name-value pair.
     * @param {BSTR} Name The name of the attribute, such as "2.5.4.6" for the country/region name.
     * @param {BSTR} Value The value of the attribute, such as "US".
     * @returns {HRESULT} <h3>VB</h3>
     *  The return value is an <b>HRESULT</b>, with <b>S_OK</b> returned if the call is successful.
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll2-addnamevaluepairtosignature
     */
    addNameValuePairToSignature(Name, Value) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(64, this, "ptr", Name, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Sets or retrieves a Boolean value that determines whether the certificate is written to the user's Active Directory store.
     * @remarks
     * 
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
     * 
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll2-get_writecerttouserds
     */
    get_WriteCertToUserDS() {
        result := ComCall(65, this, "int*", &fBool := 0, "HRESULT")
        return fBool
    }

    /**
     * Sets or retrieves a Boolean value that determines whether the certificate is written to the user's Active Directory store.
     * @remarks
     * 
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
     * 
     * 
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll2-put_writecerttouserds
     */
    put_WriteCertToUserDS(fBool) {
        result := ComCall(66, this, "int", fBool, "HRESULT")
        return result
    }

    /**
     * The EnableT61DNEncoding property of ICEnroll4 sets or retrieves a Boolean value that determines whether the distinguished name in the request is encoded as a T61 string instead of as a Unicode string.
     * @remarks
     * 
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
     * 
     * 
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll2-get_enablet61dnencoding
     */
    get_EnableT61DNEncoding() {
        result := ComCall(67, this, "int*", &fBool := 0, "HRESULT")
        return fBool
    }

    /**
     * The EnableT61DNEncoding property of ICEnroll4 sets or retrieves a Boolean value that determines whether the distinguished name in the request is encoded as a T61 string instead of as a Unicode string.
     * @remarks
     * 
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
     * 
     * 
     * 
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//xenroll/nf-xenroll-icenroll2-put_enablet61dnencoding
     */
    put_EnableT61DNEncoding(fBool) {
        result := ComCall(68, this, "int", fBool, "HRESULT")
        return result
    }
}
