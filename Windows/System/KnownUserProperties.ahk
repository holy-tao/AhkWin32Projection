#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownUserPropertiesStatics2.ahk
#Include .\IKnownUserPropertiesStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Contains basic information about a user.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.knownuserproperties
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class KnownUserProperties extends IInspectable {
;@region Static Properties
    /**
     * Gets a string representing the user's age enforcement region.
     * @remarks
     * This property allows apps to include regional requirements when making age-appropriate content considerations.
     * @see https://learn.microsoft.com/uwp/api/windows.system.knownuserproperties.ageenforcementregion
     * @type {HSTRING} 
     */
    static AgeEnforcementRegion {
        get => KnownUserProperties.get_AgeEnforcementRegion()
    }

    /**
     * Gets the user's display name.
     * @see https://learn.microsoft.com/uwp/api/windows.system.knownuserproperties.displayname
     * @type {HSTRING} 
     */
    static DisplayName {
        get => KnownUserProperties.get_DisplayName()
    }

    /**
     * Gets the user's first name.
     * @see https://learn.microsoft.com/uwp/api/windows.system.knownuserproperties.firstname
     * @type {HSTRING} 
     */
    static FirstName {
        get => KnownUserProperties.get_FirstName()
    }

    /**
     * Gets the user's last name.
     * @see https://learn.microsoft.com/uwp/api/windows.system.knownuserproperties.lastname
     * @type {HSTRING} 
     */
    static LastName {
        get => KnownUserProperties.get_LastName()
    }

    /**
     * Gets the user's provider name.
     * @see https://learn.microsoft.com/uwp/api/windows.system.knownuserproperties.providername
     * @type {HSTRING} 
     */
    static ProviderName {
        get => KnownUserProperties.get_ProviderName()
    }

    /**
     * Gets the user's account name.
     * @see https://learn.microsoft.com/uwp/api/windows.system.knownuserproperties.accountname
     * @type {HSTRING} 
     */
    static AccountName {
        get => KnownUserProperties.get_AccountName()
    }

    /**
     * Gets the user's guest host.
     * @see https://learn.microsoft.com/uwp/api/windows.system.knownuserproperties.guesthost
     * @type {HSTRING} 
     */
    static GuestHost {
        get => KnownUserProperties.get_GuestHost()
    }

    /**
     * Gets the user's principal name.
     * @see https://learn.microsoft.com/uwp/api/windows.system.knownuserproperties.principalname
     * @type {HSTRING} 
     */
    static PrincipalName {
        get => KnownUserProperties.get_PrincipalName()
    }

    /**
     * Gets the user's domain name.
     * @see https://learn.microsoft.com/uwp/api/windows.system.knownuserproperties.domainname
     * @type {HSTRING} 
     */
    static DomainName {
        get => KnownUserProperties.get_DomainName()
    }

    /**
     * Gets the user's session initiation protocol Uri.
     * @see https://learn.microsoft.com/uwp/api/windows.system.knownuserproperties.sessioninitiationprotocoluri
     * @type {HSTRING} 
     */
    static SessionInitiationProtocolUri {
        get => KnownUserProperties.get_SessionInitiationProtocolUri()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AgeEnforcementRegion() {
        if (!KnownUserProperties.HasProp("__IKnownUserPropertiesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.KnownUserProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUserPropertiesStatics2.IID)
            KnownUserProperties.__IKnownUserPropertiesStatics2 := IKnownUserPropertiesStatics2(factoryPtr)
        }

        return KnownUserProperties.__IKnownUserPropertiesStatics2.get_AgeEnforcementRegion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DisplayName() {
        if (!KnownUserProperties.HasProp("__IKnownUserPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.KnownUserProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUserPropertiesStatics.IID)
            KnownUserProperties.__IKnownUserPropertiesStatics := IKnownUserPropertiesStatics(factoryPtr)
        }

        return KnownUserProperties.__IKnownUserPropertiesStatics.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FirstName() {
        if (!KnownUserProperties.HasProp("__IKnownUserPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.KnownUserProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUserPropertiesStatics.IID)
            KnownUserProperties.__IKnownUserPropertiesStatics := IKnownUserPropertiesStatics(factoryPtr)
        }

        return KnownUserProperties.__IKnownUserPropertiesStatics.get_FirstName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_LastName() {
        if (!KnownUserProperties.HasProp("__IKnownUserPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.KnownUserProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUserPropertiesStatics.IID)
            KnownUserProperties.__IKnownUserPropertiesStatics := IKnownUserPropertiesStatics(factoryPtr)
        }

        return KnownUserProperties.__IKnownUserPropertiesStatics.get_LastName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ProviderName() {
        if (!KnownUserProperties.HasProp("__IKnownUserPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.KnownUserProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUserPropertiesStatics.IID)
            KnownUserProperties.__IKnownUserPropertiesStatics := IKnownUserPropertiesStatics(factoryPtr)
        }

        return KnownUserProperties.__IKnownUserPropertiesStatics.get_ProviderName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AccountName() {
        if (!KnownUserProperties.HasProp("__IKnownUserPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.KnownUserProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUserPropertiesStatics.IID)
            KnownUserProperties.__IKnownUserPropertiesStatics := IKnownUserPropertiesStatics(factoryPtr)
        }

        return KnownUserProperties.__IKnownUserPropertiesStatics.get_AccountName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_GuestHost() {
        if (!KnownUserProperties.HasProp("__IKnownUserPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.KnownUserProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUserPropertiesStatics.IID)
            KnownUserProperties.__IKnownUserPropertiesStatics := IKnownUserPropertiesStatics(factoryPtr)
        }

        return KnownUserProperties.__IKnownUserPropertiesStatics.get_GuestHost()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PrincipalName() {
        if (!KnownUserProperties.HasProp("__IKnownUserPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.KnownUserProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUserPropertiesStatics.IID)
            KnownUserProperties.__IKnownUserPropertiesStatics := IKnownUserPropertiesStatics(factoryPtr)
        }

        return KnownUserProperties.__IKnownUserPropertiesStatics.get_PrincipalName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DomainName() {
        if (!KnownUserProperties.HasProp("__IKnownUserPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.KnownUserProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUserPropertiesStatics.IID)
            KnownUserProperties.__IKnownUserPropertiesStatics := IKnownUserPropertiesStatics(factoryPtr)
        }

        return KnownUserProperties.__IKnownUserPropertiesStatics.get_DomainName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SessionInitiationProtocolUri() {
        if (!KnownUserProperties.HasProp("__IKnownUserPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.KnownUserProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownUserPropertiesStatics.IID)
            KnownUserProperties.__IKnownUserPropertiesStatics := IKnownUserPropertiesStatics(factoryPtr)
        }

        return KnownUserProperties.__IKnownUserPropertiesStatics.get_SessionInitiationProtocolUri()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
