#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICertificateStoresStatics2.ahk
#Include .\ICertificateStoresStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a collection of certificate stores.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatestores
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CertificateStores extends IInspectable {
;@region Static Properties
    /**
     * Gets the certificate store of trusted root certificates for an app.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatestores.trustedrootcertificationauthorities
     * @type {CertificateStore} 
     */
    static TrustedRootCertificationAuthorities {
        get => CertificateStores.get_TrustedRootCertificationAuthorities()
    }

    /**
     * Gets the certificate store of intermediate certification authorities for an app.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatestores.intermediatecertificationauthorities
     * @type {CertificateStore} 
     */
    static IntermediateCertificationAuthorities {
        get => CertificateStores.get_IntermediateCertificationAuthorities()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a user certificate store from the collection of certificate stores by name.
     * @param {HSTRING} storeName The name of the user certificate store to return.
     * @returns {UserCertificateStore} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatestores.getuserstorebyname
     */
    static GetUserStoreByName(storeName) {
        if (!CertificateStores.HasProp("__ICertificateStoresStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateStores")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateStoresStatics2.IID)
            CertificateStores.__ICertificateStoresStatics2 := ICertificateStoresStatics2(factoryPtr)
        }

        return CertificateStores.__ICertificateStoresStatics2.GetUserStoreByName(storeName)
    }

    /**
     * Get all certificates from the certificate stores that match the specified query parameters.
     * @remarks
     * The FindAllAsync method filters the resulting list of certificates and removes duplicates, showing only the most recent certificate when duplicates are found. This only occurs if the app is running in an app container. Duplicate certificates are certificates that have the same subject and issuer.
     * 
     * Expired certificates are not returned in the list of certificates.
     * @returns {IAsyncOperation<IVectorView<Certificate>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatestores.findallasync
     */
    static FindAllAsync() {
        if (!CertificateStores.HasProp("__ICertificateStoresStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateStores")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateStoresStatics.IID)
            CertificateStores.__ICertificateStoresStatics := ICertificateStoresStatics(factoryPtr)
        }

        return CertificateStores.__ICertificateStoresStatics.FindAllAsync()
    }

    /**
     * Get all certificates from the certificate stores.
     * @remarks
     * The [FindAllAsync](certificatestores_findallasync_1029446703.md) method filters the resulting list of certificates and removes duplicates, showing only the most recent certificate when duplicates are found. This only occurs if the app is running in an app container. Duplicate certificates are certificates that have the same subject and issuer.
     * 
     * Expired certificates are not returned in the list of certificates.
     * @param {CertificateQuery} query 
     * @returns {IAsyncOperation<IVectorView<Certificate>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatestores.findallasync
     */
    static FindAllWithQueryAsync(query) {
        if (!CertificateStores.HasProp("__ICertificateStoresStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateStores")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateStoresStatics.IID)
            CertificateStores.__ICertificateStoresStatics := ICertificateStoresStatics(factoryPtr)
        }

        return CertificateStores.__ICertificateStoresStatics.FindAllWithQueryAsync(query)
    }

    /**
     * 
     * @returns {CertificateStore} 
     */
    static get_TrustedRootCertificationAuthorities() {
        if (!CertificateStores.HasProp("__ICertificateStoresStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateStores")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateStoresStatics.IID)
            CertificateStores.__ICertificateStoresStatics := ICertificateStoresStatics(factoryPtr)
        }

        return CertificateStores.__ICertificateStoresStatics.get_TrustedRootCertificationAuthorities()
    }

    /**
     * 
     * @returns {CertificateStore} 
     */
    static get_IntermediateCertificationAuthorities() {
        if (!CertificateStores.HasProp("__ICertificateStoresStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateStores")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateStoresStatics.IID)
            CertificateStores.__ICertificateStoresStatics := ICertificateStoresStatics(factoryPtr)
        }

        return CertificateStores.__ICertificateStoresStatics.get_IntermediateCertificationAuthorities()
    }

    /**
     * Gets a certificate store from the collection of certificate stores by name.
     * @param {HSTRING} storeName The name of the certificate store to return. The *storeName* parameter value cannot be "MY".
     * @returns {CertificateStore} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatestores.getstorebyname
     */
    static GetStoreByName(storeName) {
        if (!CertificateStores.HasProp("__ICertificateStoresStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateStores")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateStoresStatics.IID)
            CertificateStores.__ICertificateStoresStatics := ICertificateStoresStatics(factoryPtr)
        }

        return CertificateStores.__ICertificateStoresStatics.GetStoreByName(storeName)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
