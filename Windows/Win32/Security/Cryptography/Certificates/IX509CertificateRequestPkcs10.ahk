#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include .\IX509PublicKey.ahk
#Include .\IX509PrivateKey.ahk
#Include .\IX500DistinguishedName.ahk
#Include .\ICspStatuses.ahk
#Include .\IX509SignatureInformation.ahk
#Include .\ICryptAttributes.ahk
#Include .\IX509Extensions.ahk
#Include .\IObjectIds.ahk
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-issmartcard
     */
    IsSmartCard() {
        result := ComCall(38, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_templateobjectid
     */
    get_TemplateObjectId() {
        result := ComCall(39, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @returns {IX509PublicKey} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_publickey
     */
    get_PublicKey() {
        result := ComCall(40, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509PublicKey(ppValue)
    }

    /**
     * 
     * @returns {IX509PrivateKey} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_privatekey
     */
    get_PrivateKey() {
        result := ComCall(41, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509PrivateKey(ppValue)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_nullsigned
     */
    get_NullSigned() {
        result := ComCall(42, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_reusekey
     */
    get_ReuseKey() {
        result := ComCall(43, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_oldcertificate
     */
    get_OldCertificate(Encoding) {
        pValue := BSTR()
        result := ComCall(44, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {IX500DistinguishedName} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_subject
     */
    get_Subject() {
        result := ComCall(45, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX500DistinguishedName(ppValue)
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
     * @returns {ICspStatuses} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_cspstatuses
     */
    get_CspStatuses() {
        result := ComCall(47, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatuses(ppValue)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_smimecapabilities
     */
    get_SmimeCapabilities() {
        result := ComCall(48, this, "short*", &pValue := 0, "HRESULT")
        return pValue
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
     * @returns {IX509SignatureInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_signatureinformation
     */
    get_SignatureInformation() {
        result := ComCall(50, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509SignatureInformation(ppValue)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_keycontainernameprefix
     */
    get_KeyContainerNamePrefix() {
        pValue := BSTR()
        result := ComCall(51, this, "ptr", pValue, "HRESULT")
        return pValue
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
     * @returns {ICryptAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_cryptattributes
     */
    get_CryptAttributes() {
        result := ComCall(53, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICryptAttributes(ppValue)
    }

    /**
     * 
     * @returns {IX509Extensions} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_x509extensions
     */
    get_X509Extensions() {
        result := ComCall(54, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509Extensions(ppValue)
    }

    /**
     * 
     * @returns {IObjectIds} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_criticalextensions
     */
    get_CriticalExtensions() {
        result := ComCall(55, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectIds(ppValue)
    }

    /**
     * 
     * @returns {IObjectIds} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_suppressoids
     */
    get_SuppressOids() {
        result := ComCall(56, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectIds(ppValue)
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_rawdatatobesigned
     */
    get_RawDataToBeSigned(Encoding) {
        pValue := BSTR()
        result := ComCall(57, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-get_signature
     */
    get_Signature(Encoding) {
        pValue := BSTR()
        result := ComCall(58, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} KeySpec 
     * @returns {ICspStatuses} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10-getcspstatuses
     */
    GetCspStatuses(KeySpec) {
        result := ComCall(59, this, "int", KeySpec, "ptr*", &ppCspStatuses := 0, "HRESULT")
        return ICspStatuses(ppCspStatuses)
    }
}
