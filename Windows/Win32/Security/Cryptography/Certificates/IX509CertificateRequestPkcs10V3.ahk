#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IObjectId.ahk
#Include .\IX509NameValuePairs.ahk
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
     * @type {VARIANT_BOOL} 
     */
    AttestPrivateKey {
        get => this.get_AttestPrivateKey()
        set => this.put_AttestPrivateKey(value)
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
     * @type {BSTR} 
     */
    ChallengePassword {
        get => this.get_ChallengePassword()
        set => this.put_ChallengePassword(value)
    }

    /**
     * @type {IX509NameValuePairs} 
     */
    NameValuePairs {
        get => this.get_NameValuePairs()
    }

    /**
     * True if the created private key needs to be attested; otherwise false. If true, it is expected that the AttestationEncryptionCertificate property has been set.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_attestprivatekey
     */
    get_AttestPrivateKey() {
        result := ComCall(65, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * True if the created private key needs to be attested; otherwise false. If true, it is expected that the AttestationEncryptionCertificate property has been set.
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_attestprivatekey
     */
    put_AttestPrivateKey(Value) {
        result := ComCall(66, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * The certificate used to encrypt the EKPUB and EKCERT values from the client. This property must be set to a valid certificate that chains to a trusted machine root.
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_attestationencryptioncertificate
     */
    get_AttestationEncryptionCertificate(Encoding) {
        pValue := BSTR()
        result := ComCall(67, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * The certificate used to encrypt the EKPUB and EKCERT values from the client. This property must be set to a valid certificate that chains to a trusted machine root.
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_attestationencryptioncertificate
     */
    put_AttestationEncryptionCertificate(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(68, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * The encryption algorithm used to encrypt the EKPUB and EKCERT values from the client.
     * @returns {IObjectId} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_encryptionalgorithm
     */
    get_EncryptionAlgorithm() {
        result := ComCall(69, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * The encryption algorithm used to encrypt the EKPUB and EKCERT values from the client.
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_encryptionalgorithm
     */
    put_EncryptionAlgorithm(pValue) {
        result := ComCall(70, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Identifies the bit length for the EncryptionAlgorithm to use for encryption. If the EncryptionAlgorithm only supports one bit length, then you do not need to specify a value for the EncryptionStrength property.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_encryptionstrength
     */
    get_EncryptionStrength() {
        result := ComCall(71, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Identifies the bit length for the EncryptionAlgorithm to use for encryption. If the EncryptionAlgorithm only supports one bit length, then you do not need to specify a value for the EncryptionStrength property.
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_encryptionstrength
     */
    put_EncryptionStrength(Value) {
        result := ComCall(72, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * The password to use when creating a request with a challenge. To create a request without a challenge, do not set the ChallengePassword property.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_challengepassword
     */
    get_ChallengePassword() {
        pValue := BSTR()
        result := ComCall(73, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * The password to use when creating a request with a challenge. To create a request without a challenge, do not set the ChallengePassword property.
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_challengepassword
     */
    put_ChallengePassword(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(74, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * A collection of name/value pairs of additional certificate property values.
     * @returns {IX509NameValuePairs} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_namevaluepairs
     */
    get_NameValuePairs() {
        result := ComCall(75, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509NameValuePairs(ppValue)
    }
}
