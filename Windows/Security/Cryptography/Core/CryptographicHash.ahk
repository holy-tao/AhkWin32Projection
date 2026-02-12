#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHashComputation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a reusable hashing object and contains the result of a hashing operation.
 * @remarks
 * Call the [HashAlgorithmProvider.CreateHash](hashalgorithmprovider_createhash_203787775.md) or [MacAlgorithmProvider.CreateHash](macalgorithmprovider_createhash_851111259.md) method to create a CryptographicHash object. You can open a hash algorithm provider, by name, for any of the following algorithm names:
 * 
 * 
 * + MD5
 * + SHA1
 * + SHA256
 * + SHA384
 * + SHA512
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographichash
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class CryptographicHash extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHashComputation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHashComputation.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Appends a binary encoded string to the data stored in the [CryptographicHash](cryptographichash.md) object.
     * @remarks
     * Call the [GetValueAndReset](cryptographichash_getvalueandreset_1479544497.md) method to retrieve data from the [CryptographicHash](cryptographichash.md) object and empty the buffer.
     * @param {IBuffer} data Data to append.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographichash.append
     */
    Append(data) {
        if (!this.HasProp("__IHashComputation")) {
            if ((queryResult := this.QueryInterface(IHashComputation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHashComputation := IHashComputation(outPtr)
        }

        return this.__IHashComputation.Append(data)
    }

    /**
     * Gets hashed data from the [CryptographicHash](cryptographichash.md) object and resets the object.
     * @remarks
     * Call the [Append](cryptographichash_append_1115721057.md) method to add data to the [CryptographicHash](cryptographichash.md) object.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographichash.getvalueandreset
     */
    GetValueAndReset() {
        if (!this.HasProp("__IHashComputation")) {
            if ((queryResult := this.QueryInterface(IHashComputation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHashComputation := IHashComputation(outPtr)
        }

        return this.__IHashComputation.GetValueAndReset()
    }

;@endregion Instance Methods
}
