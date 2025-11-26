#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include .\ICryptAttributes.ahk
#Include .\IX509NameValuePairs.ahk
#Include .\IX509Extensions.ahk
#Include .\IObjectIds.ahk
#Include .\IX509SignatureInformation.ahk
#Include .\ISignerCertificates.ahk
#Include .\IX509CertificateRequestPkcs7.ahk

/**
 * Represents a CMC (Certificate Management Message over CMS) certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificaterequestcmc
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestCmc extends IX509CertificateRequestPkcs7{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRequestCmc
     * @type {Guid}
     */
    static IID => Guid("{728ab345-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 40

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromInnerRequestTemplateName", "get_TemplateObjectId", "get_NullSigned", "get_CryptAttributes", "get_NameValuePairs", "get_X509Extensions", "get_CriticalExtensions", "get_SuppressOids", "get_TransactionId", "put_TransactionId", "get_SenderNonce", "put_SenderNonce", "get_SignatureInformation", "get_ArchivePrivateKey", "put_ArchivePrivateKey", "get_KeyArchivalCertificate", "put_KeyArchivalCertificate", "get_EncryptionAlgorithm", "put_EncryptionAlgorithm", "get_EncryptionStrength", "put_EncryptionStrength", "get_EncryptedKeyHash", "get_SignerCertificates"]

    /**
     * @type {IObjectId} 
     */
    TemplateObjectId {
        get => this.get_TemplateObjectId()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    NullSigned {
        get => this.get_NullSigned()
    }

    /**
     * @type {ICryptAttributes} 
     */
    CryptAttributes {
        get => this.get_CryptAttributes()
    }

    /**
     * @type {IX509NameValuePairs} 
     */
    NameValuePairs {
        get => this.get_NameValuePairs()
    }

    /**
     * @type {IX509Extensions} 
     */
    X509Extensions {
        get => this.get_X509Extensions()
    }

    /**
     * @type {IObjectIds} 
     */
    CriticalExtensions {
        get => this.get_CriticalExtensions()
    }

    /**
     * @type {IObjectIds} 
     */
    SuppressOids {
        get => this.get_SuppressOids()
    }

    /**
     * @type {Integer} 
     */
    TransactionId {
        get => this.get_TransactionId()
        set => this.put_TransactionId(value)
    }

    /**
     * @type {IX509SignatureInformation} 
     */
    SignatureInformation {
        get => this.get_SignatureInformation()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ArchivePrivateKey {
        get => this.get_ArchivePrivateKey()
        set => this.put_ArchivePrivateKey(value)
    }

    /**
     * @type {IObjectId} 
     */
    EncryptionAlgorithm {
        get => this.get_EncryptionAlgorithm()
        set => this.put_EncryptionAlgorithm(value)
    }

    /**
     * @type {Integer} 
     */
    EncryptionStrength {
        get => this.get_EncryptionStrength()
        set => this.put_EncryptionStrength(value)
    }

    /**
     * @type {ISignerCertificates} 
     */
    SignerCertificates {
        get => this.get_SignerCertificates()
    }

    /**
     * 
     * @param {IX509CertificateRequest} pInnerRequest 
     * @param {BSTR} strTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-initializefrominnerrequesttemplatename
     */
    InitializeFromInnerRequestTemplateName(pInnerRequest, strTemplateName) {
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(40, this, "ptr", pInnerRequest, "ptr", strTemplateName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_templateobjectid
     */
    get_TemplateObjectId() {
        result := ComCall(41, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_nullsigned
     */
    get_NullSigned() {
        result := ComCall(42, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {ICryptAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_cryptattributes
     */
    get_CryptAttributes() {
        result := ComCall(43, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICryptAttributes(ppValue)
    }

    /**
     * 
     * @returns {IX509NameValuePairs} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_namevaluepairs
     */
    get_NameValuePairs() {
        result := ComCall(44, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509NameValuePairs(ppValue)
    }

    /**
     * 
     * @returns {IX509Extensions} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_x509extensions
     */
    get_X509Extensions() {
        result := ComCall(45, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509Extensions(ppValue)
    }

    /**
     * 
     * @returns {IObjectIds} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_criticalextensions
     */
    get_CriticalExtensions() {
        result := ComCall(46, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectIds(ppValue)
    }

    /**
     * 
     * @returns {IObjectIds} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_suppressoids
     */
    get_SuppressOids() {
        result := ComCall(47, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectIds(ppValue)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_transactionid
     */
    get_TransactionId() {
        result := ComCall(48, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-put_transactionid
     */
    put_TransactionId(Value) {
        result := ComCall(49, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_sendernonce
     */
    get_SenderNonce(Encoding) {
        pValue := BSTR()
        result := ComCall(50, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-put_sendernonce
     */
    put_SenderNonce(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(51, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX509SignatureInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_signatureinformation
     */
    get_SignatureInformation() {
        result := ComCall(52, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509SignatureInformation(ppValue)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_archiveprivatekey
     */
    get_ArchivePrivateKey() {
        result := ComCall(53, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-put_archiveprivatekey
     */
    put_ArchivePrivateKey(Value) {
        result := ComCall(54, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_keyarchivalcertificate
     */
    get_KeyArchivalCertificate(Encoding) {
        pValue := BSTR()
        result := ComCall(55, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-put_keyarchivalcertificate
     */
    put_KeyArchivalCertificate(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(56, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_encryptionalgorithm
     */
    get_EncryptionAlgorithm() {
        result := ComCall(57, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-put_encryptionalgorithm
     */
    put_EncryptionAlgorithm(pValue) {
        result := ComCall(58, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_encryptionstrength
     */
    get_EncryptionStrength() {
        result := ComCall(59, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-put_encryptionstrength
     */
    put_EncryptionStrength(Value) {
        result := ComCall(60, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_encryptedkeyhash
     */
    get_EncryptedKeyHash(Encoding) {
        pValue := BSTR()
        result := ComCall(61, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {ISignerCertificates} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_signercertificates
     */
    get_SignerCertificates() {
        result := ComCall(62, this, "ptr*", &ppValue := 0, "HRESULT")
        return ISignerCertificates(ppValue)
    }
}
