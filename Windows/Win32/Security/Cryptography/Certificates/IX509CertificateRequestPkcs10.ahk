#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509CertificateRequest.ahk

/**
 * The IX509CertificateRequestPkcs10 interface represents a PKCS
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificaterequestpkcs10
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestPkcs10 extends IX509CertificateRequest{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRequestPkcs10
     * @type {Guid}
     */
    static IID => Guid("{728ab342-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromTemplateName", "InitializeFromPrivateKey", "InitializeFromPublicKey", "InitializeFromCertificate", "InitializeDecode", "CheckSignature", "IsSmartCard", "get_TemplateObjectId", "get_PublicKey", "get_PrivateKey", "get_NullSigned", "get_ReuseKey", "get_OldCertificate", "get_Subject", "put_Subject", "get_CspStatuses", "get_SmimeCapabilities", "put_SmimeCapabilities", "get_SignatureInformation", "get_KeyContainerNamePrefix", "put_KeyContainerNamePrefix", "get_CryptAttributes", "get_X509Extensions", "get_CriticalExtensions", "get_SuppressOids", "get_RawDataToBeSigned", "get_Signature", "GetCspStatuses"]

    /**
     * 
     * @param {Integer} Context 
     * @param {BSTR} strTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromtemplatename
     */
    InitializeFromTemplateName(Context, strTemplateName) {
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(32, this, "int", Context, "ptr", strTemplateName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {IX509PrivateKey} pPrivateKey 
     * @param {BSTR} strTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromprivatekey
     */
    InitializeFromPrivateKey(Context, pPrivateKey, strTemplateName) {
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(33, this, "int", Context, "ptr", pPrivateKey, "ptr", strTemplateName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {IX509PublicKey} pPublicKey 
     * @param {BSTR} strTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefrompublickey
     */
    InitializeFromPublicKey(Context, pPublicKey, strTemplateName) {
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(34, this, "int", Context, "ptr", pPublicKey, "ptr", strTemplateName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {BSTR} strCertificate 
     * @param {Integer} Encoding 
     * @param {Integer} InheritOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializefromcertificate
     */
    InitializeFromCertificate(Context, strCertificate, Encoding, InheritOptions) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(35, this, "int", Context, "ptr", strCertificate, "int", Encoding, "int", InheritOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strEncodedData 
     * @param {Integer} Encoding 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-initializedecode
     */
    InitializeDecode(strEncodedData, Encoding) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(36, this, "ptr", strEncodedData, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AllowedSignatureTypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-checksignature
     */
    CheckSignature(AllowedSignatureTypes) {
        result := ComCall(37, this, "int", AllowedSignatureTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-issmartcard
     */
    IsSmartCard(pValue) {
        result := ComCall(38, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_templateobjectid
     */
    get_TemplateObjectId(ppValue) {
        result := ComCall(39, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509PublicKey>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_publickey
     */
    get_PublicKey(ppValue) {
        result := ComCall(40, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509PrivateKey>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_privatekey
     */
    get_PrivateKey(ppValue) {
        result := ComCall(41, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_nullsigned
     */
    get_NullSigned(pValue) {
        result := ComCall(42, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_reusekey
     */
    get_ReuseKey(pValue) {
        result := ComCall(43, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_oldcertificate
     */
    get_OldCertificate(Encoding, pValue) {
        result := ComCall(44, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX500DistinguishedName>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_subject
     */
    get_Subject(ppValue) {
        result := ComCall(45, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IX500DistinguishedName} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-put_subject
     */
    put_Subject(pValue) {
        result := ComCall(46, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICspStatuses>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_cspstatuses
     */
    get_CspStatuses(ppValue) {
        result := ComCall(47, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_smimecapabilities
     */
    get_SmimeCapabilities(pValue) {
        result := ComCall(48, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-put_smimecapabilities
     */
    put_SmimeCapabilities(Value) {
        result := ComCall(49, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509SignatureInformation>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_signatureinformation
     */
    get_SignatureInformation(ppValue) {
        result := ComCall(50, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_keycontainernameprefix
     */
    get_KeyContainerNamePrefix(pValue) {
        result := ComCall(51, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-put_keycontainernameprefix
     */
    put_KeyContainerNamePrefix(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(52, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICryptAttributes>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_cryptattributes
     */
    get_CryptAttributes(ppValue) {
        result := ComCall(53, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509Extensions>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_x509extensions
     */
    get_X509Extensions(ppValue) {
        result := ComCall(54, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IObjectIds>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_criticalextensions
     */
    get_CriticalExtensions(ppValue) {
        result := ComCall(55, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IObjectIds>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_suppressoids
     */
    get_SuppressOids(ppValue) {
        result := ComCall(56, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_rawdatatobesigned
     */
    get_RawDataToBeSigned(Encoding, pValue) {
        result := ComCall(57, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_signature
     */
    get_Signature(Encoding, pValue) {
        result := ComCall(58, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} KeySpec 
     * @param {Pointer<ICspStatuses>} ppCspStatuses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-getcspstatuses
     */
    GetCspStatuses(KeySpec, ppCspStatuses) {
        result := ComCall(59, this, "int", KeySpec, "ptr*", ppCspStatuses, "HRESULT")
        return result
    }
}
