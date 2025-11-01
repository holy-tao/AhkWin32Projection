#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509CertificateRequestPkcs10V2.ahk

/**
 * The IX509CertificateRequestPkcs10V3 interface represents a PKCS
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificaterequestpkcs10v3
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequestPkcs10V3 extends IX509CertificateRequestPkcs10V2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRequestPkcs10V3
     * @type {Guid}
     */
    static IID => Guid("{54ea9942-3d66-4530-b76e-7c9170d3ec52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 65

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AttestPrivateKey", "put_AttestPrivateKey", "get_AttestationEncryptionCertificate", "put_AttestationEncryptionCertificate", "get_EncryptionAlgorithm", "put_EncryptionAlgorithm", "get_EncryptionStrength", "put_EncryptionStrength", "get_ChallengePassword", "put_ChallengePassword", "get_NameValuePairs"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_attestprivatekey
     */
    get_AttestPrivateKey(pValue) {
        result := ComCall(65, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_attestprivatekey
     */
    put_AttestPrivateKey(Value) {
        result := ComCall(66, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_attestationencryptioncertificate
     */
    get_AttestationEncryptionCertificate(Encoding, pValue) {
        result := ComCall(67, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_attestationencryptioncertificate
     */
    put_AttestationEncryptionCertificate(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(68, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_encryptionalgorithm
     */
    get_EncryptionAlgorithm(ppValue) {
        result := ComCall(69, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_encryptionalgorithm
     */
    put_EncryptionAlgorithm(pValue) {
        result := ComCall(70, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_encryptionstrength
     */
    get_EncryptionStrength(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(71, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_encryptionstrength
     */
    put_EncryptionStrength(Value) {
        result := ComCall(72, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_challengepassword
     */
    get_ChallengePassword(pValue) {
        result := ComCall(73, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_challengepassword
     */
    put_ChallengePassword(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(74, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509NameValuePairs>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_namevaluepairs
     */
    get_NameValuePairs(ppValue) {
        result := ComCall(75, this, "ptr*", ppValue, "HRESULT")
        return result
    }
}
