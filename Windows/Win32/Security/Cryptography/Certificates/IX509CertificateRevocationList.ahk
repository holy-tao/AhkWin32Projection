#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX500DistinguishedName.ahk
#Include .\IX509CertificateRevocationListEntries.ahk
#Include .\IX509Extensions.ahk
#Include .\IObjectIds.ahk
#Include .\ISignerCertificate.ahk
#Include .\IObjectId.ahk
#Include .\IX509SignatureInformation.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRevocationList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRevocationList
     * @type {Guid}
     */
    static IID => Guid("{728ab360-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "InitializeDecode", "Encode", "ResetForEncode", "CheckPublicKeySignature", "CheckSignature", "get_Issuer", "put_Issuer", "get_ThisUpdate", "put_ThisUpdate", "get_NextUpdate", "put_NextUpdate", "get_X509CRLEntries", "get_X509Extensions", "get_CriticalExtensions", "get_SignerCertificate", "put_SignerCertificate", "get_CRLNumber", "put_CRLNumber", "get_CAVersion", "put_CAVersion", "get_BaseCRL", "get_NullSigned", "get_HashAlgorithm", "put_HashAlgorithm", "get_AlternateSignatureAlgorithm", "put_AlternateSignatureAlgorithm", "get_SignatureInformation", "get_RawData", "get_RawDataToBeSigned", "get_Signature"]

    /**
     * @type {IX500DistinguishedName} 
     */
    Issuer {
        get => this.get_Issuer()
        set => this.put_Issuer(value)
    }

    /**
     * @type {Float} 
     */
    ThisUpdate {
        get => this.get_ThisUpdate()
        set => this.put_ThisUpdate(value)
    }

    /**
     * @type {Float} 
     */
    NextUpdate {
        get => this.get_NextUpdate()
        set => this.put_NextUpdate(value)
    }

    /**
     * @type {IX509CertificateRevocationListEntries} 
     */
    X509CRLEntries {
        get => this.get_X509CRLEntries()
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
     * @type {ISignerCertificate} 
     */
    SignerCertificate {
        get => this.get_SignerCertificate()
        set => this.put_SignerCertificate(value)
    }

    /**
     * @type {Integer} 
     */
    CAVersion {
        get => this.get_CAVersion()
        set => this.put_CAVersion(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    BaseCRL {
        get => this.get_BaseCRL()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    NullSigned {
        get => this.get_NullSigned()
    }

    /**
     * @type {IObjectId} 
     */
    HashAlgorithm {
        get => this.get_HashAlgorithm()
        set => this.put_HashAlgorithm(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AlternateSignatureAlgorithm {
        get => this.get_AlternateSignatureAlgorithm()
        set => this.put_AlternateSignatureAlgorithm(value)
    }

    /**
     * @type {IX509SignatureInformation} 
     */
    SignatureInformation {
        get => this.get_SignatureInformation()
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strEncodedData 
     * @param {Integer} Encoding 
     * @returns {HRESULT} 
     */
    InitializeDecode(strEncodedData, Encoding) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(8, this, "ptr", strEncodedData, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Encode() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetForEncode() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IX509PublicKey} pPublicKey 
     * @returns {HRESULT} 
     */
    CheckPublicKeySignature(pPublicKey) {
        result := ComCall(11, this, "ptr", pPublicKey, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CheckSignature() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX500DistinguishedName} 
     */
    get_Issuer() {
        result := ComCall(13, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX500DistinguishedName(ppValue)
    }

    /**
     * 
     * @param {IX500DistinguishedName} pValue 
     * @returns {HRESULT} 
     */
    put_Issuer(pValue) {
        result := ComCall(14, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ThisUpdate() {
        result := ComCall(15, this, "double*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    put_ThisUpdate(Value) {
        result := ComCall(16, this, "double", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NextUpdate() {
        result := ComCall(17, this, "double*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    put_NextUpdate(Value) {
        result := ComCall(18, this, "double", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX509CertificateRevocationListEntries} 
     */
    get_X509CRLEntries() {
        result := ComCall(19, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509CertificateRevocationListEntries(ppValue)
    }

    /**
     * 
     * @returns {IX509Extensions} 
     */
    get_X509Extensions() {
        result := ComCall(20, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509Extensions(ppValue)
    }

    /**
     * 
     * @returns {IObjectIds} 
     */
    get_CriticalExtensions() {
        result := ComCall(21, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectIds(ppValue)
    }

    /**
     * 
     * @returns {ISignerCertificate} 
     */
    get_SignerCertificate() {
        result := ComCall(22, this, "ptr*", &ppValue := 0, "HRESULT")
        return ISignerCertificate(ppValue)
    }

    /**
     * 
     * @param {ISignerCertificate} pValue 
     * @returns {HRESULT} 
     */
    put_SignerCertificate(pValue) {
        result := ComCall(23, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     */
    get_CRLNumber(Encoding) {
        pValue := BSTR()
        result := ComCall(24, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_CRLNumber(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(25, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CAVersion() {
        result := ComCall(26, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} pValue 
     * @returns {HRESULT} 
     */
    put_CAVersion(pValue) {
        result := ComCall(27, this, "int", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_BaseCRL() {
        result := ComCall(28, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_NullSigned() {
        result := ComCall(29, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {IObjectId} 
     */
    get_HashAlgorithm() {
        result := ComCall(30, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     */
    put_HashAlgorithm(pValue) {
        result := ComCall(31, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AlternateSignatureAlgorithm() {
        result := ComCall(32, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_AlternateSignatureAlgorithm(Value) {
        result := ComCall(33, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX509SignatureInformation} 
     */
    get_SignatureInformation() {
        result := ComCall(34, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509SignatureInformation(ppValue)
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     */
    get_RawData(Encoding) {
        pValue := BSTR()
        result := ComCall(35, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     */
    get_RawDataToBeSigned(Encoding) {
        pValue := BSTR()
        result := ComCall(36, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     */
    get_Signature(Encoding) {
        pValue := BSTR()
        result := ComCall(37, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }
}
