#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPersistedKeyProviderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Retrieves a persisted key from a [Certificate](../windows.security.cryptography.certificates/certificate.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.persistedkeyprovider
 * @namespace Windows.Security.Cryptography.Core
 * @version WindowsRuntime 1.4
 */
class PersistedKeyProvider extends IInspectable {
;@region Static Methods
    /**
     * Opens the persisted private key from the specified [Certificate](../windows.security.cryptography.certificates/certificate.md) object.
     * @param {Certificate} certificate_ The certificate that is associated with the private key.
     * @param {HSTRING} hashAlgorithmName The hash algorithm for signature operations. For encryption, the hash algorithm is ignored.
     * @param {Integer} padding The padding mode for asymmetric algorithm signature or encryption operations.
     * @returns {IAsyncOperation<CryptographicKey>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.persistedkeyprovider.openkeypairfromcertificateasync
     */
    static OpenKeyPairFromCertificateAsync(certificate_, hashAlgorithmName, padding) {
        if (!PersistedKeyProvider.HasProp("__IPersistedKeyProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.PersistedKeyProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersistedKeyProviderStatics.IID)
            PersistedKeyProvider.__IPersistedKeyProviderStatics := IPersistedKeyProviderStatics(factoryPtr)
        }

        return PersistedKeyProvider.__IPersistedKeyProviderStatics.OpenKeyPairFromCertificateAsync(certificate_, hashAlgorithmName, padding)
    }

    /**
     * Opens the persisted public key from the specified [Certificate](../windows.security.cryptography.certificates/certificate.md) object.
     * @param {Certificate} certificate_ The certificate that contains the public key.
     * @param {HSTRING} hashAlgorithmName The has algorithm for signature operations.
     * @param {Integer} padding The padding mode for asymmetric algorithm signature or encryption operations.
     * @returns {CryptographicKey} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.core.persistedkeyprovider.openpublickeyfromcertificate
     */
    static OpenPublicKeyFromCertificate(certificate_, hashAlgorithmName, padding) {
        if (!PersistedKeyProvider.HasProp("__IPersistedKeyProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Core.PersistedKeyProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPersistedKeyProviderStatics.IID)
            PersistedKeyProvider.__IPersistedKeyProviderStatics := IPersistedKeyProviderStatics(factoryPtr)
        }

        return PersistedKeyProvider.__IPersistedKeyProviderStatics.OpenPublicKeyFromCertificate(certificate_, hashAlgorithmName, padding)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
