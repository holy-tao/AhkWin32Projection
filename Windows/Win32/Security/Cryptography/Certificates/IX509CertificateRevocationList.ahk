#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IX500DistinguishedName>} ppValue 
     * @returns {HRESULT} 
     */
    get_Issuer(ppValue) {
        result := ComCall(13, this, "ptr*", ppValue, "HRESULT")
        return result
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
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     */
    get_ThisUpdate(pValue) {
        pValueMarshal := pValue is VarRef ? "double*" : "ptr"

        result := ComCall(15, this, pValueMarshal, pValue, "HRESULT")
        return result
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
     * @param {Pointer<Float>} pValue 
     * @returns {HRESULT} 
     */
    get_NextUpdate(pValue) {
        pValueMarshal := pValue is VarRef ? "double*" : "ptr"

        result := ComCall(17, this, pValueMarshal, pValue, "HRESULT")
        return result
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
     * @param {Pointer<IX509CertificateRevocationListEntries>} ppValue 
     * @returns {HRESULT} 
     */
    get_X509CRLEntries(ppValue) {
        result := ComCall(19, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509Extensions>} ppValue 
     * @returns {HRESULT} 
     */
    get_X509Extensions(ppValue) {
        result := ComCall(20, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IObjectIds>} ppValue 
     * @returns {HRESULT} 
     */
    get_CriticalExtensions(ppValue) {
        result := ComCall(21, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISignerCertificate>} ppValue 
     * @returns {HRESULT} 
     */
    get_SignerCertificate(ppValue) {
        result := ComCall(22, this, "ptr*", ppValue, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_CRLNumber(Encoding, pValue) {
        result := ComCall(24, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     */
    get_CAVersion(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pValueMarshal, pValue, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_BaseCRL(pValue) {
        result := ComCall(28, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_NullSigned(pValue) {
        result := ComCall(29, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     */
    get_HashAlgorithm(ppValue) {
        result := ComCall(30, this, "ptr*", ppValue, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_AlternateSignatureAlgorithm(pValue) {
        result := ComCall(32, this, "ptr", pValue, "HRESULT")
        return result
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
     * @param {Pointer<IX509SignatureInformation>} ppValue 
     * @returns {HRESULT} 
     */
    get_SignatureInformation(ppValue) {
        result := ComCall(34, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_RawData(Encoding, pValue) {
        result := ComCall(35, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_RawDataToBeSigned(Encoding, pValue) {
        result := ComCall(36, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_Signature(Encoding, pValue) {
        result := ComCall(37, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }
}
