#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyStorageProviderNamesStatics.ahk
#Include .\IKeyStorageProviderNamesStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines several commonly used key storage provider names. You can use this class in the [KeyStorageProviderName](certificaterequestproperties_keystorageprovidername.md) property on the [CertificateRequestProperties](certificaterequestproperties.md) class.
 * @remarks
 * This class contains only static properties. You do not have to create an instance of the class to retrieve the properties. Instead, use the class name followed by the dot operator (.), followed by the property name.
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keystorageprovidernames
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class KeyStorageProviderNames extends IInspectable {
;@region Static Properties
    /**
     * Returns "Microsoft Software Key Storage Provider" as the provider name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keystorageprovidernames.softwarekeystorageprovider
     * @type {HSTRING} 
     */
    static SoftwareKeyStorageProvider {
        get => KeyStorageProviderNames.get_SoftwareKeyStorageProvider()
    }

    /**
     * Returns "Microsoft Smart Card Key Storage Provider" as the provider name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keystorageprovidernames.smartcardkeystorageprovider
     * @type {HSTRING} 
     */
    static SmartcardKeyStorageProvider {
        get => KeyStorageProviderNames.get_SmartcardKeyStorageProvider()
    }

    /**
     * Returns "Microsoft Platform Crypyto Key Storage Provider" as the provider name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keystorageprovidernames.platformkeystorageprovider
     * @type {HSTRING} 
     */
    static PlatformKeyStorageProvider {
        get => KeyStorageProviderNames.get_PlatformKeyStorageProvider()
    }

    /**
     * Returns "Microsoft Passport Key Storage Provider" as the provider name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.keystorageprovidernames.passportkeystorageprovider
     * @type {HSTRING} 
     */
    static PassportKeyStorageProvider {
        get => KeyStorageProviderNames.get_PassportKeyStorageProvider()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SoftwareKeyStorageProvider() {
        if (!KeyStorageProviderNames.HasProp("__IKeyStorageProviderNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyStorageProviderNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyStorageProviderNamesStatics.IID)
            KeyStorageProviderNames.__IKeyStorageProviderNamesStatics := IKeyStorageProviderNamesStatics(factoryPtr)
        }

        return KeyStorageProviderNames.__IKeyStorageProviderNamesStatics.get_SoftwareKeyStorageProvider()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SmartcardKeyStorageProvider() {
        if (!KeyStorageProviderNames.HasProp("__IKeyStorageProviderNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyStorageProviderNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyStorageProviderNamesStatics.IID)
            KeyStorageProviderNames.__IKeyStorageProviderNamesStatics := IKeyStorageProviderNamesStatics(factoryPtr)
        }

        return KeyStorageProviderNames.__IKeyStorageProviderNamesStatics.get_SmartcardKeyStorageProvider()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PlatformKeyStorageProvider() {
        if (!KeyStorageProviderNames.HasProp("__IKeyStorageProviderNamesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyStorageProviderNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyStorageProviderNamesStatics.IID)
            KeyStorageProviderNames.__IKeyStorageProviderNamesStatics := IKeyStorageProviderNamesStatics(factoryPtr)
        }

        return KeyStorageProviderNames.__IKeyStorageProviderNamesStatics.get_PlatformKeyStorageProvider()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PassportKeyStorageProvider() {
        if (!KeyStorageProviderNames.HasProp("__IKeyStorageProviderNamesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.KeyStorageProviderNames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKeyStorageProviderNamesStatics2.IID)
            KeyStorageProviderNames.__IKeyStorageProviderNamesStatics2 := IKeyStorageProviderNamesStatics2(factoryPtr)
        }

        return KeyStorageProviderNames.__IKeyStorageProviderNamesStatics2.get_PassportKeyStorageProvider()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
