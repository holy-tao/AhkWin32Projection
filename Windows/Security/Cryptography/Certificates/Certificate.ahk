#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICertificate.ahk
#Include .\ICertificate2.ahk
#Include .\ICertificate3.ahk
#Include .\ICertificateFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a cryptography certificate.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class Certificate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICertificate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICertificate.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Create a new instance of the [Certificate](certificate.md) class using the specified certificate data.
     * @param {IBuffer} certBlob The certificate data as an ASN.1 DER encoded certificate blob (.cer or .p7b).
     * @returns {Certificate} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.#ctor
     */
    static CreateCertificate(certBlob) {
        if (!Certificate.HasProp("__ICertificateFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.Certificate")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateFactory.IID)
            Certificate.__ICertificateFactory := ICertificateFactory(factoryPtr)
        }

        return Certificate.__ICertificateFactory.CreateCertificate(certBlob)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the serial number of the certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.serialnumber
     */
    SerialNumber {
        get => this.get_SerialNumber()
    }

    /**
     * Gets the subject name of the certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.subject
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * Gets the Common Name (CN) of the certificate issuer.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.issuer
     * @type {HSTRING} 
     */
    Issuer {
        get => this.get_Issuer()
    }

    /**
     * Gets a value indicating whether the certificate has a private key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.hasprivatekey
     * @type {Boolean} 
     */
    HasPrivateKey {
        get => this.get_HasPrivateKey()
    }

    /**
     * Gets a value that indicates whether the private key associated with the certificate is strongly protected.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.isstronglyprotected
     * @type {Boolean} 
     */
    IsStronglyProtected {
        get => this.get_IsStronglyProtected()
    }

    /**
     * Gets the date and time after which the certificate is valid.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.validfrom
     * @type {DateTime} 
     */
    ValidFrom {
        get => this.get_ValidFrom()
    }

    /**
     * Gets the date and time after which the certificate is no longer valid.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.validto
     * @type {DateTime} 
     */
    ValidTo {
        get => this.get_ValidTo()
    }

    /**
     * Gets a collection of object identifiers (OIDs) for the enhanced key usage extension.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.enhancedkeyusages
     * @type {IVectorView<HSTRING>} 
     */
    EnhancedKeyUsages {
        get => this.get_EnhancedKeyUsages()
    }

    /**
     * Gets or sets the friendly name for the certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
        set => this.put_FriendlyName(value)
    }

    /**
     * Gets whether the security device is bound.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.issecuritydevicebound
     * @type {Boolean} 
     */
    IsSecurityDeviceBound {
        get => this.get_IsSecurityDeviceBound()
    }

    /**
     * Gets the key uses for the certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.keyusages
     * @type {CertificateKeyUsages} 
     */
    KeyUsages {
        get => this.get_KeyUsages()
    }

    /**
     * Gets the name of the cryptographic algorithm used to create the key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.keyalgorithmname
     * @type {HSTRING} 
     */
    KeyAlgorithmName {
        get => this.get_KeyAlgorithmName()
    }

    /**
     * Gets the signature algorithm name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.signaturealgorithmname
     * @type {HSTRING} 
     */
    SignatureAlgorithmName {
        get => this.get_SignatureAlgorithmName()
    }

    /**
     * Gets the signature hash algorithm name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.signaturehashalgorithmname
     * @type {HSTRING} 
     */
    SignatureHashAlgorithmName {
        get => this.get_SignatureHashAlgorithmName()
    }

    /**
     * Gets info on the subject alternative name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.subjectalternativename
     * @type {SubjectAlternativeNameInfo} 
     */
    SubjectAlternativeName {
        get => this.get_SubjectAlternativeName()
    }

    /**
     * Gets whether the certificate is per-user.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.isperuser
     * @type {Boolean} 
     */
    IsPerUser {
        get => this.get_IsPerUser()
    }

    /**
     * Gets the certificate's store name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.storename
     * @type {HSTRING} 
     */
    StoreName {
        get => this.get_StoreName()
    }

    /**
     * Gets the certificate's key storage provider name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.keystorageprovidername
     * @type {HSTRING} 
     */
    KeyStorageProviderName {
        get => this.get_KeyStorageProviderName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Build a certificate chain for the specified certificates starting from the end entity certificate to the root using the specified chain building parameters.
     * @param {IIterable<Certificate>} certificates The intermediate certificates to use when building the certificate chain.
     * @returns {IAsyncOperation<CertificateChain>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.buildchainasync
     */
    BuildChainAsync(certificates) {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.BuildChainAsync(certificates)
    }

    /**
     * Build a certificate chain for the specified certificates starting from the end entity certificate to the root.
     * @param {IIterable<Certificate>} certificates The intermediate certificates to use when building the certificate chain.
     * @param {ChainBuildingParameters} parameters 
     * @returns {IAsyncOperation<CertificateChain>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.buildchainasync
     */
    BuildChainWithParametersAsync(certificates, parameters) {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.BuildChainWithParametersAsync(certificates, parameters)
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_SerialNumber(value) {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.get_SerialNumber(value)
    }

    /**
     * Gets the hash value for the certificate for a specified algorithm.
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} The hash value of the certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.gethashvalue
     */
    GetHashValue(value) {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.GetHashValue(value)
    }

    /**
     * Gets the SHA1 hash value for the certificate.
     * @param {HSTRING} hashAlgorithmName 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} The SHA1 hash value for the certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.gethashvalue
     */
    GetHashValueWithAlgorithm(hashAlgorithmName, value) {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.GetHashValueWithAlgorithm(hashAlgorithmName, value)
    }

    /**
     * Gets the ASN.1 DER encoded certificate blob.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificate.getcertificateblob
     */
    GetCertificateBlob() {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.GetCertificateBlob()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.get_Subject()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Issuer() {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.get_Issuer()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasPrivateKey() {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.get_HasPrivateKey()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStronglyProtected() {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.get_IsStronglyProtected()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ValidFrom() {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.get_ValidFrom()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ValidTo() {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.get_ValidTo()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_EnhancedKeyUsages() {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.get_EnhancedKeyUsages()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FriendlyName(value) {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.put_FriendlyName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        if (!this.HasProp("__ICertificate")) {
            if ((queryResult := this.QueryInterface(ICertificate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate := ICertificate(outPtr)
        }

        return this.__ICertificate.get_FriendlyName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSecurityDeviceBound() {
        if (!this.HasProp("__ICertificate2")) {
            if ((queryResult := this.QueryInterface(ICertificate2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate2 := ICertificate2(outPtr)
        }

        return this.__ICertificate2.get_IsSecurityDeviceBound()
    }

    /**
     * 
     * @returns {CertificateKeyUsages} 
     */
    get_KeyUsages() {
        if (!this.HasProp("__ICertificate2")) {
            if ((queryResult := this.QueryInterface(ICertificate2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate2 := ICertificate2(outPtr)
        }

        return this.__ICertificate2.get_KeyUsages()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyAlgorithmName() {
        if (!this.HasProp("__ICertificate2")) {
            if ((queryResult := this.QueryInterface(ICertificate2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate2 := ICertificate2(outPtr)
        }

        return this.__ICertificate2.get_KeyAlgorithmName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SignatureAlgorithmName() {
        if (!this.HasProp("__ICertificate2")) {
            if ((queryResult := this.QueryInterface(ICertificate2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate2 := ICertificate2(outPtr)
        }

        return this.__ICertificate2.get_SignatureAlgorithmName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SignatureHashAlgorithmName() {
        if (!this.HasProp("__ICertificate2")) {
            if ((queryResult := this.QueryInterface(ICertificate2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate2 := ICertificate2(outPtr)
        }

        return this.__ICertificate2.get_SignatureHashAlgorithmName()
    }

    /**
     * 
     * @returns {SubjectAlternativeNameInfo} 
     */
    get_SubjectAlternativeName() {
        if (!this.HasProp("__ICertificate2")) {
            if ((queryResult := this.QueryInterface(ICertificate2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate2 := ICertificate2(outPtr)
        }

        return this.__ICertificate2.get_SubjectAlternativeName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPerUser() {
        if (!this.HasProp("__ICertificate3")) {
            if ((queryResult := this.QueryInterface(ICertificate3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate3 := ICertificate3(outPtr)
        }

        return this.__ICertificate3.get_IsPerUser()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StoreName() {
        if (!this.HasProp("__ICertificate3")) {
            if ((queryResult := this.QueryInterface(ICertificate3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate3 := ICertificate3(outPtr)
        }

        return this.__ICertificate3.get_StoreName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyStorageProviderName() {
        if (!this.HasProp("__ICertificate3")) {
            if ((queryResult := this.QueryInterface(ICertificate3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificate3 := ICertificate3(outPtr)
        }

        return this.__ICertificate3.get_KeyStorageProviderName()
    }

;@endregion Instance Methods
}
