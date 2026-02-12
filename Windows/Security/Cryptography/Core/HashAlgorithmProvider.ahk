#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHashAlgorithmProvider.ahk
#Include .\IHashAlgorithmProviderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a cryptographic hash provider. For more information about hashes, see [MACs, hashes, and signatures](/windows/uwp/security/macs-hashes-and-signatures).
 * @remarks
 * You create a HashAlgorithmProvider object by calling the static [OpenAlgorithm](hashalgorithmprovider_openalgorithm_637226074.md) method and specifying one of the following algorithm names:
 * + MD5
 * + SHA1
 * + SHA256
 * + SHA384
 * + SHA512
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.hashalgorithmprovider
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class HashAlgorithmProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHashAlgorithmProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHashAlgorithmProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [HashAlgorithmProvider](hashalgorithmprovider.md) object and opens the specified algorithm for use.
     * @remarks
     * The following hashing algorithm names are supported:
     * 
     * 
     * + [HashAlgorithmNames.Md5](hashalgorithmnames_md5.md)
     * + [HashAlgorithmNames.Sha1](hashalgorithmnames_sha1.md)
     * + [HashAlgorithmNames.Sha256](hashalgorithmnames_sha256.md)
     * + [HashAlgorithmNames.Sha384](hashalgorithmnames_sha384.md)
     * + [HashAlgorithmNames.Sha512](hashalgorithmnames_sha512.md)
     * @param {HSTRING} algorithm Algorithm name.
     * @returns {HashAlgorithmProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.hashalgorithmprovider.openalgorithm
     */
    static OpenAlgorithm(algorithm) {
        if (!HashAlgorithmProvider.HasProp("__IHashAlgorithmProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.HashAlgorithmProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHashAlgorithmProviderStatics.IID)
            HashAlgorithmProvider.__IHashAlgorithmProviderStatics := IHashAlgorithmProviderStatics(factoryPtr)
        }

        return HashAlgorithmProvider.__IHashAlgorithmProviderStatics.OpenAlgorithm(algorithm)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name of the open hash algorithm.
     * @remarks
     * The following hashing algorithm names are supported:
     * 
     * 
     * + [HashAlgorithmNames.Md5](hashalgorithmnames_md5.md)
     * + [HashAlgorithmNames.Sha1](hashalgorithmnames_sha1.md)
     * + [HashAlgorithmNames.Sha256](hashalgorithmnames_sha256.md)
     * + [HashAlgorithmNames.Sha384](hashalgorithmnames_sha384.md)
     * + [HashAlgorithmNames.Sha512](hashalgorithmnames_sha512.md)
     * You must call the [OpenAlgorithm](hashalgorithmprovider_openalgorithm_637226074.md) method before calling this property.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.hashalgorithmprovider.algorithmname
     * @type {HSTRING} 
     */
    AlgorithmName {
        get => this.get_AlgorithmName()
    }

    /**
     * Gets the length, in bytes, of the hash.
     * @remarks
     * You should verify that the length of the hashed data equals the hash length supported by the specified algorithm. For more information, see the following code example.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.hashalgorithmprovider.hashlength
     * @type {Integer} 
     */
    HashLength {
        get => this.get_HashLength()
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
        if (!this.HasProp("__IHashAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IHashAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHashAlgorithmProvider := IHashAlgorithmProvider(outPtr)
        }

        return this.__IHashAlgorithmProvider.get_AlgorithmName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HashLength() {
        if (!this.HasProp("__IHashAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IHashAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHashAlgorithmProvider := IHashAlgorithmProvider(outPtr)
        }

        return this.__IHashAlgorithmProvider.get_HashLength()
    }

    /**
     * Hashes binary data.
     * @remarks
     * See the [CryptographicHash](cryptographichash.md) class for information about creating a reusable hashing object.
     * @param {IBuffer} data Data to be hashed.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.hashalgorithmprovider.hashdata
     */
    HashData(data) {
        if (!this.HasProp("__IHashAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IHashAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHashAlgorithmProvider := IHashAlgorithmProvider(outPtr)
        }

        return this.__IHashAlgorithmProvider.HashData(data)
    }

    /**
     * Creates a reusable [CryptographicHash](cryptographichash.md) object.
     * @remarks
     * You must call the [OpenAlgorithm](hashalgorithmprovider_openalgorithm_637226074.md) method before calling this property. Call the [Append](cryptographichash_append_1115721057.md) method on the [CryptographicHash](cryptographichash.md) object to copy hashed data into a buffer. Call the [GetValueAndReset](cryptographichash_getvalueandreset_1479544497.md) method to retrieve the hashed data and reset the [CryptographicHash](cryptographichash.md) object so that it can be used again to hash more data.
     * @returns {CryptographicHash} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.hashalgorithmprovider.createhash
     */
    CreateHash() {
        if (!this.HasProp("__IHashAlgorithmProvider")) {
            if ((queryResult := this.QueryInterface(IHashAlgorithmProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHashAlgorithmProvider := IHashAlgorithmProvider(outPtr)
        }

        return this.__IHashAlgorithmProvider.CreateHash()
    }

;@endregion Instance Methods
}
