#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserCertificateEnrollmentManager.ahk
#Include .\IUserCertificateEnrollmentManager2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides access to certificate creation, import, and enrollment methods.
 * @remarks
 * To use this API, you must enable the **sharedUserCertificates** capability so it can install certificates into the shared user store. For more information on enabling the **sharedUserCertificates** capability, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.usercertificateenrollmentmanager
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class UserCertificateEnrollmentManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserCertificateEnrollmentManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserCertificateEnrollmentManager.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
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
     * 
     * While the CreateRequestAsync method creates the certificate request, you will need to submit the request to an http enrollment end point. You can then take the response from the http enrollment end point and then call the [InstallCertificateAsync](usercertificateenrollmentmanager_installcertificateasync_225635424.md) method to install the response.
     * 
     * > [!NOTE]
     * > You must include the **Signing** value in the [KeyUsages](certificaterequestproperties_keyusages.md) property in any [CertificateRequestProperties](certificaterequestproperties.md) object that you use in a call to **CreateRequestAsync**. If you wish to set [KeyUsages](certificaterequestproperties_keyusages.md) to **Decryption** or **KeyAgreement**, you must also OR in **Signing**. Otherwise, the call to **CreateRequestAsync** will fail.
     * @param {CertificateRequestProperties} request A [CertificateRequestProperties](certificaterequestproperties.md) object that contains the property values used to create the certificate request.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.usercertificateenrollmentmanager.createrequestasync
     */
    CreateRequestAsync(request) {
        if (!this.HasProp("__IUserCertificateEnrollmentManager")) {
            if ((queryResult := this.QueryInterface(IUserCertificateEnrollmentManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserCertificateEnrollmentManager := IUserCertificateEnrollmentManager(outPtr)
        }

        return this.__IUserCertificateEnrollmentManager.CreateRequestAsync(request)
    }

    /**
     * Asynchronously installs a certificate chain into the app container on the local computer.
     * @param {HSTRING} certificate_ The encoded certificate. The *certificate* is encoded by using Distinguished Encoding Rules (DER) as defined by the Abstract Syntax Notation One (ASN.1) standard.
     * @param {Integer} installOption An [InstallOptions](installoptions.md) enumeration value that specifies the certificate installation option.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.usercertificateenrollmentmanager.installcertificateasync
     */
    InstallCertificateAsync(certificate_, installOption) {
        if (!this.HasProp("__IUserCertificateEnrollmentManager")) {
            if ((queryResult := this.QueryInterface(IUserCertificateEnrollmentManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserCertificateEnrollmentManager := IUserCertificateEnrollmentManager(outPtr)
        }

        return this.__IUserCertificateEnrollmentManager.InstallCertificateAsync(certificate_, installOption)
    }

    /**
     * Asynchronously imports a certificate from a Personal Information Exchange (PFX) message using the specified key storage provider.
     * @param {HSTRING} pfxData Base64-encoded PFX message.
     * @param {HSTRING} password The password used to decrypt and verify the PFX packet. The password must be exactly the same as the password that was used to encrypt the packet.
     * @param {Integer} exportable A value of the [ExportOption](exportoption.md) enumeration that specifies whether the key can be exported.
     * @param {Integer} keyProtectionLevel_ A value of the [KeyProtectionLevel](keyprotectionlevel.md) enumeration that specifies the strength of the key protection. The default is **NoConsent**.
     * @param {Integer} installOption An [InstallOptions](installoptions.md) enumeration value that specifies the certificate installation option.
     * @param {HSTRING} friendlyName The display name of the enrolled certificate. This value overwrites the **FriendlyName** property inside the PFX message.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.usercertificateenrollmentmanager.importpfxdataasync
     */
    ImportPfxDataAsync(pfxData, password, exportable, keyProtectionLevel_, installOption, friendlyName) {
        if (!this.HasProp("__IUserCertificateEnrollmentManager")) {
            if ((queryResult := this.QueryInterface(IUserCertificateEnrollmentManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserCertificateEnrollmentManager := IUserCertificateEnrollmentManager(outPtr)
        }

        return this.__IUserCertificateEnrollmentManager.ImportPfxDataAsync(pfxData, password, exportable, keyProtectionLevel_, installOption, friendlyName)
    }

    /**
     * Asynchronously imports a certificate from a Personal Information Exchange (PFX) message using the specified import parameters.
     * @param {HSTRING} pfxData Base64-encoded PFX message.
     * @param {HSTRING} password he password used to decrypt and verify the PFX packet. The password must be exactly the same as the password that was used to encrypt the packet.
     * @param {Integer} exportable 
     * @param {Integer} keyProtectionLevel_ 
     * @param {Integer} installOption 
     * @param {HSTRING} friendlyName 
     * @param {HSTRING} keyStorageProvider 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.usercertificateenrollmentmanager.importpfxdataasync
     */
    ImportPfxDataToKspAsync(pfxData, password, exportable, keyProtectionLevel_, installOption, friendlyName, keyStorageProvider) {
        if (!this.HasProp("__IUserCertificateEnrollmentManager")) {
            if ((queryResult := this.QueryInterface(IUserCertificateEnrollmentManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserCertificateEnrollmentManager := IUserCertificateEnrollmentManager(outPtr)
        }

        return this.__IUserCertificateEnrollmentManager.ImportPfxDataToKspAsync(pfxData, password, exportable, keyProtectionLevel_, installOption, friendlyName, keyStorageProvider)
    }

    /**
     * Asynchronously imports a certificate from a Personal Information Exchange (PFX) message using the specified import parameters.
     * @param {HSTRING} pfxData Base64-encoded PFX message.
     * @param {HSTRING} password he password used to decrypt and verify the PFX packet. The password must be exactly the same as the password that was used to encrypt the packet.
     * @param {PfxImportParameters} pfxImportParameters_ The import parameters.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.usercertificateenrollmentmanager.importpfxdataasync
     */
    ImportPfxDataToKspWithParametersAsync(pfxData, password, pfxImportParameters_) {
        if (!this.HasProp("__IUserCertificateEnrollmentManager2")) {
            if ((queryResult := this.QueryInterface(IUserCertificateEnrollmentManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserCertificateEnrollmentManager2 := IUserCertificateEnrollmentManager2(outPtr)
        }

        return this.__IUserCertificateEnrollmentManager2.ImportPfxDataToKspWithParametersAsync(pfxData, password, pfxImportParameters_)
    }

;@endregion Instance Methods
}
