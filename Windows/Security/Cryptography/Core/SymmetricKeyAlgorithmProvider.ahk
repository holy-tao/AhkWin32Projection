#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISymmetricKeyAlgorithmProvider.ahk
#Include .\ISymmetricKeyAlgorithmProviderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a provider of symmetric key algorithms. For more information, see [Cryptographic keys](/windows/uwp/security/cryptographic-keys).
 * @remarks
 * You create a SymmetricKeyAlgorithmProvider object by calling the static [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method and specifying one of the following algorithm names.
 * 
 * 
 * + No padding:+ DES_CBC
 * + DES_ECB
 * + 3DES_CBC
 * + 3DES_ECB
 * + RC2_CBC
 * + RC2_ECB
 * + AES_CBC
 * + AES_ECB
 * 
 * + PKCS#7 block padding modes:+ AES_CBC_PKCS7
 * + AES_ECB_PKCS7
 * + DES_CBC_PKCS7
 * + DES_ECB_PKCS7
 * + 3DES_CBC_PKCS7
 * + 3DES_ECB_PKCS7
 * + RC2_CBC_PKCS7
 * + RC2_ECB_PKCS7
 * 
 * + Authenticated modes (see the [EncryptedAndAuthenticatedData](encryptedandauthenticateddata.md) class):+ AES_GCM
 * + AES_CCM
 * 
 * + Stream Cipher:+ RC4
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetrickeyalgorithmprovider
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class SymmetricKeyAlgorithmProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISymmetricKeyAlgorithmProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISymmetricKeyAlgorithmProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) class and opens the specified algorithm for use.
     * @remarks
     * The following algorithm names are supported for use in this method:
     * 
     * 
     * + No padding:   + [SymmetricAlgorithmNames.AesCbc](symmetricalgorithmnames_aescbc.md)
     *    + [SymmetricAlgorithmNames.AesEcb](symmetricalgorithmnames_aesecb.md)
     *    + [SymmetricAlgorithmNames.DesCbc](symmetricalgorithmnames_descbc.md)
     *    + [SymmetricAlgorithmNames.DesEcb](symmetricalgorithmnames_desecb.md)
     *    + [SymmetricAlgorithmNames.Rc2Cbc](symmetricalgorithmnames_rc2cbc.md)
     *    + [SymmetricAlgorithmNames.Rc2Ecb](symmetricalgorithmnames_rc2ecb.md)
     *    + [SymmetricAlgorithmNames.TripleDesCbc](symmetricalgorithmnames_tripledescbc.md)
     *    + [SymmetricAlgorithmNames.TripleDesEcb](symmetricalgorithmnames_tripledesecb.md)
     * 
     * + PKCS#7 block padding modes:   + [SymmetricAlgorithmNames.AesCbcPkcs7](symmetricalgorithmnames_aescbcpkcs7.md)
     *    + [SymmetricAlgorithmNames.AesEcbPkcs7](symmetricalgorithmnames_aesecbpkcs7.md)
     *    + [SymmetricAlgorithmNames.DesCbcPkcs7](symmetricalgorithmnames_descbcpkcs7.md)
     *    + [SymmetricAlgorithmNames.DesEcbPkcs7](symmetricalgorithmnames_desecbpkcs7.md)
     *    + [SymmetricAlgorithmNames.Rc2CbcPkcs7](symmetricalgorithmnames_rc2cbcpkcs7.md)
     *    + [SymmetricAlgorithmNames.Rc2EcbPkcs7](symmetricalgorithmnames_rc2ecbpkcs7.md)
     *    + [SymmetricAlgorithmNames.TripleDesCbcPkcs7](symmetricalgorithmnames_tripledescbcpkcs7.md)
     *    + [SymmetricAlgorithmNames.TripleDesEcbPkcs7](symmetricalgorithmnames_tripledesecbpkcs7.md)
     * 
     * + Authenticated modes (see the [EncryptedAndAuthenticatedData](encryptedandauthenticateddata.md) class):   + [SymmetricAlgorithmNames.AesCcm](symmetricalgorithmnames_aesccm.md)
     *    + [SymmetricAlgorithmNames.AesGcm](symmetricalgorithmnames_aesgcm.md)
     * 
     * + Stream Cipher:   + [SymmetricAlgorithmNames.Rc4](symmetricalgorithmnames_rc4.md)
     * @param {HSTRING} algorithm Algorithm name.
     * @returns {SymmetricKeyAlgorithmProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetrickeyalgorithmprovider.openalgorithm
     */
    static OpenAlgorithm(algorithm) {
        if (!SymmetricKeyAlgorithmProvider.HasProp("__ISymmetricKeyAlgorithmProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricKeyAlgorithmProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricKeyAlgorithmProviderStatics.IID)
            SymmetricKeyAlgorithmProvider.__ISymmetricKeyAlgorithmProviderStatics := ISymmetricKeyAlgorithmProviderStatics(factoryPtr)
        }

        return SymmetricKeyAlgorithmProvider.__ISymmetricKeyAlgorithmProviderStatics.OpenAlgorithm(algorithm)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name of the open symmetric algorithm.
     * @remarks
     * You must call [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) before calling this property. The following algorithm names are supported for symmetric cryptographic operations.
     * 
     * 
     * + No padding:   + [SymmetricAlgorithmNames.AesCbc](symmetricalgorithmnames_aescbc.md)
     *    + [SymmetricAlgorithmNames.AesEcb](symmetricalgorithmnames_aesecb.md)
     *    + [SymmetricAlgorithmNames.DesCbc](symmetricalgorithmnames_descbc.md)
     *    + [SymmetricAlgorithmNames.DesEcb](symmetricalgorithmnames_desecb.md)
     *    + [SymmetricAlgorithmNames.Rc2Cbc](symmetricalgorithmnames_rc2cbc.md)
     *    + [SymmetricAlgorithmNames.Rc2Ecb](symmetricalgorithmnames_rc2ecb.md)
     *    + [SymmetricAlgorithmNames.TripleDesCbc](symmetricalgorithmnames_tripledescbc.md)
     *    + [SymmetricAlgorithmNames.TripleDesEcb](symmetricalgorithmnames_tripledesecb.md)
     * 
     * + PKCS#7 block padding modes:   + [SymmetricAlgorithmNames.AesCbcPkcs7](symmetricalgorithmnames_aescbcpkcs7.md)
     *    + [SymmetricAlgorithmNames.AesEcbPkcs7](symmetricalgorithmnames_aesecbpkcs7.md)
     *    + [SymmetricAlgorithmNames.DesCbcPkcs7](symmetricalgorithmnames_descbcpkcs7.md)
     *    + [SymmetricAlgorithmNames.DesEcbPkcs7](symmetricalgorithmnames_desecbpkcs7.md)
     *    + [SymmetricAlgorithmNames.Rc2CbcPkcs7](symmetricalgorithmnames_rc2cbcpkcs7.md)
     *    + [SymmetricAlgorithmNames.Rc2EcbPkcs7](symmetricalgorithmnames_rc2ecbpkcs7.md)
     *    + [SymmetricAlgorithmNames.TripleDesCbcPkcs7](symmetricalgorithmnames_tripledescbcpkcs7.md)
     *    + [SymmetricAlgorithmNames.TripleDesEcbPkcs7](symmetricalgorithmnames_tripledesecbpkcs7.md)
     * 
     * + Authenticated modes (see the [EncryptedAndAuthenticatedData](encryptedandauthenticateddata.md) class):   + [SymmetricAlgorithmNames.AesCcm](symmetricalgorithmnames_aesccm.md)
     *    + [SymmetricAlgorithmNames.AesGcm](symmetricalgorithmnames_aesgcm.md)
     * 
     * + Stream Cipher:   + [SymmetricAlgorithmNames.Rc4](symmetricalgorithmnames_rc4.md)
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetrickeyalgorithmprovider.algorithmname
     * @type {HSTRING} 
     */
    AlgorithmName {
        get => this.get_AlgorithmName()
    }

    /**
     * Gets the size, in bytes, of the cipher block for the open algorithm.
     * @remarks
     * If you are not using a PKCS#7 block padding algorithm (which automatically pads your content to the correct length), you must ensure that the message to be encrypted is an exact multiple of the length supported by the algorithm. For more information, see the following code example.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetrickeyalgorithmprovider.blocklength
     * @type {Integer} 
     */
    BlockLength {
        get => this.get_BlockLength()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AlgorithmName() {
        if (!this.HasProp("__ISymmetricKeyAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(ISymmetricKeyAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISymmetricKeyAlgorithmProvider := ISymmetricKeyAlgorithmProvider(outPtr)
        }

        return this.__ISymmetricKeyAlgorithmProvider.get_AlgorithmName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BlockLength() {
        if (!this.HasProp("__ISymmetricKeyAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(ISymmetricKeyAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISymmetricKeyAlgorithmProvider := ISymmetricKeyAlgorithmProvider(outPtr)
        }

        return this.__ISymmetricKeyAlgorithmProvider.get_BlockLength()
    }

    /**
     * Creates a symmetric key.
     * @param {IBuffer} keyMaterial Data used to generate the key. You can call the [GenerateRandom](../windows.security.cryptography/cryptographicbuffer_generaterandom_1645545930.md) method to create random key material.
     * @returns {CryptographicKey} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetrickeyalgorithmprovider.createsymmetrickey
     */
    CreateSymmetricKey(keyMaterial) {
        if (!this.HasProp("__ISymmetricKeyAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(ISymmetricKeyAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISymmetricKeyAlgorithmProvider := ISymmetricKeyAlgorithmProvider(outPtr)
        }

        return this.__ISymmetricKeyAlgorithmProvider.CreateSymmetricKey(keyMaterial)
    }

;@endregion Instance Methods
}
