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
     * 
     * @param {BSTR} CertType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll2-addcerttypetorequest
     */
    addCertTypeToRequest(CertType) {
        CertType := CertType is String ? BSTR.Alloc(CertType).Value : CertType

        result := ComCall(63, this, "ptr", CertType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Name 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll2-addnamevaluepairtosignature
     */
    addNameValuePairToSignature(Name, Value) {
        Name := Name is String ? BSTR.Alloc(Name).Value : Name
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(64, this, "ptr", Name, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll2-get_writecerttouserds
     */
    get_WriteCertToUserDS() {
        result := ComCall(65, this, "int*", &fBool := 0, "HRESULT")
        return fBool
    }

    /**
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll2-put_writecerttouserds
     */
    put_WriteCertToUserDS(fBool) {
        result := ComCall(66, this, "int", fBool, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll2-get_enablet61dnencoding
     */
    get_EnableT61DNEncoding() {
        result := ComCall(67, this, "int*", &fBool := 0, "HRESULT")
        return fBool
    }

    /**
     * 
     * @param {BOOL} fBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xenroll/nf-xenroll-icenroll2-put_enablet61dnencoding
     */
    put_EnableT61DNEncoding(fBool) {
        result := ComCall(68, this, "int", fBool, "HRESULT")
        return result
    }
}
