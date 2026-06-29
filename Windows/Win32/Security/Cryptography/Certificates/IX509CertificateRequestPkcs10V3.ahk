#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IObjectId.ahk" { IObjectId }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import ".\IX509CertificateRequestPkcs10V2.ahk" { IX509CertificateRequestPkcs10V2 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IX509NameValuePairs.ahk" { IX509NameValuePairs }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IX509CertificateRequestPkcs10V3 interface represents a PKCS
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10v3
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509CertificateRequestPkcs10V3 extends IX509CertificateRequestPkcs10V2 {
    /**
     * The interface identifier for IX509CertificateRequestPkcs10V3
     * @type {Guid}
     */
    static IID := Guid("{54ea9942-3d66-4530-b76e-7c9170d3ec52}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509CertificateRequestPkcs10V3 interfaces
    */
    struct Vtbl extends IX509CertificateRequestPkcs10V2.Vtbl {
        get_AttestPrivateKey                 : IntPtr
        put_AttestPrivateKey                 : IntPtr
        get_AttestationEncryptionCertificate : IntPtr
        put_AttestationEncryptionCertificate : IntPtr
        get_EncryptionAlgorithm              : IntPtr
        put_EncryptionAlgorithm              : IntPtr
        get_EncryptionStrength               : IntPtr
        put_EncryptionStrength               : IntPtr
        get_ChallengePassword                : IntPtr
        put_ChallengePassword                : IntPtr
        get_NameValuePairs                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509CertificateRequestPkcs10V3.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * True if the created private key needs to be attested; otherwise false. If true, it is expected that the AttestationEncryptionCertificate property has been set. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_attestprivatekey
     */
    get_AttestPrivateKey() {
        result := ComCall(65, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * True if the created private key needs to be attested; otherwise false. If true, it is expected that the AttestationEncryptionCertificate property has been set. (Put)
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_attestprivatekey
     */
    put_AttestPrivateKey(Value) {
        result := ComCall(66, this, VARIANT_BOOL, Value, "HRESULT")
        return result
    }

    /**
     * The certificate used to encrypt the EKPUB and EKCERT values from the client. This property must be set to a valid certificate that chains to a trusted machine root. (Get)
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_attestationencryptioncertificate
     */
    get_AttestationEncryptionCertificate(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(67, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * The certificate used to encrypt the EKPUB and EKCERT values from the client. This property must be set to a valid certificate that chains to a trusted machine root. (Put)
     * @param {EncodingType} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_attestationencryptioncertificate
     */
    put_AttestationEncryptionCertificate(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(68, this, EncodingType, Encoding, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * The encryption algorithm used to encrypt the EKPUB and EKCERT values from the client. (Get)
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_encryptionalgorithm
     */
    get_EncryptionAlgorithm() {
        result := ComCall(69, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * The encryption algorithm used to encrypt the EKPUB and EKCERT values from the client. (Put)
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_encryptionalgorithm
     */
    put_EncryptionAlgorithm(pValue) {
        result := ComCall(70, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Identifies the bit length for the EncryptionAlgorithm to use for encryption. If the EncryptionAlgorithm only supports one bit length, then you do not need to specify a value for the EncryptionStrength property. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_encryptionstrength
     */
    get_EncryptionStrength() {
        result := ComCall(71, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Identifies the bit length for the EncryptionAlgorithm to use for encryption. If the EncryptionAlgorithm only supports one bit length, then you do not need to specify a value for the EncryptionStrength property. (Put)
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_encryptionstrength
     */
    put_EncryptionStrength(Value) {
        result := ComCall(72, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * The password to use when creating a request with a challenge. To create a request without a challenge, do not set the ChallengePassword property. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_challengepassword
     */
    get_ChallengePassword() {
        pValue := BSTR.Owned()
        result := ComCall(73, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * The password to use when creating a request with a challenge. To create a request without a challenge, do not set the ChallengePassword property. (Put)
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-put_challengepassword
     */
    put_ChallengePassword(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(74, this, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * A collection of name/value pairs of additional certificate property values.
     * @returns {IX509NameValuePairs} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequestpkcs10v3-get_namevaluepairs
     */
    get_NameValuePairs() {
        result := ComCall(75, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509NameValuePairs(ppValue)
    }

    Query(iid) {
        if (IX509CertificateRequestPkcs10V3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AttestPrivateKey := CallbackCreate(GetMethod(implObj, "get_AttestPrivateKey"), flags, 2)
        this.vtbl.put_AttestPrivateKey := CallbackCreate(GetMethod(implObj, "put_AttestPrivateKey"), flags, 2)
        this.vtbl.get_AttestationEncryptionCertificate := CallbackCreate(GetMethod(implObj, "get_AttestationEncryptionCertificate"), flags, 3)
        this.vtbl.put_AttestationEncryptionCertificate := CallbackCreate(GetMethod(implObj, "put_AttestationEncryptionCertificate"), flags, 3)
        this.vtbl.get_EncryptionAlgorithm := CallbackCreate(GetMethod(implObj, "get_EncryptionAlgorithm"), flags, 2)
        this.vtbl.put_EncryptionAlgorithm := CallbackCreate(GetMethod(implObj, "put_EncryptionAlgorithm"), flags, 2)
        this.vtbl.get_EncryptionStrength := CallbackCreate(GetMethod(implObj, "get_EncryptionStrength"), flags, 2)
        this.vtbl.put_EncryptionStrength := CallbackCreate(GetMethod(implObj, "put_EncryptionStrength"), flags, 2)
        this.vtbl.get_ChallengePassword := CallbackCreate(GetMethod(implObj, "get_ChallengePassword"), flags, 2)
        this.vtbl.put_ChallengePassword := CallbackCreate(GetMethod(implObj, "put_ChallengePassword"), flags, 2)
        this.vtbl.get_NameValuePairs := CallbackCreate(GetMethod(implObj, "get_NameValuePairs"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AttestPrivateKey)
        CallbackFree(this.vtbl.put_AttestPrivateKey)
        CallbackFree(this.vtbl.get_AttestationEncryptionCertificate)
        CallbackFree(this.vtbl.put_AttestationEncryptionCertificate)
        CallbackFree(this.vtbl.get_EncryptionAlgorithm)
        CallbackFree(this.vtbl.put_EncryptionAlgorithm)
        CallbackFree(this.vtbl.get_EncryptionStrength)
        CallbackFree(this.vtbl.put_EncryptionStrength)
        CallbackFree(this.vtbl.get_ChallengePassword)
        CallbackFree(this.vtbl.put_ChallengePassword)
        CallbackFree(this.vtbl.get_NameValuePairs)
    }
}
