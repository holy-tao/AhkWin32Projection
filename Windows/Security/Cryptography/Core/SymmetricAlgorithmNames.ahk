#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISymmetricAlgorithmNamesStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains static properties that enable you to retrieve algorithm names that can be used in the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method of the [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class SymmetricAlgorithmNames extends IInspectable {
;@region Static Properties
    /**
     * Retrieves a string that contains "DES_CBC".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Data Encryption Standard (DES) algorithm coupled with a cipher-block chaining mode of operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.descbc
     * @type {HSTRING} 
     */
    static DesCbc {
        get => SymmetricAlgorithmNames.get_DesCbc()
    }

    /**
     * Retrieves a string that contains "DES_ECB".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Data Encryption Standard (DES) algorithm coupled with an electronic codebook (ECB) mode of operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.desecb
     * @type {HSTRING} 
     */
    static DesEcb {
        get => SymmetricAlgorithmNames.get_DesEcb()
    }

    /**
     * Retrieves a string that contains "3DES_CBC".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Triple Data Encryption Standard (TripleDES) algorithm coupled with a cipher-block chaining mode of operation. This implementation of TripleDES is a three-key implementation, which requires a key size of 24 bytes. Passing a key size less than 24 bytes to this algorithm's [CreateSymmetricKey](symmetrickeyalgorithmprovider_createsymmetrickey_199420845.md) method produces a "Value does not fall within the expected range" exception.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.tripledescbc
     * @type {HSTRING} 
     */
    static TripleDesCbc {
        get => SymmetricAlgorithmNames.get_TripleDesCbc()
    }

    /**
     * Retrieves a string that contains "3DES_ECB".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Triple Data Encryption Standard (TripleDES) algorithm coupled with an electronic codebook (ECB) mode of operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.tripledesecb
     * @type {HSTRING} 
     */
    static TripleDesEcb {
        get => SymmetricAlgorithmNames.get_TripleDesEcb()
    }

    /**
     * Retrieves a string that contains "RC2_CBC".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Rivest Cipher (RC2) block cipher algorithm coupled with a cipher-block chaining mode of operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.rc2cbc
     * @type {HSTRING} 
     */
    static Rc2Cbc {
        get => SymmetricAlgorithmNames.get_Rc2Cbc()
    }

    /**
     * Retrieves a string that contains "RC2_ECB".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Rivest Cipher (RC2) block cipher algorithm coupled with an electronic codebook (ECB) mode of operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.rc2ecb
     * @type {HSTRING} 
     */
    static Rc2Ecb {
        get => SymmetricAlgorithmNames.get_Rc2Ecb()
    }

    /**
     * Retrieves a string that contains "AES_CBC".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Advanced Encryption Standard (AES) algorithm coupled with a cipher-block chaining mode of operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.aescbc
     * @type {HSTRING} 
     */
    static AesCbc {
        get => SymmetricAlgorithmNames.get_AesCbc()
    }

    /**
     * Retrieves a string that contains "AES_ECB".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Advanced Encryption Standard (AES) algorithm coupled with an electronic codebook (ECB) mode of operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.aesecb
     * @type {HSTRING} 
     */
    static AesEcb {
        get => SymmetricAlgorithmNames.get_AesEcb()
    }

    /**
     * Retrieves a string that contains "AES_GCM".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Advanced Encryption Standard (AES) algorithm coupled with the Galois Counter Mode (GCM) mode of operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.aesgcm
     * @type {HSTRING} 
     */
    static AesGcm {
        get => SymmetricAlgorithmNames.get_AesGcm()
    }

    /**
     * Retrieves a string that contains "AES_CCM".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Advanced Encryption Standard (AES) algorithm coupled with a CCM (Counter with CBC-MAC) mode of operation.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.aesccm
     * @type {HSTRING} 
     */
    static AesCcm {
        get => SymmetricAlgorithmNames.get_AesCcm()
    }

    /**
     * Retrieves a string that contains "AES_CBC_PKCS7".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Advanced Encryption Standard (AES) algorithm coupled with a cipher-block chaining mode of operation and PKCS#7 padding.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.aescbcpkcs7
     * @type {HSTRING} 
     */
    static AesCbcPkcs7 {
        get => SymmetricAlgorithmNames.get_AesCbcPkcs7()
    }

    /**
     * Retrieves a string that contains "AES_ECB_PKCS7".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Advanced Encryption Standard (AES) algorithm coupled with an electronic codebook (ECB) mode of operation and PKCS#7 padding.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.aesecbpkcs7
     * @type {HSTRING} 
     */
    static AesEcbPkcs7 {
        get => SymmetricAlgorithmNames.get_AesEcbPkcs7()
    }

    /**
     * Retrieves a string that contains "DES_CBC_PKCS7".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Data Encryption Standard (DES) algorithm coupled with a cipher-block chaining mode of operation and PKCS#7 padding.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.descbcpkcs7
     * @type {HSTRING} 
     */
    static DesCbcPkcs7 {
        get => SymmetricAlgorithmNames.get_DesCbcPkcs7()
    }

    /**
     * Retrieves a string that contains "DES_ECB_PKCS7".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Data Encryption Standard (DES) algorithm coupled with an electronic codebook (ECB) mode of operation and PKCS#7 padding.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.desecbpkcs7
     * @type {HSTRING} 
     */
    static DesEcbPkcs7 {
        get => SymmetricAlgorithmNames.get_DesEcbPkcs7()
    }

    /**
     * Retrieves a string that contains "3DES_CBC_PKCS7".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Triple Data Encryption Standard (TripleDES) algorithm coupled with a cipher-block chaining mode of operation and PKCS#7 padding.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.tripledescbcpkcs7
     * @type {HSTRING} 
     */
    static TripleDesCbcPkcs7 {
        get => SymmetricAlgorithmNames.get_TripleDesCbcPkcs7()
    }

    /**
     * Retrieves a string that contains "3DES_ECB_PKCS7".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Triple Data Encryption Standard (TripleDES) algorithm coupled with an electronic codebook (ECB) mode of operation and PKCS#7 padding.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.tripledesecbpkcs7
     * @type {HSTRING} 
     */
    static TripleDesEcbPkcs7 {
        get => SymmetricAlgorithmNames.get_TripleDesEcbPkcs7()
    }

    /**
     * Retrieves a string that contains "RC2_CBC_PKCS7".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Rivest Cipher (RC2) block cipher algorithm coupled with a cipher-block chaining mode of operation and PKCS#7 padding.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.rc2cbcpkcs7
     * @type {HSTRING} 
     */
    static Rc2CbcPkcs7 {
        get => SymmetricAlgorithmNames.get_Rc2CbcPkcs7()
    }

    /**
     * Retrieves a string that contains "RC2_ECB_PKCS7".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Rivest Cipher (RC2) block cipher algorithm coupled with an electronic codebook (ECB) mode of operation and PKCS#7 padding.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.rc2ecbpkcs7
     * @type {HSTRING} 
     */
    static Rc2EcbPkcs7 {
        get => SymmetricAlgorithmNames.get_Rc2EcbPkcs7()
    }

    /**
     * Retrieves a string that contains "RC4".
     * @remarks
     * Use the string retrieved by this property to set the symmetric encryption algorithm name when you call the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on a [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) object. The string represents the Rivest Cipher (RC4) block cipher algorithm.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.symmetricalgorithmnames.rc4
     * @type {HSTRING} 
     */
    static Rc4 {
        get => SymmetricAlgorithmNames.get_Rc4()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DesCbc() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_DesCbc()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DesEcb() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_DesEcb()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TripleDesCbc() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_TripleDesCbc()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TripleDesEcb() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_TripleDesEcb()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Rc2Cbc() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_Rc2Cbc()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Rc2Ecb() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_Rc2Ecb()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AesCbc() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_AesCbc()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AesEcb() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_AesEcb()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AesGcm() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_AesGcm()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AesCcm() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_AesCcm()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AesCbcPkcs7() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_AesCbcPkcs7()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AesEcbPkcs7() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_AesEcbPkcs7()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DesCbcPkcs7() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_DesCbcPkcs7()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DesEcbPkcs7() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_DesEcbPkcs7()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TripleDesCbcPkcs7() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_TripleDesCbcPkcs7()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TripleDesEcbPkcs7() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_TripleDesEcbPkcs7()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Rc2CbcPkcs7() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_Rc2CbcPkcs7()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Rc2EcbPkcs7() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_Rc2EcbPkcs7()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Rc4() {
        if (!SymmetricAlgorithmNames.HasProp("__ISymmetricAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.SymmetricAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISymmetricAlgorithmNamesStatics.IID)
            SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics := ISymmetricAlgorithmNamesStatics(factoryPtr)
        }

        return SymmetricAlgorithmNames.__ISymmetricAlgorithmNamesStatics.get_Rc4()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
