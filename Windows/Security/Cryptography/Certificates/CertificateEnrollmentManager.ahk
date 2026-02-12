#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICertificateEnrollmentManagerStatics2.ahk
#Include .\ICertificateEnrollmentManagerStatics3.ahk
#Include .\ICertificateEnrollmentManagerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a certificate enrollment manager.
 * @remarks
 * Call the [CreateRequestAsync](certificateenrollmentmanager_createrequestasync_1910274509.md) method to create an instance of the CertificateEnrollmentManager object.
 * 
 * This class contains only static properties. You do not have to create an instance of the class to retrieve the properties. Instead, use the class name followed by the dot operator (.), followed by the property name.
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificateenrollmentmanager
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CertificateEnrollmentManager extends IInspectable {
;@region Static Properties
    /**
     * Gets the associated [UserCertificateEnrollmentManager](usercertificateenrollmentmanager.md).
     * @remarks
     * This API installs certificates in the app's certificate store. Certificates in an app's certificate store are only discoverable and usable by that app. To install a certificate in the user's certificate store, enable the **sharedUserCertificates** capability and use the [UserCertificateEnrollmentManager](usercertificateenrollmentmanager.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificateenrollmentmanager.usercertificateenrollmentmanager
     * @type {UserCertificateEnrollmentManager} 
     */
    static UserCertificateEnrollmentManager {
        get => CertificateEnrollmentManager.get_UserCertificateEnrollmentManager()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {UserCertificateEnrollmentManager} 
     */
    static get_UserCertificateEnrollmentManager() {
        if (!CertificateEnrollmentManager.HasProp("__ICertificateEnrollmentManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateEnrollmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateEnrollmentManagerStatics2.IID)
            CertificateEnrollmentManager.__ICertificateEnrollmentManagerStatics2 := ICertificateEnrollmentManagerStatics2(factoryPtr)
        }

        return CertificateEnrollmentManager.__ICertificateEnrollmentManagerStatics2.get_UserCertificateEnrollmentManager()
    }

    /**
     * Asynchronously imports a certificate from a Personal Information Exchange (PFX) message using import parameters.
     * @param {HSTRING} pfxData Base64-encoded PFX message.
     * @param {HSTRING} password The password used to decrypt and verify the PFX packet. The password must be exactly the same as the password that was used to encrypt the packet.
     * @param {Integer} exportable 
     * @param {Integer} keyProtectionLevel_ 
     * @param {Integer} installOption 
     * @param {HSTRING} friendlyName 
     * @param {HSTRING} keyStorageProvider 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificateenrollmentmanager.importpfxdataasync
     */
    static ImportPfxDataToKspAsync(pfxData, password, exportable, keyProtectionLevel_, installOption, friendlyName, keyStorageProvider) {
        if (!CertificateEnrollmentManager.HasProp("__ICertificateEnrollmentManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateEnrollmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateEnrollmentManagerStatics2.IID)
            CertificateEnrollmentManager.__ICertificateEnrollmentManagerStatics2 := ICertificateEnrollmentManagerStatics2(factoryPtr)
        }

        return CertificateEnrollmentManager.__ICertificateEnrollmentManagerStatics2.ImportPfxDataToKspAsync(pfxData, password, exportable, keyProtectionLevel_, installOption, friendlyName, keyStorageProvider)
    }

    /**
     * Asynchronously imports a certificate from a Personal Information Exchange (PFX) message using import parameters.
     * @param {HSTRING} pfxData Base64-encoded PFX message.
     * @param {HSTRING} password The password used to decrypt and verify the PFX packet. The password must be exactly the same as the password that was used to encrypt the packet.
     * @param {PfxImportParameters} pfxImportParameters_ The PFX import parameters.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificateenrollmentmanager.importpfxdataasync
     */
    static ImportPfxDataToKspWithParametersAsync(pfxData, password, pfxImportParameters_) {
        if (!CertificateEnrollmentManager.HasProp("__ICertificateEnrollmentManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateEnrollmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateEnrollmentManagerStatics3.IID)
            CertificateEnrollmentManager.__ICertificateEnrollmentManagerStatics3 := ICertificateEnrollmentManagerStatics3(factoryPtr)
        }

        return CertificateEnrollmentManager.__ICertificateEnrollmentManagerStatics3.ImportPfxDataToKspWithParametersAsync(pfxData, password, pfxImportParameters_)
    }

    /**
     * Asynchronously creates a PKCS #10 certificate request based on properties specified in a [CertificateRequestProperties](certificaterequestproperties.md) object.
     * @remarks
     * Certificate enrollment can be performed in an app container. We recommend that you use the following request objects to submit the request:
     * 
     * + [XMLHttpRequest](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) (JavaScript)
     * + [HttpWebRequest](/dotnet/api/system.net.httpwebrequest?view=dotnet-uwp-10.0&preserve-view=true) (C#)
     * + [IXMLHTTPRequest](/previous-versions/windows/desktop/ms759148(v=vs.85)) (C++)
     * 
     * The [CertificateRequestProperties](certificaterequestproperties.md) object contains the following default values.
     * 
     * | Property | Default value |
     * |---|---|
     * | [Subject](certificaterequestproperties_subject.md) | Empty string |
     * | [KeyAlgorithmName](certificaterequestproperties_keyalgorithmname.md) | RSA |
     * | [KeySize](certificaterequestproperties_keysize.md) | 2048 bits |
     * | [FriendlyName](certificaterequestproperties_friendlyname.md) | Empty String |
     * | [HashAlgorithmName](certificaterequestproperties_hashalgorithmname.md) | SHA256 |
     * | [Exportable](certificaterequestproperties_exportable.md) | Not Exportable |
     * | [KeyUsages](certificaterequestproperties_keyusages.md) | Signing |
     * | [KeyProtectionLevel](certificaterequestproperties_keyprotectionlevel.md) | NoConsent |
     * | [KeyStorageProviderName](certificaterequestproperties_keystorageprovidername.md) | Microsoft Software Key Storage Provider |
     * 
     * While the CreateRequestAsync method creates the certificate request, you will need to submit the request to an http enrollment end point. You can then take the response from the http enrollment end point and then call the [InstallCertificateAsync](certificateenrollmentmanager_installcertificateasync_225635424.md) method to install the response.
     * 
     * 
     * 
     * > [!NOTE]
     * > You must include the **Signing** value in the [KeyUsages](certificaterequestproperties_keyusages.md) property in any [CertificateRequestProperties](certificaterequestproperties.md) object that you use in a call to **CreateRequestAsync**. If you wish to set [KeyUsages](certificaterequestproperties_keyusages.md) to **Decryption** or **KeyAgreement**, you must also OR in **Signing**. Otherwise, the call to **CreateRequestAsync** will fail.
     * @param {CertificateRequestProperties} request A [CertificateRequestProperties](certificaterequestproperties.md) object that contains the property values used to create the certificate request.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificateenrollmentmanager.createrequestasync
     */
    static CreateRequestAsync(request) {
        if (!CertificateEnrollmentManager.HasProp("__ICertificateEnrollmentManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateEnrollmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateEnrollmentManagerStatics.IID)
            CertificateEnrollmentManager.__ICertificateEnrollmentManagerStatics := ICertificateEnrollmentManagerStatics(factoryPtr)
        }

        return CertificateEnrollmentManager.__ICertificateEnrollmentManagerStatics.CreateRequestAsync(request)
    }

    /**
     * Asynchronously Installs a certificate chain into the app container on the local computer.
     * @remarks
     * This method installs the certificate chain into the app container:
     * 
     * 
     * + The certificate request for the input certificate must have been previously generated on the local computer by calling the [CreateRequestAsync](certificateenrollmentmanager_createrequestasync_1910274509.md) method.
     * + The certificates included in the response need not be chained to trusted root certificates on the installing computer.
     * + The certificate is installed in the app container MY store.
     * + Certification authority (CA) and Root certificates are installed in the app container intermediate CA store.
     * @param {HSTRING} certificate_ The encoded certificate. The *certificate* is encoded by using Distinguished Encoding Rules (DER) as defined by the Abstract Syntax Notation One (ASN.1) standard.
     * @param {Integer} installOption An [InstallOptions](installoptions.md) enumeration value that specifies the certificate installation option.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificateenrollmentmanager.installcertificateasync
     */
    static InstallCertificateAsync(certificate_, installOption) {
        if (!CertificateEnrollmentManager.HasProp("__ICertificateEnrollmentManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateEnrollmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateEnrollmentManagerStatics.IID)
            CertificateEnrollmentManager.__ICertificateEnrollmentManagerStatics := ICertificateEnrollmentManagerStatics(factoryPtr)
        }

        return CertificateEnrollmentManager.__ICertificateEnrollmentManagerStatics.InstallCertificateAsync(certificate_, installOption)
    }

    /**
     * Asynchronously imports a certificate from a Personal Information Exchange (PFX) message using the specified key storage provider.
     * @remarks
     * This method imports the certificate chain into the app container.
     * 
     * 
     * + To import an issued certificate, it is not necessary for the certificate request to have been generated on the importing computer.
     * + The certificates included in the response need not be chained to trusted root certificates on the importing computer.
     * + The certificate is installed in the app container MY store.
     * + [Certification authority](/windows/desktop/SecGloss/c-gly) and Root certificates are installed in the app container intermediate [certification authority](/windows/desktop/SecGloss/c-gly) store.
     * + The key container name and key specification for the imported certificate are determined as described in the Remarks section of [PFXImportCertStore](/windows/desktop/api/wincrypt/nf-wincrypt-pfximportcertstore) with the exception that if AttributeId 1.3.6.1.4.1.311.17.1 is not present, MS_KEY_STORAGE_PROVIDER is always used as the provider name.
     * @param {HSTRING} pfxData Base64-encoded PFX message.
     * @param {HSTRING} password The password used to decrypt and verify the PFX packet. The password must be exactly the same as the password that was used to encrypt the packet.
     * @param {Integer} exportable A value of the [ExportOption](exportoption.md) enumeration that specifies whether the key can be exported.
     * @param {Integer} keyProtectionLevel_ A value of the [KeyProtectionLevel](keyprotectionlevel.md) enumeration that specifies the strength of the key protection. The default is **NoConsent**.
     * @param {Integer} installOption An [InstallOptions](installoptions.md) enumeration value that specifies the certificate installation option.
     * @param {HSTRING} friendlyName The display name of the enrolled certificate. This value overwrites the **FriendlyName** property inside the PFX message.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificateenrollmentmanager.importpfxdataasync
     */
    static ImportPfxDataAsync(pfxData, password, exportable, keyProtectionLevel_, installOption, friendlyName) {
        if (!CertificateEnrollmentManager.HasProp("__ICertificateEnrollmentManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CertificateEnrollmentManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICertificateEnrollmentManagerStatics.IID)
            CertificateEnrollmentManager.__ICertificateEnrollmentManagerStatics := ICertificateEnrollmentManagerStatics(factoryPtr)
        }

        return CertificateEnrollmentManager.__ICertificateEnrollmentManagerStatics.ImportPfxDataAsync(pfxData, password, exportable, keyProtectionLevel_, installOption, friendlyName)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
