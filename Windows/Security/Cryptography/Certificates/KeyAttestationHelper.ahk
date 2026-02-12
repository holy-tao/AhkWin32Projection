#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyAttestationHelperStatics2.ahk
#Include .\IKeyAttestationHelperStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides access to key attestation methods.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyattestationhelper
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class KeyAttestationHelper extends IInspectable {
;@region Static Methods
    /**
     * Decrypts a TPM key attestation credential.
     * @param {HSTRING} credential 
     * @param {HSTRING} containerName 
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyattestationhelper.decrypttpmattestationcredentialasync
     */
    static DecryptTpmAttestationCredentialWithContainerNameAsync(credential, containerName) {
        if (!KeyAttestationHelper.HasProp("__IKeyAttestationHelperStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAttestationHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAttestationHelperStatics2.IID)
            KeyAttestationHelper.__IKeyAttestationHelperStatics2 := IKeyAttestationHelperStatics2(factoryPtr)
        }

        return KeyAttestationHelper.__IKeyAttestationHelperStatics2.DecryptTpmAttestationCredentialWithContainerNameAsync(credential, containerName)
    }

    /**
     * Decrypts a TPM key attestation credential.
     * @param {HSTRING} credential The TPM key attestation credential to decrypt.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyattestationhelper.decrypttpmattestationcredentialasync
     */
    static DecryptTpmAttestationCredentialAsync(credential) {
        if (!KeyAttestationHelper.HasProp("__IKeyAttestationHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAttestationHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAttestationHelperStatics.IID)
            KeyAttestationHelper.__IKeyAttestationHelperStatics := IKeyAttestationHelperStatics(factoryPtr)
        }

        return KeyAttestationHelper.__IKeyAttestationHelperStatics.DecryptTpmAttestationCredentialAsync(credential)
    }

    /**
     * Gets the credential ID from a TPM key attestation credential.
     * @param {HSTRING} credential The TPM key attestation credential to get the credential ID from.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keyattestationhelper.gettpmattestationcredentialid
     */
    static GetTpmAttestationCredentialId(credential) {
        if (!KeyAttestationHelper.HasProp("__IKeyAttestationHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyAttestationHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyAttestationHelperStatics.IID)
            KeyAttestationHelper.__IKeyAttestationHelperStatics := IKeyAttestationHelperStatics(factoryPtr)
        }

        return KeyAttestationHelper.__IKeyAttestationHelperStatics.GetTpmAttestationCredentialId(credential)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
