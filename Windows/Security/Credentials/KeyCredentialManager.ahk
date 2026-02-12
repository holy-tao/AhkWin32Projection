#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyCredentialManagerStatics.ahk
#Include .\IKeyCredentialManagerCreateWithWindowStatics.ahk
#Include .\IKeyCredentialManagerExtendedStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains methods for basic management of key credentials.
 * @remarks
 * The `KeyCredentialManager` class provides methods to manage key credentials, which are RSA 2048-bit keys. These keys are used for secure authentication and cryptographic operations.
 * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialmanager
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class KeyCredentialManager extends IInspectable {
;@region Static Methods
    /**
     * Determines if the current device and user is capable of provisioning a key credential.
     * @remarks
     * The `IsSupportedAsync` method checks if the current device and user can provision a key credential. This requires:
     * 
     * 1. A Microsoft account linked to the user.
     * 1. An unlock gesture (PIN or biometric) set up to protect the key container.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialmanager.issupportedasync
     */
    static IsSupportedAsync() {
        if (!KeyCredentialManager.HasProp("__IKeyCredentialManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.KeyCredentialManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyCredentialManagerStatics.IID)
            KeyCredentialManager.__IKeyCredentialManagerStatics := IKeyCredentialManagerStatics(factoryPtr)
        }

        return KeyCredentialManager.__IKeyCredentialManagerStatics.IsSupportedAsync()
    }

    /**
     * Renews an attestation for a key credential.
     * @remarks
     * The `RenewAttestationAsync` method renews the attestation for an existing key credential. This ensures that the attestation remains valid and up-to-date.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialmanager.renewattestationasync
     */
    static RenewAttestationAsync() {
        if (!KeyCredentialManager.HasProp("__IKeyCredentialManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.KeyCredentialManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyCredentialManagerStatics.IID)
            KeyCredentialManager.__IKeyCredentialManagerStatics := IKeyCredentialManagerStatics(factoryPtr)
        }

        return KeyCredentialManager.__IKeyCredentialManagerStatics.RenewAttestationAsync()
    }

    /**
     * Creates a new key credential for the current user and application.
     * @remarks
     * The `RequestCreateAsync` method generates a new RSA 2048-bit key credential. The generated key is stored securely and can be used for cryptographic operations.
     * @param {HSTRING} name The name of the key credential to create.
     * @param {Integer} option Options for the creation operation.
     * @returns {IAsyncOperation<KeyCredentialRetrievalResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialmanager.requestcreateasync
     */
    static RequestCreateAsync(name, option) {
        if (!KeyCredentialManager.HasProp("__IKeyCredentialManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.KeyCredentialManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyCredentialManagerStatics.IID)
            KeyCredentialManager.__IKeyCredentialManagerStatics := IKeyCredentialManagerStatics(factoryPtr)
        }

        return KeyCredentialManager.__IKeyCredentialManagerStatics.RequestCreateAsync(name, option)
    }

    /**
     * Retrieves a key credential for the current user and application.
     * @remarks
     * The `OpenAsync` method retrieves an existing key credential. The retrieved key can be used for cryptographic operations such as signing and encryption.
     * @param {HSTRING} name The name of the key credential to open.
     * @returns {IAsyncOperation<KeyCredentialRetrievalResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialmanager.openasync
     */
    static OpenAsync(name) {
        if (!KeyCredentialManager.HasProp("__IKeyCredentialManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.KeyCredentialManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyCredentialManagerStatics.IID)
            KeyCredentialManager.__IKeyCredentialManagerStatics := IKeyCredentialManagerStatics(factoryPtr)
        }

        return KeyCredentialManager.__IKeyCredentialManagerStatics.OpenAsync(name)
    }

    /**
     * Deletes a previously provisioned user identity key for the current user and application.
     * @remarks
     * The `DeleteAsync` method removes a previously provisioned key credential. This operation is irreversible and ensures that the key is no longer accessible.
     * @param {HSTRING} name The name of the key to delete.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialmanager.deleteasync
     */
    static DeleteAsync(name) {
        if (!KeyCredentialManager.HasProp("__IKeyCredentialManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.KeyCredentialManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyCredentialManagerStatics.IID)
            KeyCredentialManager.__IKeyCredentialManagerStatics := IKeyCredentialManagerStatics(factoryPtr)
        }

        return KeyCredentialManager.__IKeyCredentialManagerStatics.DeleteAsync(name)
    }

    /**
     * 
     * @param {WindowId} window_ 
     * @param {HSTRING} name 
     * @param {Integer} option 
     * @returns {IAsyncOperation<KeyCredentialRetrievalResult>} 
     */
    static RequestCreateForWindowAsync(window_, name, option) {
        if (!KeyCredentialManager.HasProp("__IKeyCredentialManagerCreateWithWindowStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.KeyCredentialManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyCredentialManagerCreateWithWindowStatics.IID)
            KeyCredentialManager.__IKeyCredentialManagerCreateWithWindowStatics := IKeyCredentialManagerCreateWithWindowStatics(factoryPtr)
        }

        return KeyCredentialManager.__IKeyCredentialManagerCreateWithWindowStatics.RequestCreateForWindowAsync(window_, name, option)
    }

    /**
     * Creates a new key credential for the current user and application.
     * @remarks
     * The `RequestCreateAsync` method generates a new RSA 2048-bit key credential. The generated key is stored securely and can be used for cryptographic operations.
     * @param {HSTRING} name The name of the key credential to create.
     * @param {Integer} option Options for the creation operation.
     * @param {HSTRING} algorithm 
     * @param {HSTRING} message 
     * @param {KeyCredentialCacheConfiguration} cacheConfiguration 
     * @param {WindowId} windowId_ 
     * @param {Integer} callbackType 
     * @param {AttestationChallengeHandler} attestationCallback 
     * @returns {IAsyncOperation<KeyCredentialRetrievalResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialmanager.requestcreateasync
     */
    static RequestCreateAsync1(name, option, algorithm, message, cacheConfiguration, windowId_, callbackType, attestationCallback) {
        if (!KeyCredentialManager.HasProp("__IKeyCredentialManagerExtendedStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.KeyCredentialManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyCredentialManagerExtendedStatics.IID)
            KeyCredentialManager.__IKeyCredentialManagerExtendedStatics := IKeyCredentialManagerExtendedStatics(factoryPtr)
        }

        return KeyCredentialManager.__IKeyCredentialManagerExtendedStatics.RequestCreateAsync(name, option, algorithm, message, cacheConfiguration, windowId_, callbackType, attestationCallback)
    }

    /**
     * Retrieves a key credential for the current user and application.
     * @remarks
     * The `OpenAsync` method retrieves an existing key credential. The retrieved key can be used for cryptographic operations such as signing and encryption.
     * @param {HSTRING} name The name of the key credential to open.
     * @param {Integer} callbackType 
     * @param {AttestationChallengeHandler} attestationCallback 
     * @returns {IAsyncOperation<KeyCredentialRetrievalResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.credentials.keycredentialmanager.openasync
     */
    static OpenAsync1(name, callbackType, attestationCallback) {
        if (!KeyCredentialManager.HasProp("__IKeyCredentialManagerExtendedStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Credentials.KeyCredentialManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyCredentialManagerExtendedStatics.IID)
            KeyCredentialManager.__IKeyCredentialManagerExtendedStatics := IKeyCredentialManagerExtendedStatics(factoryPtr)
        }

        return KeyCredentialManager.__IKeyCredentialManagerExtendedStatics.OpenAsync(name, callbackType, attestationCallback)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
