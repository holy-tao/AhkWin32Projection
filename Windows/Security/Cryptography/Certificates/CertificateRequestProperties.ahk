#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICertificateRequestProperties.ahk
#Include .\ICertificateRequestProperties2.ahk
#Include .\ICertificateRequestProperties3.ahk
#Include .\ICertificateRequestProperties4.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the properties of a certificate request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CertificateRequestProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICertificateRequestProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICertificateRequestProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the subject name.
     * @remarks
     * This value is an X.500 distinguished name (DN). This can be a full DN string that contains one or more relative distinguished names (RDNs) in the format of "CN=;OU=,..", or the subject name can be a simple string that contains the common name (CN) component of the full DN.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     * Gets or sets the public key algorithm.
     * @remarks
     * The default value is "RSA". You can use properties on the [KeyAlgorithmNames](keyalgorithmnames.md) class to specify error-free names or to compare the name retrieved by this property with a known string.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.keyalgorithmname
     * @type {HSTRING} 
     */
    KeyAlgorithmName {
        get => this.get_KeyAlgorithmName()
        set => this.put_KeyAlgorithmName(value)
    }

    /**
     * Gets or sets the size, in bits, of the private key to be generated.
     * @remarks
     * The default key size for RSA and DSA algorithms is 2048 bits. If an elliptic curve cryptographic (ECC) algorithm was specified in the [KeyAlgorithmName](certificaterequestproperties_keyalgorithmname.md) property, the key size is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.keysize
     * @type {Integer} 
     */
    KeySize {
        get => this.get_KeySize()
        set => this.put_KeySize(value)
    }

    /**
     * Gets or sets the display name of the enrolled certificate.
     * @remarks
     * By default, this value is an empty string. FriendlyName
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
        set => this.put_FriendlyName(value)
    }

    /**
     * Gets or sets the hash algorithm used when creating the certificate request signature.
     * @remarks
     * The default value is SHA256.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.hashalgorithmname
     * @type {HSTRING} 
     */
    HashAlgorithmName {
        get => this.get_HashAlgorithmName()
        set => this.put_HashAlgorithmName(value)
    }

    /**
     * Gets or sets a value that specifies whether the private key created for the request can be exported.
     * @remarks
     * By default, the private key is not exportable.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.exportable
     * @type {Integer} 
     */
    Exportable {
        get => this.get_Exportable()
        set => this.put_Exportable(value)
    }

    /**
     * Gets or sets the operation that can be performed by the private key created for this certificate request. The default value is **Signing**.
     * @remarks
     * The default key usage value is **Signing**.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.keyusages
     * @type {Integer} 
     */
    KeyUsages {
        get => this.get_KeyUsages()
        set => this.put_KeyUsages(value)
    }

    /**
     * Gets or sets the level of strong key protection.
     * @remarks
     * The default [KeyProtectionLevel](keyprotectionlevel.md) value is **NoConsent**. By default, therefore, strong key protection is not specified.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.keyprotectionlevel
     * @type {Integer} 
     */
    KeyProtectionLevel {
        get => this.get_KeyProtectionLevel()
        set => this.put_KeyProtectionLevel(value)
    }

    /**
     * Gets or sets the name of the key storage provider (KSP) that will be used to generate the private key.
     * @remarks
     * The name of a [cryptographic service provider](/windows/desktop/SecGloss/c-gly) ([CSP](/windows/desktop/SecCrypto/cryptographic-service-providers)) cannot be used.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.keystorageprovidername
     * @type {HSTRING} 
     */
    KeyStorageProviderName {
        get => this.get_KeyStorageProviderName()
        set => this.put_KeyStorageProviderName(value)
    }

    /**
     * Gets or sets the name of the smart card reader used to create the certificate request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.smartcardreadername
     * @type {HSTRING} 
     */
    SmartcardReaderName {
        get => this.get_SmartcardReaderName()
        set => this.put_SmartcardReaderName(value)
    }

    /**
     * Gets or sets the certificate used to sign the certificate request.
     * @remarks
     * The output of a signed request is a PKCS7 X509 certificate request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.signingcertificate
     * @type {Certificate} 
     */
    SigningCertificate {
        get => this.get_SigningCertificate()
        set => this.put_SigningCertificate(value)
    }

    /**
     * Gets or sets the CA exchange certificate that is used to encrypt a key attestation certificate request.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.attestationcredentialcertificate
     * @type {Certificate} 
     */
    AttestationCredentialCertificate {
        get => this.get_AttestationCredentialCertificate()
        set => this.put_AttestationCredentialCertificate(value)
    }

    /**
     * Gets or sets the name of the elliptic curve.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.curvename
     * @type {HSTRING} 
     */
    CurveName {
        get => this.get_CurveName()
        set => this.put_CurveName(value)
    }

    /**
     * Gets or sets the parameters of the elliptic curve.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.curveparameters
     */
    CurveParameters {
        get => this.get_CurveParameters()
        set => this.put_CurveParameters(value)
    }

    /**
     * Gets or sets the prefix of the container name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.containernameprefix
     * @type {HSTRING} 
     */
    ContainerNamePrefix {
        get => this.get_ContainerNamePrefix()
        set => this.put_ContainerNamePrefix(value)
    }

    /**
     * Gets or sets the container name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.containername
     * @type {HSTRING} 
     */
    ContainerName {
        get => this.get_ContainerName()
        set => this.put_ContainerName(value)
    }

    /**
     * Gets or sets whether to use the existing key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.useexistingkey
     * @type {Boolean} 
     */
    UseExistingKey {
        get => this.get_UseExistingKey()
        set => this.put_UseExistingKey(value)
    }

    /**
     * Gets a vector of suppressed defaults.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.suppresseddefaults
     * @type {IVector<HSTRING>} 
     */
    SuppressedDefaults {
        get => this.get_SuppressedDefaults()
    }

    /**
     * Gets the subject alternative name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.subjectalternativename
     * @type {SubjectAlternativeNameInfo} 
     */
    SubjectAlternativeName {
        get => this.get_SubjectAlternativeName()
    }

    /**
     * Gets a vector of certificate extensions.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificaterequestproperties.extensions
     * @type {IVector<CertificateExtension>} 
     */
    Extensions {
        get => this.get_Extensions()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the [CertificateRequestProperties](certificaterequestproperties.md).
     * @remarks
     * This method sets the following default values.
     * 
     * | Property | Default value |
     * |---|---|
     * | [Subject](certificaterequestproperties_subject.md) | Empty string |
     * | [KeyAlgorithmName](certificaterequestproperties_keyalgorithmname.md) | RSA |
     * | [KeySize](certificaterequestproperties_keysize.md) | 2048 bits |
     * | [FriendlyName](certificaterequestproperties_friendlyname.md) | Empty String |
     * | [HashAlgorithmName](certificaterequestproperties_hashalgorithmname.md) | SHA256 |
     * | [Exportable](certificaterequestproperties_exportable.md) | Not Exportable |
     * | [KeyUsages](certificaterequestproperties_keyusages.md) | Signing |
     * | [KeyProtectionLevel](certificaterequestproperties_keyprotectionlevel.md) | NoConsent |
     * | [KeyStorageProviderName](certificaterequestproperties_keystorageprovidername.md) | Microsoft Software Key Storage Provider |
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateRequestProperties")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.get_Subject()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subject(value) {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.put_Subject(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyAlgorithmName() {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.get_KeyAlgorithmName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_KeyAlgorithmName(value) {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.put_KeyAlgorithmName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeySize() {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.get_KeySize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_KeySize(value) {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.put_KeySize(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.get_FriendlyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FriendlyName(value) {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.put_FriendlyName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HashAlgorithmName() {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.get_HashAlgorithmName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_HashAlgorithmName(value) {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.put_HashAlgorithmName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Exportable() {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.get_Exportable()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Exportable(value) {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.put_Exportable(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyUsages() {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.get_KeyUsages()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_KeyUsages(value) {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.put_KeyUsages(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyProtectionLevel() {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.get_KeyProtectionLevel()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_KeyProtectionLevel(value) {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.put_KeyProtectionLevel(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyStorageProviderName() {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.get_KeyStorageProviderName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_KeyStorageProviderName(value) {
        if (!this.HasProp("__ICertificateRequestProperties")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties := ICertificateRequestProperties(outPtr)
        }

        return this.__ICertificateRequestProperties.put_KeyStorageProviderName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SmartcardReaderName() {
        if (!this.HasProp("__ICertificateRequestProperties2")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties2 := ICertificateRequestProperties2(outPtr)
        }

        return this.__ICertificateRequestProperties2.get_SmartcardReaderName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SmartcardReaderName(value) {
        if (!this.HasProp("__ICertificateRequestProperties2")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties2 := ICertificateRequestProperties2(outPtr)
        }

        return this.__ICertificateRequestProperties2.put_SmartcardReaderName(value)
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_SigningCertificate() {
        if (!this.HasProp("__ICertificateRequestProperties2")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties2 := ICertificateRequestProperties2(outPtr)
        }

        return this.__ICertificateRequestProperties2.get_SigningCertificate()
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_SigningCertificate(value) {
        if (!this.HasProp("__ICertificateRequestProperties2")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties2 := ICertificateRequestProperties2(outPtr)
        }

        return this.__ICertificateRequestProperties2.put_SigningCertificate(value)
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_AttestationCredentialCertificate() {
        if (!this.HasProp("__ICertificateRequestProperties2")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties2 := ICertificateRequestProperties2(outPtr)
        }

        return this.__ICertificateRequestProperties2.get_AttestationCredentialCertificate()
    }

    /**
     * 
     * @param {Certificate} value 
     * @returns {HRESULT} 
     */
    put_AttestationCredentialCertificate(value) {
        if (!this.HasProp("__ICertificateRequestProperties2")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties2 := ICertificateRequestProperties2(outPtr)
        }

        return this.__ICertificateRequestProperties2.put_AttestationCredentialCertificate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurveName() {
        if (!this.HasProp("__ICertificateRequestProperties3")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties3 := ICertificateRequestProperties3(outPtr)
        }

        return this.__ICertificateRequestProperties3.get_CurveName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CurveName(value) {
        if (!this.HasProp("__ICertificateRequestProperties3")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties3 := ICertificateRequestProperties3(outPtr)
        }

        return this.__ICertificateRequestProperties3.put_CurveName(value)
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_CurveParameters(value) {
        if (!this.HasProp("__ICertificateRequestProperties3")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties3 := ICertificateRequestProperties3(outPtr)
        }

        return this.__ICertificateRequestProperties3.get_CurveParameters(value)
    }

    /**
     * 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    put_CurveParameters(value_length, value) {
        if (!this.HasProp("__ICertificateRequestProperties3")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties3 := ICertificateRequestProperties3(outPtr)
        }

        return this.__ICertificateRequestProperties3.put_CurveParameters(value_length, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContainerNamePrefix() {
        if (!this.HasProp("__ICertificateRequestProperties3")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties3 := ICertificateRequestProperties3(outPtr)
        }

        return this.__ICertificateRequestProperties3.get_ContainerNamePrefix()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContainerNamePrefix(value) {
        if (!this.HasProp("__ICertificateRequestProperties3")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties3 := ICertificateRequestProperties3(outPtr)
        }

        return this.__ICertificateRequestProperties3.put_ContainerNamePrefix(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContainerName() {
        if (!this.HasProp("__ICertificateRequestProperties3")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties3 := ICertificateRequestProperties3(outPtr)
        }

        return this.__ICertificateRequestProperties3.get_ContainerName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContainerName(value) {
        if (!this.HasProp("__ICertificateRequestProperties3")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties3 := ICertificateRequestProperties3(outPtr)
        }

        return this.__ICertificateRequestProperties3.put_ContainerName(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseExistingKey() {
        if (!this.HasProp("__ICertificateRequestProperties3")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties3 := ICertificateRequestProperties3(outPtr)
        }

        return this.__ICertificateRequestProperties3.get_UseExistingKey()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseExistingKey(value) {
        if (!this.HasProp("__ICertificateRequestProperties3")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties3 := ICertificateRequestProperties3(outPtr)
        }

        return this.__ICertificateRequestProperties3.put_UseExistingKey(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SuppressedDefaults() {
        if (!this.HasProp("__ICertificateRequestProperties4")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties4 := ICertificateRequestProperties4(outPtr)
        }

        return this.__ICertificateRequestProperties4.get_SuppressedDefaults()
    }

    /**
     * 
     * @returns {SubjectAlternativeNameInfo} 
     */
    get_SubjectAlternativeName() {
        if (!this.HasProp("__ICertificateRequestProperties4")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties4 := ICertificateRequestProperties4(outPtr)
        }

        return this.__ICertificateRequestProperties4.get_SubjectAlternativeName()
    }

    /**
     * 
     * @returns {IVector<CertificateExtension>} 
     */
    get_Extensions() {
        if (!this.HasProp("__ICertificateRequestProperties4")) {
            if ((queryResult := this.QueryInterface(ICertificateRequestProperties4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateRequestProperties4 := ICertificateRequestProperties4(outPtr)
        }

        return this.__ICertificateRequestProperties4.get_Extensions()
    }

;@endregion Instance Methods
}
