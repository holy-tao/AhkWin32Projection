#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509CertificateRequest.ahk

/**
 * The IX509CertificateRequestPkcs7 interface represents a PKCS
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificaterequestpkcs7
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestPkcs7 extends IX509CertificateRequest{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRequestPkcs7
     * @type {Guid}
     */
    static IID => Guid("{728ab344-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromTemplateName", "InitializeFromCertificate", "InitializeFromInnerRequest", "InitializeDecode", "get_RequesterName", "put_RequesterName", "get_SignerCertificate", "put_SignerCertificate"]

    /**
     * 
     * @param {Integer} Context 
     * @param {BSTR} strTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefromtemplatename
     */
    InitializeFromTemplateName(Context, strTemplateName) {
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(32, this, "int", Context, "ptr", strTemplateName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {VARIANT_BOOL} RenewalRequest 
     * @param {BSTR} strCertificate 
     * @param {Integer} Encoding 
     * @param {Integer} InheritOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefromcertificate
     */
    InitializeFromCertificate(Context, RenewalRequest, strCertificate, Encoding, InheritOptions) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(33, this, "int", Context, "short", RenewalRequest, "ptr", strCertificate, "int", Encoding, "int", InheritOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IX509CertificateRequest} pInnerRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializefrominnerrequest
     */
    InitializeFromInnerRequest(pInnerRequest) {
        result := ComCall(34, this, "ptr", pInnerRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strEncodedData 
     * @param {Integer} Encoding 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-initializedecode
     */
    InitializeDecode(strEncodedData, Encoding) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(35, this, "ptr", strEncodedData, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-get_requestername
     */
    get_RequesterName(pValue) {
        result := ComCall(36, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-put_requestername
     */
    put_RequesterName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(37, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISignerCertificate>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-get_signercertificate
     */
    get_SignerCertificate(ppValue) {
        result := ComCall(38, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISignerCertificate} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs7-put_signercertificate
     */
    put_SignerCertificate(pValue) {
        result := ComCall(39, this, "ptr", pValue, "HRESULT")
        return result
    }
}
