#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEncryptedAndAuthenticatedData.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains data that can be retrieved from encrypted and authenticated data. Authenticated encryption algorithms are opened by using the [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) class.
 * @remarks
 * Authenticated encryption encrypts and authenticates content in one operation. An authenticator, also called a tag, is used during encryption and the output of the process contains a tag-ciphertext pair. For more information, see the [AuthenticationTag](encryptedandauthenticateddata_authenticationtag.md) and [EncryptedData](encryptedandauthenticateddata_encrypteddata.md) properties. The decryption process verifies the ciphertext against the tag.
 * 
 * You can use an authenticated encryption algorithm after calling the [OpenAlgorithm](symmetrickeyalgorithmprovider_openalgorithm_637226074.md) method on the [SymmetricKeyAlgorithmProvider](symmetrickeyalgorithmprovider.md) class and specifying the name of the algorithm to open. The following algorithm names are supported for authenticated encryption and decryption:
 * 
 * 
 * + AES_GCM
 * + AES_CCM
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.encryptedandauthenticateddata
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class EncryptedAndAuthenticatedData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEncryptedAndAuthenticatedData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEncryptedAndAuthenticatedData.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the encrypted data.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.encryptedandauthenticateddata.encrypteddata
     * @type {IBuffer} 
     */
    EncryptedData {
        get => this.get_EncryptedData()
    }

    /**
     * Gets the authentication tag.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.encryptedandauthenticateddata.authenticationtag
     * @type {IBuffer} 
     */
    AuthenticationTag {
        get => this.get_AuthenticationTag()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_EncryptedData() {
        if (!this.HasProp("__IEncryptedAndAuthenticatedData")) {
            if ((queryResult := this.QueryInterface(IEncryptedAndAuthenticatedData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEncryptedAndAuthenticatedData := IEncryptedAndAuthenticatedData(outPtr)
        }

        return this.__IEncryptedAndAuthenticatedData.get_EncryptedData()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_AuthenticationTag() {
        if (!this.HasProp("__IEncryptedAndAuthenticatedData")) {
            if ((queryResult := this.QueryInterface(IEncryptedAndAuthenticatedData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEncryptedAndAuthenticatedData := IEncryptedAndAuthenticatedData(outPtr)
        }

        return this.__IEncryptedAndAuthenticatedData.get_AuthenticationTag()
    }

;@endregion Instance Methods
}
