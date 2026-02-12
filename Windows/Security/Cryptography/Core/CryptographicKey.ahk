#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICryptographicKey.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a symmetric key or an asymmetric key pair.
 * @remarks
 * A CryptographicKey object is created when you use methods that create or import keys in the following classes:
 * 
 * + [AsymmetricKeyAlgorithmProvider](asymmetrickeyalgorithmprovider.md)
 * + [KeyDerivationAlgorithmProvider](keyderivationalgorithmprovider.md)
 * + [MacAlgorithmProvider](macalgorithmprovider.md)
 * + [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md)
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographickey
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class CryptographicKey extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICryptographicKey

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICryptographicKey.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the size, in bits, of the key.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographickey.keysize
     * @type {Integer} 
     */
    KeySize {
        get => this.get_KeySize()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeySize() {
        if (!this.HasProp("__ICryptographicKey")) {
            if ((queryResult := this.QueryInterface(ICryptographicKey.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICryptographicKey := ICryptographicKey(outPtr)
        }

        return this.__ICryptographicKey.get_KeySize()
    }

    /**
     * Exports the key pair to a buffer given a specified format.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographickey.export
     */
    ExportDefaultPrivateKeyBlobType() {
        if (!this.HasProp("__ICryptographicKey")) {
            if ((queryResult := this.QueryInterface(ICryptographicKey.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICryptographicKey := ICryptographicKey(outPtr)
        }

        return this.__ICryptographicKey.ExportDefaultPrivateKeyBlobType()
    }

    /**
     * Exports the key pair to a buffer.
     * @param {Integer} BlobType 
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographickey.export
     */
    ExportPrivateKeyWithBlobType(BlobType) {
        if (!this.HasProp("__ICryptographicKey")) {
            if ((queryResult := this.QueryInterface(ICryptographicKey.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICryptographicKey := ICryptographicKey(outPtr)
        }

        return this.__ICryptographicKey.ExportPrivateKeyWithBlobType(BlobType)
    }

    /**
     * Exports a public key to a buffer given a specified format.
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographickey.exportpublickey
     */
    ExportDefaultPublicKeyBlobType() {
        if (!this.HasProp("__ICryptographicKey")) {
            if ((queryResult := this.QueryInterface(ICryptographicKey.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICryptographicKey := ICryptographicKey(outPtr)
        }

        return this.__ICryptographicKey.ExportDefaultPublicKeyBlobType()
    }

    /**
     * Exports a public key to a buffer.
     * @param {Integer} BlobType 
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.cryptographickey.exportpublickey
     */
    ExportPublicKeyWithBlobType(BlobType) {
        if (!this.HasProp("__ICryptographicKey")) {
            if ((queryResult := this.QueryInterface(ICryptographicKey.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICryptographicKey := ICryptographicKey(outPtr)
        }

        return this.__ICryptographicKey.ExportPublicKeyWithBlobType(BlobType)
    }

;@endregion Instance Methods
}
