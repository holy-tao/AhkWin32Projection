#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHashAlgorithmNamesStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains static properties that enable you to retrieve algorithm names that can be used in the [OpenAlgorithm](hashalgorithmprovider_openalgorithm_637226074.md) method of the [HashAlgorithmProvider](hashalgorithmprovider.md) class.
 * @remarks
 * All of the properties associated with this class are static. You do not need to create an instance of the class to retrieve a property value.
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.hashalgorithmnames
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class HashAlgorithmNames extends IInspectable {
;@region Static Properties
    /**
     * Retrieves a string that contains "MD5".
     * @remarks
     * Use the string retrieved by this property to set the hash algorithm name when you call the [OpenAlgorithm](hashalgorithmprovider_openalgorithm_637226074.md) method. The string represents an MD5 message digest algorithm. The algorithm produces a 128-bit hash value.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.hashalgorithmnames.md5
     * @type {HSTRING} 
     */
    static Md5 {
        get => HashAlgorithmNames.get_Md5()
    }

    /**
     * Retrieves a string that contains "SHA1".
     * @remarks
     * Use the string retrieved by this property to set the hash algorithm name when you call the [OpenAlgorithm](hashalgorithmprovider_openalgorithm_637226074.md) method. The string represents a SHA1 (Secure Hash Algorithm 1) message digest algorithm. The algorithm produces a 160-bit hash value.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.hashalgorithmnames.sha1
     * @type {HSTRING} 
     */
    static Sha1 {
        get => HashAlgorithmNames.get_Sha1()
    }

    /**
     * Retrieves a string that contains "SHA256".
     * @remarks
     * Use the string retrieved by this property to set the hash algorithm name when you call the [OpenAlgorithm](hashalgorithmprovider_openalgorithm_637226074.md) method. The string represents a SHA2 (Secure Hash Algorithm 2) message digest algorithm that produces a 256-bit hash value.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.hashalgorithmnames.sha256
     * @type {HSTRING} 
     */
    static Sha256 {
        get => HashAlgorithmNames.get_Sha256()
    }

    /**
     * Retrieves a string that contains "SHA384".
     * @remarks
     * Use the string retrieved by this property to set the hash algorithm name when you call the [OpenAlgorithm](hashalgorithmprovider_openalgorithm_637226074.md) method. The string represents a SHA2 (Secure Hash Algorithm 2) message digest algorithm that produces a 384-bit hash value.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.hashalgorithmnames.sha384
     * @type {HSTRING} 
     */
    static Sha384 {
        get => HashAlgorithmNames.get_Sha384()
    }

    /**
     * Retrieves a string that contains "SHA512".
     * @remarks
     * Use the string retrieved by this property to set the hash algorithm name when you call the [OpenAlgorithm](hashalgorithmprovider_openalgorithm_637226074.md) method. The string represents a SHA2 (Secure Hash Algorithm 2) message digest algorithm that produces a 512-bit hash value.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.hashalgorithmnames.sha512
     * @type {HSTRING} 
     */
    static Sha512 {
        get => HashAlgorithmNames.get_Sha512()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Md5() {
        if (!HashAlgorithmNames.HasProp("__IHashAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.HashAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHashAlgorithmNamesStatics.IID)
            HashAlgorithmNames.__IHashAlgorithmNamesStatics := IHashAlgorithmNamesStatics(factoryPtr)
        }

        return HashAlgorithmNames.__IHashAlgorithmNamesStatics.get_Md5()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sha1() {
        if (!HashAlgorithmNames.HasProp("__IHashAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.HashAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHashAlgorithmNamesStatics.IID)
            HashAlgorithmNames.__IHashAlgorithmNamesStatics := IHashAlgorithmNamesStatics(factoryPtr)
        }

        return HashAlgorithmNames.__IHashAlgorithmNamesStatics.get_Sha1()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sha256() {
        if (!HashAlgorithmNames.HasProp("__IHashAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.HashAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHashAlgorithmNamesStatics.IID)
            HashAlgorithmNames.__IHashAlgorithmNamesStatics := IHashAlgorithmNamesStatics(factoryPtr)
        }

        return HashAlgorithmNames.__IHashAlgorithmNamesStatics.get_Sha256()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sha384() {
        if (!HashAlgorithmNames.HasProp("__IHashAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.HashAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHashAlgorithmNamesStatics.IID)
            HashAlgorithmNames.__IHashAlgorithmNamesStatics := IHashAlgorithmNamesStatics(factoryPtr)
        }

        return HashAlgorithmNames.__IHashAlgorithmNamesStatics.get_Sha384()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sha512() {
        if (!HashAlgorithmNames.HasProp("__IHashAlgorithmNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.HashAlgorithmNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHashAlgorithmNamesStatics.IID)
            HashAlgorithmNames.__IHashAlgorithmNamesStatics := IHashAlgorithmNamesStatics(factoryPtr)
        }

        return HashAlgorithmNames.__IHashAlgorithmNamesStatics.get_Sha512()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
