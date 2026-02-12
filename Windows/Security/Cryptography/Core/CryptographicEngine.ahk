#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICryptographicEngineStatics.ahk
#Include .\ICryptographicEngineStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encrypts, decrypts, and signs content, and verifies digital signatures.
 * @remarks
 * This class contains only static methods. You do not have to create an instance of the class to use the methods. Instead, use the class name followed by the dot operator (.), followed by the method name.
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class CryptographicEngine extends IInspectable {
;@region Static Methods
    /**
     * Encrypts data by using a symmetric or asymmetric algorithm.
     * @remarks
     * Of the symmetric algorithms supported by Microsoft, the following require an initialization vector:
     * 
     * 
     * + [SymmetricAlgorithmNames.DesCbc](symmetricalgorithmnames_descbc.md)
     * + [SymmetricAlgorithmNames.TripleDesCbc](symmetricalgorithmnames_tripledescbc.md)
     * + [SymmetricAlgorithmNames.Rc2Cbc](symmetricalgorithmnames_rc2cbc.md)
     * + [SymmetricAlgorithmNames.AesCbc](symmetricalgorithmnames_aescbc.md)
     * + [SymmetricAlgorithmNames.AesCbcPkcs7](symmetricalgorithmnames_aescbcpkcs7.md)
     * + [SymmetricAlgorithmNames.DesCbcPkcs7](symmetricalgorithmnames_descbcpkcs7.md)
     * + [SymmetricAlgorithmNames.TripleDesCbcPkcs7](symmetricalgorithmnames_tripledescbcpkcs7.md)
     * + [SymmetricAlgorithmNames.Rc2CbcPkcs7](symmetricalgorithmnames_rc2cbcpkcs7.md)
     * + [SymmetricAlgorithmNames.Rc2EcbPkcs7](symmetricalgorithmnames_rc2ecbpkcs7.md)
     * @param {CryptographicKey} key Cryptographic key to use for encryption. This can be an asymmetric or a symmetric key. For more information, see [AsymmetricKeyAlgorithmProvider](asymmetrickeyalgorithmprovider.md) and [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md).
     * @param {IBuffer} data Data to encrypt.
     * @param {IBuffer} iv Buffer that contains the initialization vector. This can be **null** for a symmetric algorithm and should always be **null** for an asymmetric algorithm. If an initialization vector (IV) was used to encrypt the data, you must use the same IV to decrypt the data. You can use the [GenerateRandom](../windows.security.cryptography/cryptographicbuffer_generaterandom_1645545930.md) method to create an IV that contains random data. Other IVs, such as nonce-generated vectors, require custom implementation. For more information, see [Cryptographic keys](/windows/uwp/security/cryptographic-keys).
     * 
     * Cipher block chaining (CBC) block cipher mode algorithms require an initialization vector. For more information, see Remarks.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine.encrypt
     */
    static Encrypt(key, data, iv) {
        if (!CryptographicEngine.HasProp("__ICryptographicEngineStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.CryptographicEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicEngineStatics.IID)
            CryptographicEngine.__ICryptographicEngineStatics := ICryptographicEngineStatics(factoryPtr)
        }

        return CryptographicEngine.__ICryptographicEngineStatics.Encrypt(key, data, iv)
    }

    /**
     * Decrypts content that was previously encrypted by using a symmetric or asymmetric algorithm.
     * @remarks
     * The *key* parameter can be a persisted key obtained from a certificate using the [PersistedKeyProvider](persistedkeyprovider.md) class.
     * 
     * If the key is a persisted key and the decrypt operation requires UI or takes a long time, use the [DecryptAsync](cryptographicengine_decryptasync_155595670.md) method instead. For example, UI is required when decrypting using a key that is strongly protected. In the case where a persisted key is used and UI is expected, use the [DecryptAsync](cryptographicengine_decryptasync_155595670.md) method as the Decrypt method will fail.
     * @param {CryptographicKey} key Cryptographic key to use for decryption. This can be an asymmetric or a symmetric key. For more information, see [AsymmetricKeyAlgorithmProvider](asymmetrickeyalgorithmprovider.md) and [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md).
     * @param {IBuffer} data Buffer that contains the encrypted data.
     * @param {IBuffer} iv Buffer that contains the initialization vector. If an initialization vector (IV) was used to encrypt the data, you must use the same IV to decrypt the data. For more information, see [Encrypt](cryptographicengine_encrypt_241662071.md).
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine.decrypt
     */
    static Decrypt(key, data, iv) {
        if (!CryptographicEngine.HasProp("__ICryptographicEngineStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.CryptographicEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicEngineStatics.IID)
            CryptographicEngine.__ICryptographicEngineStatics := ICryptographicEngineStatics(factoryPtr)
        }

        return CryptographicEngine.__ICryptographicEngineStatics.Decrypt(key, data, iv)
    }

    /**
     * Performs authenticated encryption.
     * @remarks
     * Authenticated encryption encrypts and authenticates content in one operation. An authenticator, also called a tag, is used during encryption and the output of the process contains a tag-ciphertext pair. For more information, see the [AuthenticationTag](encryptedandauthenticateddata_authenticationtag.md) and [EncryptedData](encryptedandauthenticateddata_encrypteddata.md) properties. The decryption process verifies the ciphertext against the tag.
     * 
     * You can use an authenticated encryption algorithm after calling the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on the [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) class and specifying the name of the algorithm to open. The following algorithm names are supported for authenticated encryption and decryption:
     * 
     * 
     * + [SymmetricAlgorithmNames.AesGcm](symmetricalgorithmnames_aesgcm.md)
     * + [SymmetricAlgorithmNames.AesCcm](symmetricalgorithmnames_aesccm.md)
     * For a complete sample that contains the following code example, see the [EncryptedAndAuthenticatedData](encryptedandauthenticateddata.md) class.
     * @param {CryptographicKey} key Symmetric key to use for encryption.
     * @param {IBuffer} data Data to be encrypted and authenticated.
     * @param {IBuffer} nonce Nonce to be used. A nonce is a variable that has minimal chance of repeating. For example, you can use a random value that is newly generated for each use, a time stamp, a sequence number, or some combination of these. The Microsoft GCM implementation requires a 12-byte nonce. The CCM implementation requires a 7- to 13- byte nonce.
     * @param {IBuffer} authenticatedData Authenticated data. This can be **Null**.
     * @returns {EncryptedAndAuthenticatedData} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine.encryptandauthenticate
     */
    static EncryptAndAuthenticate(key, data, nonce, authenticatedData) {
        if (!CryptographicEngine.HasProp("__ICryptographicEngineStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.CryptographicEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicEngineStatics.IID)
            CryptographicEngine.__ICryptographicEngineStatics := ICryptographicEngineStatics(factoryPtr)
        }

        return CryptographicEngine.__ICryptographicEngineStatics.EncryptAndAuthenticate(key, data, nonce, authenticatedData)
    }

    /**
     * Decrypts and authenticates data. For more information and a complete code sample, see [EncryptedAndAuthenticatedData](encryptedandauthenticateddata.md).
     * @remarks
     * Authenticated encryption encrypts and authenticates content in one operation. An authenticator, also called a tag, is used during encryption and the output of the process contains a tag-ciphertext pair. For more information, see the [AuthenticationTag](encryptedandauthenticateddata_authenticationtag.md) and [EncryptedData](encryptedandauthenticateddata_encrypteddata.md) properties. The decryption process verifies the ciphertext against the tag.
     * 
     * You can use an authenticated encryption algorithm after calling the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on the [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) class and specifying the name of the algorithm to open. The following algorithm names are supported for authenticated encryption and decryption:
     * 
     * 
     * + [SymmetricAlgorithmNames.AesGcm](symmetricalgorithmnames_aesgcm.md)
     * + [SymmetricAlgorithmNames.AesCcm](symmetricalgorithmnames_aesccm.md)
     * For a complete sample that contains the following code example, see the [EncryptedAndAuthenticatedData](encryptedandauthenticateddata.md) class.
     * @param {CryptographicKey} key Symmetric key to use.
     * @param {IBuffer} data Data to be decrypted and authenticated.
     * @param {IBuffer} nonce Nonce to be used. This must be the same nonce used by the [EncryptAndAuthenticate](cryptographicengine_encryptandauthenticate_1818879716.md) method.
     * @param {IBuffer} authenticationTag Authentication tag.
     * @param {IBuffer} authenticatedData Authenticated data. This can be **Null**.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine.decryptandauthenticate
     */
    static DecryptAndAuthenticate(key, data, nonce, authenticationTag, authenticatedData) {
        if (!CryptographicEngine.HasProp("__ICryptographicEngineStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.CryptographicEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicEngineStatics.IID)
            CryptographicEngine.__ICryptographicEngineStatics := ICryptographicEngineStatics(factoryPtr)
        }

        return CryptographicEngine.__ICryptographicEngineStatics.DecryptAndAuthenticate(key, data, nonce, authenticationTag, authenticatedData)
    }

    /**
     * Signs digital content. For more information, see [MACs, hashes, and signatures](/windows/uwp/security/macs-hashes-and-signatures).
     * @remarks
     * If the key is a persisted key and the operation requires UI or takes a long time, use the [SignAsync](cryptographicengine_signasync_345302432.md) method instead.
     * 
     * For more information about signing digital data, see [MACs, hashes, and signatures](/windows/uwp/security/macs-hashes-and-signatures).
     * @param {CryptographicKey} key Key used for signing.
     * @param {IBuffer} data Data to be signed.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine.sign
     */
    static Sign(key, data) {
        if (!CryptographicEngine.HasProp("__ICryptographicEngineStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.CryptographicEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicEngineStatics.IID)
            CryptographicEngine.__ICryptographicEngineStatics := ICryptographicEngineStatics(factoryPtr)
        }

        return CryptographicEngine.__ICryptographicEngineStatics.Sign(key, data)
    }

    /**
     * Verifies a message signature.
     * @remarks
     * To sign content, the sender typically creates a hash over the message, signs (encrypts) the hash, and then sends both the signature and the unencrypted message. The recipient uses the same key and algorithm to calculate a hash over the message, decrypts the signature, and compares the decrypted signature to the hash value. If they match, the recipient can be fairly certain that the message did, in fact, come from the sender and was not altered during transmission. For more information, see [MACs, hashes, and signatures](/windows/uwp/security/macs-hashes-and-signatures).
     * @param {CryptographicKey} key Key used for verification. This must be the same key previously used to sign the message.
     * @param {IBuffer} data Message to be verified.
     * @param {IBuffer} signature Signature previously computed over the message to be verified.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine.verifysignature
     */
    static VerifySignature(key, data, signature) {
        if (!CryptographicEngine.HasProp("__ICryptographicEngineStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.CryptographicEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicEngineStatics.IID)
            CryptographicEngine.__ICryptographicEngineStatics := ICryptographicEngineStatics(factoryPtr)
        }

        return CryptographicEngine.__ICryptographicEngineStatics.VerifySignature(key, data, signature)
    }

    /**
     * Derives a key from another key by using a key derivation function. For more information, see the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) and [KeyDerivationParameters](keyderivationparameters.md) classes.
     * @remarks
     * Deriving keys requires that you use the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) and [KeyDerivationParameters](keyderivationparameters.md) classes. The following key derivation functions can be used:
     * + [BuildForPbkdf2](keyderivationparameters_buildforpbkdf2_636237279.md)
     * + [BuildForSP800108](keyderivationparameters_buildforsp800108_1459175055.md)
     * + [BuildForSP80056a](keyderivationparameters_buildforsp80056a_870294687.md)
     * 
     * 
     * For a complete sample that contains the following code example, see the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class.
     * @param {CryptographicKey} key The symmetric or secret key used for derivation.
     * @param {KeyDerivationParameters} parameters Derivation parameters. The parameters vary depending on the type of KDF algorithm used.
     * @param {Integer} desiredKeySize Requested size, in bytes, of the derived key.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine.derivekeymaterial
     */
    static DeriveKeyMaterial(key, parameters, desiredKeySize) {
        if (!CryptographicEngine.HasProp("__ICryptographicEngineStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.CryptographicEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicEngineStatics.IID)
            CryptographicEngine.__ICryptographicEngineStatics := ICryptographicEngineStatics(factoryPtr)
        }

        return CryptographicEngine.__ICryptographicEngineStatics.DeriveKeyMaterial(key, parameters, desiredKeySize)
    }

    /**
     * Signs the hashed input data using the specified key.
     * @remarks
     * <!--<rem  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">If the <mark type="param">key</mark> parameter is a persisted key, user input may be required for a hardware key, strongly protected key, or shared user key.</rem>-->
     * The input data supplied to the SignHashedData method is a hashed value. To sign raw data that has not been hashed, use the [SignAsync](cryptographicengine_signasync_345302432.md) method.
     * 
     * If the key is a persisted key and the operation requires UI or takes a long time, use the [SignHashedDataAsync](cryptographicengine_signhasheddataasync_820020633.md) method instead.
     * @param {CryptographicKey} key The key to use to sign the hash. This key must be an asymmetric key obtained from a [PersistedKeyProvider](persistedkeyprovider.md) or [AsymmetricKeyAlgorithmProvider](asymmetrickeyalgorithmprovider.md).
     * @param {IBuffer} data The input data to sign. The data is a hashed value which can be obtained through incremental hash.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine.signhasheddata
     */
    static SignHashedData(key, data) {
        if (!CryptographicEngine.HasProp("__ICryptographicEngineStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.CryptographicEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicEngineStatics2.IID)
            CryptographicEngine.__ICryptographicEngineStatics2 := ICryptographicEngineStatics2(factoryPtr)
        }

        return CryptographicEngine.__ICryptographicEngineStatics2.SignHashedData(key, data)
    }

    /**
     * Verifies the signature of the specified input data against a known signature.
     * @param {CryptographicKey} key The key to use to retrieve the signature from the input data. This key must be an asymmetric key obtained from a [PersistedKeyProvider](persistedkeyprovider.md) or [AsymmetricKeyAlgorithmProvider](asymmetrickeyalgorithmprovider.md).
     * @param {IBuffer} data The data to be verified. The data is a hashed value of raw data.
     * @param {IBuffer} signature The known signature to use to verify the signature of the input data.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine.verifysignaturewithhashinput
     */
    static VerifySignatureWithHashInput(key, data, signature) {
        if (!CryptographicEngine.HasProp("__ICryptographicEngineStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.CryptographicEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicEngineStatics2.IID)
            CryptographicEngine.__ICryptographicEngineStatics2 := ICryptographicEngineStatics2(factoryPtr)
        }

        return CryptographicEngine.__ICryptographicEngineStatics2.VerifySignatureWithHashInput(key, data, signature)
    }

    /**
     * Decrypts the encrypted input data using the supplied key.
     * @remarks
     * If the key is a persisted key and the decrypt operation requires UI or takes a long time, use the DecryptAsync method instead of the [Decrypt](cryptographicengine_decrypt_258898008.md) method. For example, UI is required when decrypting using a key that is strongly protected.
     * @param {CryptographicKey} key The key to use to decrypt the encrypted input data.
     * @param {IBuffer} data The encrypted data to decrypt.
     * @param {IBuffer} iv The initial vector for a symmetric key. For an asymmetric key, set this value to null.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine.decryptasync
     */
    static DecryptAsync(key, data, iv) {
        if (!CryptographicEngine.HasProp("__ICryptographicEngineStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.CryptographicEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicEngineStatics2.IID)
            CryptographicEngine.__ICryptographicEngineStatics2 := ICryptographicEngineStatics2(factoryPtr)
        }

        return CryptographicEngine.__ICryptographicEngineStatics2.DecryptAsync(key, data, iv)
    }

    /**
     * Computes a hash for the supplied input data, and then signs the computed hash using the specified key.
     * @remarks
     * <!--<rem  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">If the <mark type="param">key</mark> parameter is a persisted key, user input may be required for a hardware key, strongly protected key, or shared user key.</rem>-->
     * The input data supplied to the SignAsync method is raw data that has not been hashed. To sign hashed data, use the [SignHashedDataAsync](cryptographicengine_signhasheddataasync_820020633.md) method.
     * 
     * If the key is a persisted key and the operation requires UI or takes a long time, use the SignAsync method instead of the [Sign](cryptographicengine_sign_1920728718.md) method.
     * @param {CryptographicKey} key The key to use to compute and sign the hash.
     * @param {IBuffer} data The raw input data to sign. The data is not hashed.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine.signasync
     */
    static SignAsync(key, data) {
        if (!CryptographicEngine.HasProp("__ICryptographicEngineStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.CryptographicEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicEngineStatics2.IID)
            CryptographicEngine.__ICryptographicEngineStatics2 := ICryptographicEngineStatics2(factoryPtr)
        }

        return CryptographicEngine.__ICryptographicEngineStatics2.SignAsync(key, data)
    }

    /**
     * Signs the hashed input data using the specified key.
     * @remarks
     * <!--<rem  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">If the <mark type="param">key</mark> parameter is a persisted key, user input may be required for a hardware key, strongly protected key, or shared user key.</rem>-->
     * The input data supplied to the SignHashedDataAsync method is a hashed value. To sign raw data that has not been hashed, use the [SignAsync](cryptographicengine_signasync_345302432.md) method.
     * 
     * If the key is a persisted key and the operation requires UI or takes a long time, use the SignHashedDataAsync method instead of the [SignHashedData](cryptographicengine_signhasheddata_1250888265.md) method.
     * @param {CryptographicKey} key The key to use to sign the hash. This key must be an asymmetric key obtained from a [PersistedKeyProvider](persistedkeyprovider.md) or [AsymmetricKeyAlgorithmProvider](asymmetrickeyalgorithmprovider.md).
     * @param {IBuffer} data The input data to sign. The data is a hashed value which can be obtained through incremental hash.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographicengine.signhasheddataasync
     */
    static SignHashedDataAsync(key, data) {
        if (!CryptographicEngine.HasProp("__ICryptographicEngineStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.CryptographicEngine")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICryptographicEngineStatics2.IID)
            CryptographicEngine.__ICryptographicEngineStatics2 := ICryptographicEngineStatics2(factoryPtr)
        }

        return CryptographicEngine.__ICryptographicEngineStatics2.SignHashedDataAsync(key, data)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
