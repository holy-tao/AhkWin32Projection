#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyDerivationAlgorithmNamesStatics.ahk
#Include .\IKeyDerivationAlgorithmNamesStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains static properties that enable you to retrieve algorithm names that can be used in the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method of the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class.
 * @remarks
 * All of the properties associated with this class are static. You do not need to create an instance of the class to retrieve a property value.
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class KeyDerivationAlgorithmNames extends IInspectable {
;@region Static Properties
    /**
     * Retrieves a string that contains "PBKDF2_MD5".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents a Password-Based Key Derivation Function 2 (PBKDF2) algorithm that uses a Hashed Message Authentication Code (HMAC) based on the MD5 digest algorithm as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate salt value and iteration count by calling the [BuildForPbkdf2](keyderivationparameters_buildforpbkdf2_636237279.md) method on the [KeyDerivationParameters](keyderivationparameters.md) class before calling the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.pbkdf2md5
     * @type {HSTRING} 
     */
    static Pbkdf2Md5 {
        get => KeyDerivationAlgorithmNames.get_Pbkdf2Md5()
    }

    /**
     * Retrieves a string that contains "PBKDF2_SHA1".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents a Password-Based Key Derivation Function 2 (PBKDF2) algorithm that uses a Hashed Message Authentication Code (HMAC) based on the SHA1 (Secure Hash Algorithm 1) message digest algorithm as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate salt value and iteration count by calling the [BuildForPbkdf2](keyderivationparameters_buildforpbkdf2_636237279.md) method on the [KeyDerivationParameters](keyderivationparameters.md) class before calling the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.pbkdf2sha1
     * @type {HSTRING} 
     */
    static Pbkdf2Sha1 {
        get => KeyDerivationAlgorithmNames.get_Pbkdf2Sha1()
    }

    /**
     * Retrieves a string that contains "PBKDF2_SHA256".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents a Password-Based Key Derivation Function 2 (PBKDF2) algorithm that uses a Hashed Message Authentication Code (HMAC) based on the SHA256 (Secure Hash Algorithm 256) message digest algorithm as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate salt value and iteration count by calling the [BuildForPbkdf2](keyderivationparameters_buildforpbkdf2_636237279.md) method on the [KeyDerivationParameters](keyderivationparameters.md) class before calling the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.pbkdf2sha256
     * @type {HSTRING} 
     */
    static Pbkdf2Sha256 {
        get => KeyDerivationAlgorithmNames.get_Pbkdf2Sha256()
    }

    /**
     * Retrieves a string that contains "PBKDF2_SHA384".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents a Password-Based Key Derivation Function 2 (PBKDF2) algorithm that uses a Hashed Message Authentication Code (HMAC) based on the SHA384 (Secure Hash Algorithm 384) message digest algorithm as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate salt value and iteration count by calling the [BuildForPbkdf2](keyderivationparameters_buildforpbkdf2_636237279.md) method on the [KeyDerivationParameters](keyderivationparameters.md) class before calling the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.pbkdf2sha384
     * @type {HSTRING} 
     */
    static Pbkdf2Sha384 {
        get => KeyDerivationAlgorithmNames.get_Pbkdf2Sha384()
    }

    /**
     * Retrieves a string that contains "PBKDF2_SHA512".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents a Password-Based Key Derivation Function 2 (PBKDF2) algorithm that uses a Hashed Message Authentication Code (HMAC) based on the SHA512 (Secure Hash Algorithm 512) message digest algorithm as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate salt value and iteration count by calling the [BuildForPbkdf2](keyderivationparameters_buildforpbkdf2_636237279.md) method on the [KeyDerivationParameters](keyderivationparameters.md) class before calling the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.pbkdf2sha512
     * @type {HSTRING} 
     */
    static Pbkdf2Sha512 {
        get => KeyDerivationAlgorithmNames.get_Pbkdf2Sha512()
    }

    /**
     * Retrieves a string that contains "SP800_108_CTR_HMAC_MD5".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents an Sp800-108 algorithm in counter mode that uses a Hashed Message Authentication Code based on the MD5 digest algorithm (HmacMd5) as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate parameters by calling the [BuildForSP800108](keyderivationparameters_buildforsp800108_1459175055.md) method on the [KeyDerivationParameters](keyderivationparameters.md) before calling the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.sp800108ctrhmacmd5
     * @type {HSTRING} 
     */
    static Sp800108CtrHmacMd5 {
        get => KeyDerivationAlgorithmNames.get_Sp800108CtrHmacMd5()
    }

    /**
     * Retrieves a string that contains "SP800_108_CTR_HMAC_SHA1".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents a Sp800-108 algorithm in counter mode that uses a Hashed Message Authentication Code based on the Secure Hash Algorithm 1 message digest algorithm (HmacSha1) as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate parameters by calling the [BuildForSP800108](keyderivationparameters_buildforsp800108_1459175055.md) method on the [KeyDerivationParameters](keyderivationparameters.md) before calling the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.sp800108ctrhmacsha1
     * @type {HSTRING} 
     */
    static Sp800108CtrHmacSha1 {
        get => KeyDerivationAlgorithmNames.get_Sp800108CtrHmacSha1()
    }

    /**
     * Retrieves a string that contains "SP800_108_CTR_HMAC_SHA256".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents a Sp800-108 algorithm in counter mode that uses a Hashed Message Authentication Code based on the Secure Hash Algorithm 256 message digest algorithm (HmacSha256) as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate parameters by calling the [BuildForSP800108](keyderivationparameters_buildforsp800108_1459175055.md) method on the [KeyDerivationParameters](keyderivationparameters.md) before calling the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.sp800108ctrhmacsha256
     * @type {HSTRING} 
     */
    static Sp800108CtrHmacSha256 {
        get => KeyDerivationAlgorithmNames.get_Sp800108CtrHmacSha256()
    }

    /**
     * Retrieves a string that contains "SP800_108_CTR_HMAC_SHA384".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents a Sp800-108 algorithm in counter mode that uses a Hashed Message Authentication Code based on the Secure Hash Algorithm 384 message digest algorithm (HmacSha384) as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate parameters by calling the [BuildForSP800108](keyderivationparameters_buildforsp800108_1459175055.md) method on the [KeyDerivationParameters](keyderivationparameters.md) before calling the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.sp800108ctrhmacsha384
     * @type {HSTRING} 
     */
    static Sp800108CtrHmacSha384 {
        get => KeyDerivationAlgorithmNames.get_Sp800108CtrHmacSha384()
    }

    /**
     * Retrieves a string that contains "SP800_108_CTR_HMAC_SHA512".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents a Sp800-108 algorithm in counter mode that uses a Hashed Message Authentication Code based on the Secure Hash Algorithm 512 message digest algorithm (HmacSha512) as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate parameters by calling the [BuildForSP800108](keyderivationparameters_buildforsp800108_1459175055.md) method on the [KeyDerivationParameters](keyderivationparameters.md) before calling the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.sp800108ctrhmacsha512
     * @type {HSTRING} 
     */
    static Sp800108CtrHmacSha512 {
        get => KeyDerivationAlgorithmNames.get_Sp800108CtrHmacSha512()
    }

    /**
     * Retrieves a string that contains "SP800_56A_CONCAT_MD5".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents an Sp800-56a algorithm that uses a Hashed Message Authentication Code (HMAC) based on the MD5 message digest algorithm as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate parameters by calling the [BuildForSP80056a](keyderivationparameters_buildforsp80056a_870294687.md) method on the [KeyDerivationParameters](keyderivationparameters.md) class. The parameters are internally concatenated before the function is used by the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.sp80056aconcatmd5
     * @type {HSTRING} 
     */
    static Sp80056aConcatMd5 {
        get => KeyDerivationAlgorithmNames.get_Sp80056aConcatMd5()
    }

    /**
     * Retrieves a string that contains "SP800_56A_CONCAT_SHA1".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents an Sp800-56a algorithm that uses a Hashed Message Authentication Code (HMAC) based on the SHA1 (Secure Hash Algorithm 1) message digest algorithm as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate parameters by calling the [BuildForSP80056a](keyderivationparameters_buildforsp80056a_870294687.md) method on the [KeyDerivationParameters](keyderivationparameters.md) class. The parameters are internally concatenated before the function is used by the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.sp80056aconcatsha1
     * @type {HSTRING} 
     */
    static Sp80056aConcatSha1 {
        get => KeyDerivationAlgorithmNames.get_Sp80056aConcatSha1()
    }

    /**
     * Retrieves a string that contains "SP800_108_CTR_HMAC_SHA256".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents an Sp800-56a algorithm that uses a Hashed Message Authentication Code (HMAC) based on the SHA256 (Secure Hash Algorithm 256) message digest algorithm as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate parameters by calling the [BuildForSP80056a](keyderivationparameters_buildforsp80056a_870294687.md) method on the [KeyDerivationParameters](keyderivationparameters.md) class. The parameters are internally concatenated before the function is used by the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.sp80056aconcatsha256
     * @type {HSTRING} 
     */
    static Sp80056aConcatSha256 {
        get => KeyDerivationAlgorithmNames.get_Sp80056aConcatSha256()
    }

    /**
     * Retrieves a string that contains "SP800_108_CTR_HMAC_SHA384".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents an Sp800-56a algorithm that uses a Hashed Message Authentication Code (HMAC) based on the SHA384 (Secure Hash Algorithm 384) message digest algorithm as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate parameters by calling the [BuildForSP80056a](keyderivationparameters_buildforsp80056a_870294687.md) method on the [KeyDerivationParameters](keyderivationparameters.md) class. The parameters are internally concatenated before the function is used by the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.sp80056aconcatsha384
     * @type {HSTRING} 
     */
    static Sp80056aConcatSha384 {
        get => KeyDerivationAlgorithmNames.get_Sp80056aConcatSha384()
    }

    /**
     * Retrieves a string that contains "SP800_56A_CONCAT_SHA512".
     * @remarks
     * Use the string retrieved by this property to set the Key Derivation Function (KDF) name when you call the [OpenAlgorithm](keyderivationalgorithmprovider_openalgorithm_637226074.md) method on the [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md) class. The string represents an Sp800-56a algorithm that uses a Hashed Message Authentication Code (HMAC) based on the SHA512 (Secure Hash Algorithm 512) message digest algorithm as the underlying pseudorandom function.
     * 
     * To use this KDF, you must specify the appropriate parameters by calling the [BuildForSP80056a](keyderivationparameters_buildforsp80056a_870294687.md) method on the [KeyDerivationParameters](keyderivationparameters.md) class. The parameters are internally concatenated before the function is used by the [CreateKey](keyderivationalgorithmprovider_createkey_928231294.md) method to derive a key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.sp80056aconcatsha512
     * @type {HSTRING} 
     */
    static Sp80056aConcatSha512 {
        get => KeyDerivationAlgorithmNames.get_Sp80056aConcatSha512()
    }

    /**
     * Retrieves a string that contains "CAPI_KDF_MD5".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.capikdfmd5
     * @type {HSTRING} 
     */
    static CapiKdfMd5 {
        get => KeyDerivationAlgorithmNames.get_CapiKdfMd5()
    }

    /**
     * Retrieves a string that contains "CAPI_KDF_SHA1".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.capikdfsha1
     * @type {HSTRING} 
     */
    static CapiKdfSha1 {
        get => KeyDerivationAlgorithmNames.get_CapiKdfSha1()
    }

    /**
     * Retrieves a string that contains "CAPI_KDF_SHA256".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.capikdfsha256
     * @type {HSTRING} 
     */
    static CapiKdfSha256 {
        get => KeyDerivationAlgorithmNames.get_CapiKdfSha256()
    }

    /**
     * Retrieves a string that contains "CAPI_KDF_SHA384".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.capikdfsha384
     * @type {HSTRING} 
     */
    static CapiKdfSha384 {
        get => KeyDerivationAlgorithmNames.get_CapiKdfSha384()
    }

    /**
     * Retrieves a string that contains "CAPI_KDF_SHA512".
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.keyderivationalgorithmnames.capikdfsha512
     * @type {HSTRING} 
     */
    static CapiKdfSha512 {
        get => KeyDerivationAlgorithmNames.get_CapiKdfSha512()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Pbkdf2Md5() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Pbkdf2Md5()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Pbkdf2Sha1() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Pbkdf2Sha1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Pbkdf2Sha256() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Pbkdf2Sha256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Pbkdf2Sha384() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Pbkdf2Sha384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Pbkdf2Sha512() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Pbkdf2Sha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sp800108CtrHmacMd5() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Sp800108CtrHmacMd5()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sp800108CtrHmacSha1() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Sp800108CtrHmacSha1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sp800108CtrHmacSha256() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Sp800108CtrHmacSha256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sp800108CtrHmacSha384() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Sp800108CtrHmacSha384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sp800108CtrHmacSha512() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Sp800108CtrHmacSha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sp80056aConcatMd5() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Sp80056aConcatMd5()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sp80056aConcatSha1() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Sp80056aConcatSha1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sp80056aConcatSha256() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Sp80056aConcatSha256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sp80056aConcatSha384() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Sp80056aConcatSha384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sp80056aConcatSha512() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics := IKeyDerivationAlgorithmNamesStatics(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics.get_Sp80056aConcatSha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CapiKdfMd5() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics2.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics2 := IKeyDerivationAlgorithmNamesStatics2(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics2.get_CapiKdfMd5()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CapiKdfSha1() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics2.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics2 := IKeyDerivationAlgorithmNamesStatics2(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics2.get_CapiKdfSha1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CapiKdfSha256() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics2.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics2 := IKeyDerivationAlgorithmNamesStatics2(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics2.get_CapiKdfSha256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CapiKdfSha384() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics2.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics2 := IKeyDerivationAlgorithmNamesStatics2(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics2.get_CapiKdfSha384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CapiKdfSha512() {
        if (!KeyDerivationAlgorithmNames.HasProp("__IKeyDerivationAlgorithmNamesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.KeyDerivationAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyDerivationAlgorithmNamesStatics2.IID)
            KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics2 := IKeyDerivationAlgorithmNamesStatics2(factoryPtr)
        }

        return KeyDerivationAlgorithmNames.__IKeyDerivationAlgorithmNamesStatics2.get_CapiKdfSha512()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
