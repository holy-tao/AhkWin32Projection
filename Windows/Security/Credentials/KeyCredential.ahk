#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyCredential.ahk
#Include .\IKeyCredential2.ahk
#Include .\IKeyCredentialWithWindow.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a key credential, an RSA, 2048-bit, asymmetric key that represents a user's identity for an application.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredential
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class KeyCredential extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyCredential

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyCredential.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the key credential.
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredential.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
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
    get_Name() {
        if (!this.HasProp("__IKeyCredential")) {
            if ((queryResult := this.QueryInterface(IKeyCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredential := IKeyCredential(outPtr)
        }

        return this.__IKeyCredential.get_Name()
    }

    /**
     * Gets the public portion of the asymmetric [KeyCredential](keycredential.md).
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredential.retrievepublickey
     */
    RetrievePublicKeyWithDefaultBlobType() {
        if (!this.HasProp("__IKeyCredential")) {
            if ((queryResult := this.QueryInterface(IKeyCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredential := IKeyCredential(outPtr)
        }

        return this.__IKeyCredential.RetrievePublicKeyWithDefaultBlobType()
    }

    /**
     * Gets the public portion of the asymmetric [KeyCredential](keycredential.md).
     * @param {Integer} blobType 
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredential.retrievepublickey
     */
    RetrievePublicKeyWithBlobType(blobType) {
        if (!this.HasProp("__IKeyCredential")) {
            if ((queryResult := this.QueryInterface(IKeyCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredential := IKeyCredential(outPtr)
        }

        return this.__IKeyCredential.RetrievePublicKeyWithBlobType(blobType)
    }

    /**
     * Prompts the user to cryptographcally sign data using their key credential.
     * @param {IBuffer} data The data to cryptographically sign.
     * @returns {IAsyncOperation<KeyCredentialOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredential.requestsignasync
     */
    RequestSignAsync(data) {
        if (!this.HasProp("__IKeyCredential")) {
            if ((queryResult := this.QueryInterface(IKeyCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredential := IKeyCredential(outPtr)
        }

        return this.__IKeyCredential.RequestSignAsync(data)
    }

    /**
     * Gets an attestation for a key credential. Call this method after provisioning a key credential for the current user and application.
     * @returns {IAsyncOperation<KeyCredentialAttestationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredential.getattestationasync
     */
    GetAttestationAsync() {
        if (!this.HasProp("__IKeyCredential")) {
            if ((queryResult := this.QueryInterface(IKeyCredential.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredential := IKeyCredential(outPtr)
        }

        return this.__IKeyCredential.GetAttestationAsync()
    }

    /**
     * 
     * @param {WindowId} windowId_ 
     * @param {HSTRING} message 
     * @param {IBuffer} publicKey 
     * @returns {IAsyncOperation<KeyCredentialOperationResult>} 
     */
    RequestDeriveSharedSecretAsync(windowId_, message, publicKey) {
        if (!this.HasProp("__IKeyCredential2")) {
            if ((queryResult := this.QueryInterface(IKeyCredential2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredential2 := IKeyCredential2(outPtr)
        }

        return this.__IKeyCredential2.RequestDeriveSharedSecretAsync(windowId_, message, publicKey)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    RetrieveAuthorizationContext() {
        if (!this.HasProp("__IKeyCredential2")) {
            if ((queryResult := this.QueryInterface(IKeyCredential2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredential2 := IKeyCredential2(outPtr)
        }

        return this.__IKeyCredential2.RetrieveAuthorizationContext()
    }

    /**
     * 
     * @param {WindowId} window_ 
     * @param {IBuffer} data 
     * @returns {IAsyncOperation<KeyCredentialOperationResult>} 
     */
    RequestSignForWindowAsync(window_, data) {
        if (!this.HasProp("__IKeyCredentialWithWindow")) {
            if ((queryResult := this.QueryInterface(IKeyCredentialWithWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyCredentialWithWindow := IKeyCredentialWithWindow(outPtr)
        }

        return this.__IKeyCredentialWithWindow.RequestSignForWindowAsync(window_, data)
    }

;@endregion Instance Methods
}
