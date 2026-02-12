#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStandardCertificateStoreNamesStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides properties for retrieving standard certificate store names.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.standardcertificatestorenames
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class StandardCertificateStoreNames extends IInspectable {
;@region Static Properties
    /**
     * Gets the name of the personal certificate store.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.standardcertificatestorenames.personal
     * @type {HSTRING} 
     */
    static Personal {
        get => StandardCertificateStoreNames.get_Personal()
    }

    /**
     * Gets the name of the trusted root certificate authorities.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.standardcertificatestorenames.trustedrootcertificationauthorities
     * @type {HSTRING} 
     */
    static TrustedRootCertificationAuthorities {
        get => StandardCertificateStoreNames.get_TrustedRootCertificationAuthorities()
    }

    /**
     * Gets the name of the intermediate certificate authorities.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.standardcertificatestorenames.intermediatecertificationauthorities
     * @type {HSTRING} 
     */
    static IntermediateCertificationAuthorities {
        get => StandardCertificateStoreNames.get_IntermediateCertificationAuthorities()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Personal() {
        if (!StandardCertificateStoreNames.HasProp("__IStandardCertificateStoreNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.StandardCertificateStoreNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardCertificateStoreNamesStatics.IID)
            StandardCertificateStoreNames.__IStandardCertificateStoreNamesStatics := IStandardCertificateStoreNamesStatics(factoryPtr)
        }

        return StandardCertificateStoreNames.__IStandardCertificateStoreNamesStatics.get_Personal()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TrustedRootCertificationAuthorities() {
        if (!StandardCertificateStoreNames.HasProp("__IStandardCertificateStoreNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.StandardCertificateStoreNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardCertificateStoreNamesStatics.IID)
            StandardCertificateStoreNames.__IStandardCertificateStoreNamesStatics := IStandardCertificateStoreNamesStatics(factoryPtr)
        }

        return StandardCertificateStoreNames.__IStandardCertificateStoreNamesStatics.get_TrustedRootCertificationAuthorities()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_IntermediateCertificationAuthorities() {
        if (!StandardCertificateStoreNames.HasProp("__IStandardCertificateStoreNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.StandardCertificateStoreNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStandardCertificateStoreNamesStatics.IID)
            StandardCertificateStoreNames.__IStandardCertificateStoreNamesStatics := IStandardCertificateStoreNamesStatics(factoryPtr)
        }

        return StandardCertificateStoreNames.__IStandardCertificateStoreNamesStatics.get_IntermediateCertificationAuthorities()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
