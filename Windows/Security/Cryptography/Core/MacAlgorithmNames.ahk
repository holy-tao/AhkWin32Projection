#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMacAlgorithmNamesStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains static properties that enable you to retrieve algorithm names that can be used in the [OpenAlgorithm](macalgorithmprovider_openalgorithm_637226074.md) method of the [MacAlgorithmProvider](macalgorithmprovider.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmnames
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class MacAlgorithmNames extends IInspectable {
;@region Static Properties
    /**
     * Retrieves a string that contains "HMAC_MD5".
     * @remarks
     * Use the string retrieved by this property to set the message authentication code (MAC) algorithm name when you call the [OpenAlgorithm](macalgorithmprovider_openalgorithm_637226074.md) method. The string represents a hash-based message authentication code (HMAC) algorithm that uses the MD5 message digest algorithm to perform the hashing.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmnames.hmacmd5
     * @type {HSTRING} 
     */
    static HmacMd5 {
        get => MacAlgorithmNames.get_HmacMd5()
    }

    /**
     * Retrieves a string that contains "HMAC_SHA1".
     * @remarks
     * Use the string retrieved by this property to set the message authentication code (MAC) algorithm name when you call the [OpenAlgorithm](macalgorithmprovider_openalgorithm_637226074.md) method. The string represents a hash-based message authentication code (HMAC) algorithm that uses the SHA1 (Secure Hash Algorithm 1) message digest algorithm to perform the hashing.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmnames.hmacsha1
     * @type {HSTRING} 
     */
    static HmacSha1 {
        get => MacAlgorithmNames.get_HmacSha1()
    }

    /**
     * Retrieves a string that contains "HMAC_SHA256".
     * @remarks
     * Use the string retrieved by this property to set the message authentication code (MAC) algorithm name when you call the [OpenAlgorithm](macalgorithmprovider_openalgorithm_637226074.md) method. The string represents a hash-based message authentication code (HMAC) algorithm that uses the SHA256 (Secure Hash Algorithm) message digest algorithm to perform the hashing.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmnames.hmacsha256
     * @type {HSTRING} 
     */
    static HmacSha256 {
        get => MacAlgorithmNames.get_HmacSha256()
    }

    /**
     * Retrieves a string that contains "HMAC_SHA384".
     * @remarks
     * Use the string retrieved by this property to set the message authentication code (MAC) algorithm name when you call the [OpenAlgorithm](macalgorithmprovider_openalgorithm_637226074.md) method. The string represents a hash-based message authentication code (HMAC) algorithm that uses the SHA384 (Secure Hash Algorithm) message digest algorithm to perform the hashing.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmnames.hmacsha384
     * @type {HSTRING} 
     */
    static HmacSha384 {
        get => MacAlgorithmNames.get_HmacSha384()
    }

    /**
     * Retrieves a string that contains "HMAC_SHA512".
     * @remarks
     * Use the string retrieved by this property to set the message authentication code (MAC) algorithm name when you call the [OpenAlgorithm](macalgorithmprovider_openalgorithm_637226074.md) method. The string represents a hash-based message authentication code (HMAC) algorithm that uses the SHA512 (Secure Hash Algorithm) message digest algorithm to perform the hashing.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmnames.hmacsha512
     * @type {HSTRING} 
     */
    static HmacSha512 {
        get => MacAlgorithmNames.get_HmacSha512()
    }

    /**
     * Retrieves a string that contains "AES_CMAC".
     * @remarks
     * Use the string retrieved by this property to set the message authentication code (MAC) algorithm name when you call the [OpenAlgorithm](macalgorithmprovider_openalgorithm_637226074.md) method. The string represents an Advanced Encryption Standard (AES) encryption algorithm coupled with a cipher-based MAC block cipher algorithm. For more information, see RFC 4493.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmnames.aescmac
     * @type {HSTRING} 
     */
    static AesCmac {
        get => MacAlgorithmNames.get_AesCmac()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HmacMd5() {
        if (!MacAlgorithmNames.HasProp("__IMacAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.MacAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMacAlgorithmNamesStatics.IID)
            MacAlgorithmNames.__IMacAlgorithmNamesStatics := IMacAlgorithmNamesStatics(factoryPtr)
        }

        return MacAlgorithmNames.__IMacAlgorithmNamesStatics.get_HmacMd5()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HmacSha1() {
        if (!MacAlgorithmNames.HasProp("__IMacAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.MacAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMacAlgorithmNamesStatics.IID)
            MacAlgorithmNames.__IMacAlgorithmNamesStatics := IMacAlgorithmNamesStatics(factoryPtr)
        }

        return MacAlgorithmNames.__IMacAlgorithmNamesStatics.get_HmacSha1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HmacSha256() {
        if (!MacAlgorithmNames.HasProp("__IMacAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.MacAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMacAlgorithmNamesStatics.IID)
            MacAlgorithmNames.__IMacAlgorithmNamesStatics := IMacAlgorithmNamesStatics(factoryPtr)
        }

        return MacAlgorithmNames.__IMacAlgorithmNamesStatics.get_HmacSha256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HmacSha384() {
        if (!MacAlgorithmNames.HasProp("__IMacAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.MacAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMacAlgorithmNamesStatics.IID)
            MacAlgorithmNames.__IMacAlgorithmNamesStatics := IMacAlgorithmNamesStatics(factoryPtr)
        }

        return MacAlgorithmNames.__IMacAlgorithmNamesStatics.get_HmacSha384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HmacSha512() {
        if (!MacAlgorithmNames.HasProp("__IMacAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.MacAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMacAlgorithmNamesStatics.IID)
            MacAlgorithmNames.__IMacAlgorithmNamesStatics := IMacAlgorithmNamesStatics(factoryPtr)
        }

        return MacAlgorithmNames.__IMacAlgorithmNamesStatics.get_HmacSha512()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AesCmac() {
        if (!MacAlgorithmNames.HasProp("__IMacAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.MacAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMacAlgorithmNamesStatics.IID)
            MacAlgorithmNames.__IMacAlgorithmNamesStatics := IMacAlgorithmNamesStatics(factoryPtr)
        }

        return MacAlgorithmNames.__IMacAlgorithmNamesStatics.get_AesCmac()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
