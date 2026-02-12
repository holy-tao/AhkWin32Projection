#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAsymmetricAlgorithmNamesStatics.ahk
#Include .\IAsymmetricAlgorithmNamesStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains static properties that enable you to retrieve algorithm names that can be used in the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method of the [AsymmetricKeyAlgorithmProvider](asymmetrickeyalgorithmprovider.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class AsymmetricAlgorithmNames extends IInspectable {
;@region Static Properties
    /**
     * Retrieves a string that contains "RSA_PKCS1".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA public key algorithm that uses PKCS1 to pad the plaintext. No hash algorithm is used.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsapkcs1
     * @type {HSTRING} 
     */
    static RsaPkcs1 {
        get => AsymmetricAlgorithmNames.get_RsaPkcs1()
    }

    /**
     * Retrieves a string that contains "RSA_OAEP_SHA1".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA algorithm that uses Optimal Asymmetric Encryption Padding (OAEP) to encode or pad the plaintext and a Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the SHA1 hash is 160 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsaoaepsha1
     * @type {HSTRING} 
     */
    static RsaOaepSha1 {
        get => AsymmetricAlgorithmNames.get_RsaOaepSha1()
    }

    /**
     * Retrieves a string that contains "RSA_OAEP_SHA256".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA algorithm that uses Optimal Asymmetric Encryption Padding (OAEP) to encode or pad the plaintext and a Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the SHA hash is 256 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsaoaepsha256
     * @type {HSTRING} 
     */
    static RsaOaepSha256 {
        get => AsymmetricAlgorithmNames.get_RsaOaepSha256()
    }

    /**
     * Retrieves a string that contains "RSA_OAEP_SHA384".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA algorithm that uses Optimal Asymmetric Encryption Padding (OAEP) to encode or pad the plaintext and a Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the SHA hash is 384 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsaoaepsha384
     * @type {HSTRING} 
     */
    static RsaOaepSha384 {
        get => AsymmetricAlgorithmNames.get_RsaOaepSha384()
    }

    /**
     * Retrieves a string that contains "RSA_OAEP_SHA512".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA algorithm that uses Optimal Asymmetric Encryption Padding (OAEP) to encode or pad the plaintext and a Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the SHA hash is 512 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsaoaepsha512
     * @type {HSTRING} 
     */
    static RsaOaepSha512 {
        get => AsymmetricAlgorithmNames.get_RsaOaepSha512()
    }

    /**
     * Retrieves a string that contains "ECDSA_P256_SHA256".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an Elliptic Curve Digital Signature Algorithm (ECDSA) that uses a 256-bit public key and a Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the hash is 256 bits.
     * 
     * > [!NOTE]
     * > You must specify a value of 256 when calling the [CreateKeyPair](asymmetrickeyalgorithmprovider_createkeypair_920965104.md) method to create keys that are compatible with this algorithm.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.ecdsap256sha256
     * @type {HSTRING} 
     */
    static EcdsaP256Sha256 {
        get => AsymmetricAlgorithmNames.get_EcdsaP256Sha256()
    }

    /**
     * Retrieves a string that contains "ECDSA_P384_SHA384".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an Elliptic Curve Digital Signature Algorithm (ECDSA) that uses a 384-bit public key and a Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the hash is 384 bits.
     * 
     * > [!NOTE]
     * > You must specify a value of 384 when calling the [CreateKeyPair](asymmetrickeyalgorithmprovider_createkeypair_920965104.md) method to create keys that are compatible with this algorithm.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.ecdsap384sha384
     * @type {HSTRING} 
     */
    static EcdsaP384Sha384 {
        get => AsymmetricAlgorithmNames.get_EcdsaP384Sha384()
    }

    /**
     * Retrieves a string that contains "ECDSA_P521_SHA512".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an Elliptic Curve Digital Signature Algorithm (ECDSA) that uses a 521-bit public key and a Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the hash is 512 bits.
     * 
     * > [!NOTE]
     * > You must specify a value of 521 when calling the [CreateKeyPair](asymmetrickeyalgorithmprovider_createkeypair_920965104.md) method to create keys that are compatible with this algorithm.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.ecdsap521sha512
     * @type {HSTRING} 
     */
    static EcdsaP521Sha512 {
        get => AsymmetricAlgorithmNames.get_EcdsaP521Sha512()
    }

    /**
     * Retrieves a string that contains "DSA_SHA1".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents a Digital Signature Algorithm (DSA) that uses the Secure Hashing Algorithm 1 (SHA1) to hash the message contents before signing. The length of the hash is 160 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.dsasha1
     * @type {HSTRING} 
     */
    static DsaSha1 {
        get => AsymmetricAlgorithmNames.get_DsaSha1()
    }

    /**
     * Retrieves a string that contains "DSA_SHA256".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents a Digital Signature Algorithm (DSA) that uses the Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the hash is 256 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.dsasha256
     * @type {HSTRING} 
     */
    static DsaSha256 {
        get => AsymmetricAlgorithmNames.get_DsaSha256()
    }

    /**
     * Retrieves a string that contains "RSASIGN_PKCS1_SHA1".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA signing algorithm that uses PKCS1 to pad the plaintext and the Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the SHA hash is 160 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpkcs1sha1
     * @type {HSTRING} 
     */
    static RsaSignPkcs1Sha1 {
        get => AsymmetricAlgorithmNames.get_RsaSignPkcs1Sha1()
    }

    /**
     * Retrieves a string that contains "RSASIGN_PKCS1_SHA256".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA signing algorithm that uses PKCS1 to pad the plaintext and the Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the SHA hash is 256 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpkcs1sha256
     * @type {HSTRING} 
     */
    static RsaSignPkcs1Sha256 {
        get => AsymmetricAlgorithmNames.get_RsaSignPkcs1Sha256()
    }

    /**
     * Retrieves a string that contains "RSASIGN_PKCS1_SHA384".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA signing algorithm that uses PKCS1 to pad the plaintext and the Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the SHA hash is 384 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpkcs1sha384
     * @type {HSTRING} 
     */
    static RsaSignPkcs1Sha384 {
        get => AsymmetricAlgorithmNames.get_RsaSignPkcs1Sha384()
    }

    /**
     * Retrieves a string that contains "RSASIGN_PSS_SHA512".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA signing algorithm that uses PKCS1 to pad the plaintext and the Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the SHA hash is 512 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpkcs1sha512
     * @type {HSTRING} 
     */
    static RsaSignPkcs1Sha512 {
        get => AsymmetricAlgorithmNames.get_RsaSignPkcs1Sha512()
    }

    /**
     * Retrieves a string that contains "RSASIGN_PSS_SHA1".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA signing algorithm that uses the Probabilistic Signature Scheme (PSS) to pad the plaintext and the Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the SHA hash is 160 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpsssha1
     * @type {HSTRING} 
     */
    static RsaSignPssSha1 {
        get => AsymmetricAlgorithmNames.get_RsaSignPssSha1()
    }

    /**
     * Retrieves a string that contains "RSASIGN_PSS_SHA256".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA signing algorithm that uses the Probabilistic Signature Scheme (PSS) to pad the plaintext and the Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the SHA hash is 256 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpsssha256
     * @type {HSTRING} 
     */
    static RsaSignPssSha256 {
        get => AsymmetricAlgorithmNames.get_RsaSignPssSha256()
    }

    /**
     * Retrieves a string that contains "RSASIGN_PSS_SHA384".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA signing algorithm that uses the Probabilistic Signature Scheme (PSS) to pad the plaintext and the Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the SHA hash is 384 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpsssha384
     * @type {HSTRING} 
     */
    static RsaSignPssSha384 {
        get => AsymmetricAlgorithmNames.get_RsaSignPssSha384()
    }

    /**
     * Retrieves a string that contains "RSASIGN_PSS_SHA512".
     * @remarks
     * Use the string retrieved by this property to set the asymmetric algorithm name when you call the [OpenAlgorithm](asymmetrickeyalgorithmprovider_openalgorithm_637226074.md) method. The string represents an RSA signing algorithm that uses the Probabilistic Signature Scheme (PSS) to pad the plaintext and the Secure Hashing Algorithm (SHA) to hash the message contents before signing. The length of the SHA hash is 512 bits.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.rsasignpsssha512
     * @type {HSTRING} 
     */
    static RsaSignPssSha512 {
        get => AsymmetricAlgorithmNames.get_RsaSignPssSha512()
    }

    /**
     * Retrieves a string that contains "ECDSA_SHA256".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.ecdsasha256
     * @type {HSTRING} 
     */
    static EcdsaSha256 {
        get => AsymmetricAlgorithmNames.get_EcdsaSha256()
    }

    /**
     * Retrieves a string that contains "ECDSA_SHA384".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.ecdsasha384
     * @type {HSTRING} 
     */
    static EcdsaSha384 {
        get => AsymmetricAlgorithmNames.get_EcdsaSha384()
    }

    /**
     * Retrieves a string that contains "ECDSA_SHA512".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.asymmetricalgorithmnames.ecdsasha512
     * @type {HSTRING} 
     */
    static EcdsaSha512 {
        get => AsymmetricAlgorithmNames.get_EcdsaSha512()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaPkcs1() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaPkcs1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaOaepSha1() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaOaepSha1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaOaepSha256() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaOaepSha256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaOaepSha384() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaOaepSha384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaOaepSha512() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaOaepSha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_EcdsaP256Sha256() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_EcdsaP256Sha256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_EcdsaP384Sha384() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_EcdsaP384Sha384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_EcdsaP521Sha512() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_EcdsaP521Sha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DsaSha1() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_DsaSha1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DsaSha256() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_DsaSha256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaSignPkcs1Sha1() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaSignPkcs1Sha1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaSignPkcs1Sha256() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaSignPkcs1Sha256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaSignPkcs1Sha384() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaSignPkcs1Sha384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaSignPkcs1Sha512() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaSignPkcs1Sha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaSignPssSha1() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaSignPssSha1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaSignPssSha256() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaSignPssSha256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaSignPssSha384() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaSignPssSha384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RsaSignPssSha512() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics := IAsymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics.get_RsaSignPssSha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_EcdsaSha256() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics2.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics2 := IAsymmetricAlgorithmNamesStatics2(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics2.get_EcdsaSha256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_EcdsaSha384() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics2.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics2 := IAsymmetricAlgorithmNamesStatics2(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics2.get_EcdsaSha384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_EcdsaSha512() {
        if (!AsymmetricAlgorithmNames.HasProp("__IAsymmetricAlgorithmNamesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.AsymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAsymmetricAlgorithmNamesStatics2.IID)
            AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics2 := IAsymmetricAlgorithmNamesStatics2(factoryPtr)
        }

        return AsymmetricAlgorithmNames.__IAsymmetricAlgorithmNamesStatics2.get_EcdsaSha512()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
