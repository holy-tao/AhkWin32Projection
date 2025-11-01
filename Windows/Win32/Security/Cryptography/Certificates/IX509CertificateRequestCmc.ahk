#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_templateobjectid
     */
    get_TemplateObjectId(ppValue) {
        result := ComCall(41, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_nullsigned
     */
    get_NullSigned(pValue) {
        result := ComCall(42, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICryptAttributes>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_cryptattributes
     */
    get_CryptAttributes(ppValue) {
        result := ComCall(43, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509NameValuePairs>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_namevaluepairs
     */
    get_NameValuePairs(ppValue) {
        result := ComCall(44, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509Extensions>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_x509extensions
     */
    get_X509Extensions(ppValue) {
        result := ComCall(45, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IObjectIds>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_criticalextensions
     */
    get_CriticalExtensions(ppValue) {
        result := ComCall(46, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IObjectIds>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_suppressoids
     */
    get_SuppressOids(ppValue) {
        result := ComCall(47, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_transactionid
     */
    get_TransactionId(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(48, this, pValueMarshal, pValue, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_sendernonce
     */
    get_SenderNonce(Encoding, pValue) {
        result := ComCall(50, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
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
     * @param {Pointer<IX509SignatureInformation>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_signatureinformation
     */
    get_SignatureInformation(ppValue) {
        result := ComCall(52, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_archiveprivatekey
     */
    get_ArchivePrivateKey(pValue) {
        result := ComCall(53, this, "ptr", pValue, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_keyarchivalcertificate
     */
    get_KeyArchivalCertificate(Encoding, pValue) {
        result := ComCall(55, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
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
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_encryptionalgorithm
     */
    get_EncryptionAlgorithm(ppValue) {
        result := ComCall(57, this, "ptr*", ppValue, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_encryptionstrength
     */
    get_EncryptionStrength(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(59, this, pValueMarshal, pValue, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_encryptedkeyhash
     */
    get_EncryptedKeyHash(Encoding, pValue) {
        result := ComCall(61, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISignerCertificates>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_signercertificates
     */
    get_SignerCertificates(ppValue) {
        result := ComCall(62, this, "ptr*", ppValue, "HRESULT")
        return result
    }
}
