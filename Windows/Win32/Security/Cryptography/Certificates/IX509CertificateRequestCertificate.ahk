#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509CertificateRequestPkcs10.ahk

/**
 * The IX509CertificateRequestCertificate interface represents a request object for a self-generated certificate, enabling you to create a certificate directly without going through a registration or certification authority.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificaterequestcertificate
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestCertificate extends IX509CertificateRequestPkcs10{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRequestCertificate
     * @type {Guid}
     */
    static IID => Guid("{728ab343-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 60

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckPublicKeySignature", "get_Issuer", "put_Issuer", "get_NotBefore", "put_NotBefore", "get_NotAfter", "put_NotAfter", "get_SerialNumber", "put_SerialNumber", "get_SignerCertificate", "put_SignerCertificate"]

    /**
     * 
     * @param {IX509PublicKey} pPublicKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-checkpublickeysignature
     */
    CheckPublicKeySignature(pPublicKey) {
        result := ComCall(60, this, "ptr", pPublicKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX500DistinguishedName>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-get_issuer
     */
    get_Issuer(ppValue) {
        result := ComCall(61, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IX500DistinguishedName} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-put_issuer
     */
    put_Issuer(pValue) {
        result := ComCall(62, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-get_notbefore
     */
    get_NotBefore(pValue) {
        result := ComCall(63, this, "double*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-put_notbefore
     */
    put_NotBefore(Value) {
        result := ComCall(64, this, "double", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-get_notafter
     */
    get_NotAfter(pValue) {
        result := ComCall(65, this, "double*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-put_notafter
     */
    put_NotAfter(Value) {
        result := ComCall(66, this, "double", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-get_serialnumber
     */
    get_SerialNumber(Encoding, pValue) {
        result := ComCall(67, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-put_serialnumber
     */
    put_SerialNumber(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(68, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISignerCertificate>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-get_signercertificate
     */
    get_SignerCertificate(ppValue) {
        result := ComCall(69, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISignerCertificate} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcertificate-put_signercertificate
     */
    put_SignerCertificate(pValue) {
        result := ComCall(70, this, "ptr", pValue, "HRESULT")
        return result
    }
}
