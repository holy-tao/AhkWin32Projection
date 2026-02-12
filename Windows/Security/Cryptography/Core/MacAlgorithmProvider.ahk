#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMacAlgorithmProvider.ahk
#Include .\IMacAlgorithmProvider2.ahk
#Include .\IMacAlgorithmProviderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a message authentication code (MAC). A MAC uses symmetric key cryptography to prevent message tampering. For more information, see [MACs, hashes, and signatures](/windows/uwp/security/macs-hashes-and-signatures).
 * @remarks
 * You create a MacAlgorithmProvider object by calling the static [OpenAlgorithm](macalgorithmprovider_openalgorithm_637226074.md) method and specifying one of the following algorithm names:
 * 
 * 
 * + HMAC_MD5
 * + HMAC_SHA1
 * + HMAC_SHA256
 * + HMAC_SHA384
 * + HMAC_SHA512
 * + AES_CMAC
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmprovider
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class MacAlgorithmProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMacAlgorithmProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMacAlgorithmProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [MacAlgorithmProvider](macalgorithmprovider.md) object and opens the specified algorithm for use.
     * @remarks
     * The following algorithm names are supported for use in the [MacAlgorithmProvider](macalgorithmprovider.md) class:
     * 
     * 
     * + [MacAlgorithmNames.AesCmac](macalgorithmnames_aescmac.md)
     * + [MacAlgorithmNames.HmacMd5](macalgorithmnames_hmacmd5.md)
     * + [MacAlgorithmNames.HmacSha1](macalgorithmnames_hmacsha1.md)
     * + [MacAlgorithmNames.HmacSha256](macalgorithmnames_hmacsha256.md)
     * + [MacAlgorithmNames.HmacSha384](macalgorithmnames_hmacsha384.md)
     * + [MacAlgorithmNames.HmacSha512](macalgorithmnames_hmacsha512.md)
     * @param {HSTRING} algorithm Algorithm name.
     * @returns {MacAlgorithmProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmprovider.openalgorithm
     */
    static OpenAlgorithm(algorithm) {
        if (!MacAlgorithmProvider.HasProp("__IMacAlgorithmProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.MacAlgorithmProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMacAlgorithmProviderStatics.IID)
            MacAlgorithmProvider.__IMacAlgorithmProviderStatics := IMacAlgorithmProviderStatics(factoryPtr)
        }

        return MacAlgorithmProvider.__IMacAlgorithmProviderStatics.OpenAlgorithm(algorithm)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name of the open MAC algorithm.
     * @remarks
     * You must call the [OpenAlgorithm](macalgorithmprovider_openalgorithm_637226074.md) method before calling this property. The following algorithm names are supported:
     * 
     * 
     * + [MacAlgorithmNames.AesCmac](macalgorithmnames_aescmac.md)
     * + [MacAlgorithmNames.HmacMd5](macalgorithmnames_hmacmd5.md)
     * + [MacAlgorithmNames.HmacSha1](macalgorithmnames_hmacsha1.md)
     * + [MacAlgorithmNames.HmacSha256](macalgorithmnames_hmacsha256.md)
     * + [MacAlgorithmNames.HmacSha384](macalgorithmnames_hmacsha384.md)
     * + [MacAlgorithmNames.HmacSha512](macalgorithmnames_hmacsha512.md)
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmprovider.algorithmname
     * @type {HSTRING} 
     */
    AlgorithmName {
        get => this.get_AlgorithmName()
    }

    /**
     * Gets the length, in bytes, of the message authentication code.
     * @remarks
     * You should verify that the length of the computed HMAC equals the length supported by the specified algorithm. For more information, see the following example.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmprovider.maclength
     * @type {Integer} 
     */
    MacLength {
        get => this.get_MacLength()
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
        if (!this.HasProp("__IMacAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IMacAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMacAlgorithmProvider := IMacAlgorithmProvider(outPtr)
        }

        return this.__IMacAlgorithmProvider.get_AlgorithmName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MacLength() {
        if (!this.HasProp("__IMacAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IMacAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMacAlgorithmProvider := IMacAlgorithmProvider(outPtr)
        }

        return this.__IMacAlgorithmProvider.get_MacLength()
    }

    /**
     * Creates a symmetric key that can be used to create the MAC value.
     * @param {IBuffer} keyMaterial Random data used to help generate the key. You can call the [GenerateRandom](../windows.security.cryptography/cryptographicbuffer_generaterandom_1645545930.md) method to create the random data.
     * @returns {CryptographicKey} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmprovider.createkey
     */
    CreateKey(keyMaterial) {
        if (!this.HasProp("__IMacAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IMacAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMacAlgorithmProvider := IMacAlgorithmProvider(outPtr)
        }

        return this.__IMacAlgorithmProvider.CreateKey(keyMaterial)
    }

    /**
     * Creates a [CryptographicHash](cryptographichash.md) object that supports incremental hash operations.
     * @remarks
     * Note that using the same *keyMaterial* will result in the same hashes being produced by the returned **CryptographicHash** for the same input. The *keyMaterial* provided should be known data in order to re-create the hash later.
     * @param {IBuffer} keyMaterial Random data used to help generate the hash. You can call the [GenerateRandom](../windows.security.cryptography/cryptographicbuffer_generaterandom_1645545930.md) method to create the random data.
     * @returns {CryptographicHash} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.macalgorithmprovider.createhash
     */
    CreateHash(keyMaterial) {
        if (!this.HasProp("__IMacAlgorithmProvider2")) {
            if ((queryResult := this.QueryInterface(IMacAlgorithmProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMacAlgorithmProvider2 := IMacAlgorithmProvider2(outPtr)
        }

        return this.__IMacAlgorithmProvider2.CreateHash(keyMaterial)
    }

;@endregion Instance Methods
}
