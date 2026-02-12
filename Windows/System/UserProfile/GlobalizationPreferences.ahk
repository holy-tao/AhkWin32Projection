#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGlobalizationPreferencesStatics2.ahk
#Include .\IGlobalizationPreferencesStatics3.ahk
#Include .\IGlobalizationPreferencesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * A static class for holding various user globalization preferences.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferences
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class GlobalizationPreferences extends IInspectable {
;@region Static Properties
    /**
     * Gets the set of calendars that are preferred by the user, in order of preference.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferences.calendars
     * @type {IVectorView<HSTRING>} 
     */
    static Calendars {
        get => GlobalizationPreferences.get_Calendars()
    }

    /**
     * Gets the set of clocks that are preferred by the user, in order of preference.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferences.clocks
     * @type {IVectorView<HSTRING>} 
     */
    static Clocks {
        get => GlobalizationPreferences.get_Clocks()
    }

    /**
     * Gets the set of currencies that are preferred by the user, in order of preference.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferences.currencies
     * @type {IVectorView<HSTRING>} 
     */
    static Currencies {
        get => GlobalizationPreferences.get_Currencies()
    }

    /**
     * Gets the set of languages that are preferred by the user, in order of preference.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferences.languages
     * @type {IVectorView<HSTRING>} 
     */
    static Languages {
        get => GlobalizationPreferences.get_Languages()
    }

    /**
     * Gets the user's home geographic region.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferences.homegeographicregion
     * @type {HSTRING} 
     */
    static HomeGeographicRegion {
        get => GlobalizationPreferences.get_HomeGeographicRegion()
    }

    /**
     * Gets the day of the week that is considered to be the first day of the week.
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferences.weekstartson
     * @type {Integer} 
     */
    static WeekStartsOn {
        get => GlobalizationPreferences.get_WeekStartsOn()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Attempts to set the user's home geographic region on an [IoT](https://developer.microsoft.com/en-us/windows/iot) device.
     * 
     * > [!NOTE]
     * > This method is available only in [Embedded mode](/windows/iot-core/develop-your-app/EmbeddedMode).
     * @remarks
     * Your app must declare the **systemManagement** capability, which lets apps access basic system administration privileges including locale, timezone, shut down, and reboot.
     * 
     * The systemManagement capability must include the iot namespace when you declare it in your app's package manifest.
     * 
     * ```xml
     * <Capabilities><iot:Capability Name="systemManagement"/></Capabilities>
     * ```
     * @param {HSTRING} region_ The GeographicRegion identifier that represents the user's home location.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferences.trysethomegeographicregion
     */
    static TrySetHomeGeographicRegion(region_) {
        if (!GlobalizationPreferences.HasProp("__IGlobalizationPreferencesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.GlobalizationPreferences")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlobalizationPreferencesStatics2.IID)
            GlobalizationPreferences.__IGlobalizationPreferencesStatics2 := IGlobalizationPreferencesStatics2(factoryPtr)
        }

        return GlobalizationPreferences.__IGlobalizationPreferencesStatics2.TrySetHomeGeographicRegion(region_)
    }

    /**
     * Attempts to set the preferred languages on an [IoT](https://developer.microsoft.com/en-us/windows/iot) device.
     * 
     * > [!NOTE]
     * > This method is available only in [Embedded mode](/windows/iot-core/develop-your-app/EmbeddedMode).
     * @remarks
     * Your app must declare the **systemManagement** capability, which lets apps access basic system administration privileges including locale, timezone, shut down, and reboot.
     * 
     * The systemManagement capability must include the iot namespace when you declare it in your app's package manifest.
     * 
     * ```xml
     * <Capabilities><iot:Capability Name="systemManagement"/></Capabilities>
     * ```
     * @param {IIterable<HSTRING>} languageTags One or more language identifiers for the user's preferred languages.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferences.trysetlanguages
     */
    static TrySetLanguages(languageTags) {
        if (!GlobalizationPreferences.HasProp("__IGlobalizationPreferencesStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.GlobalizationPreferences")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlobalizationPreferencesStatics2.IID)
            GlobalizationPreferences.__IGlobalizationPreferencesStatics2 := IGlobalizationPreferencesStatics2(factoryPtr)
        }

        return GlobalizationPreferences.__IGlobalizationPreferencesStatics2.TrySetLanguages(languageTags)
    }

    /**
     * Retrieves an object representing the globalization preferences of the specified user. This API is part of support for multi-user apps (MUA).
     * @param {User} user_ The user to retrieve preferences for.
     * @returns {GlobalizationPreferencesForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.globalizationpreferences.getforuser
     */
    static GetForUser(user_) {
        if (!GlobalizationPreferences.HasProp("__IGlobalizationPreferencesStatics3")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.GlobalizationPreferences")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlobalizationPreferencesStatics3.IID)
            GlobalizationPreferences.__IGlobalizationPreferencesStatics3 := IGlobalizationPreferencesStatics3(factoryPtr)
        }

        return GlobalizationPreferences.__IGlobalizationPreferencesStatics3.GetForUser(user_)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    static get_Calendars() {
        if (!GlobalizationPreferences.HasProp("__IGlobalizationPreferencesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.GlobalizationPreferences")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlobalizationPreferencesStatics.IID)
            GlobalizationPreferences.__IGlobalizationPreferencesStatics := IGlobalizationPreferencesStatics(factoryPtr)
        }

        return GlobalizationPreferences.__IGlobalizationPreferencesStatics.get_Calendars()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    static get_Clocks() {
        if (!GlobalizationPreferences.HasProp("__IGlobalizationPreferencesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.GlobalizationPreferences")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlobalizationPreferencesStatics.IID)
            GlobalizationPreferences.__IGlobalizationPreferencesStatics := IGlobalizationPreferencesStatics(factoryPtr)
        }

        return GlobalizationPreferences.__IGlobalizationPreferencesStatics.get_Clocks()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    static get_Currencies() {
        if (!GlobalizationPreferences.HasProp("__IGlobalizationPreferencesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.GlobalizationPreferences")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlobalizationPreferencesStatics.IID)
            GlobalizationPreferences.__IGlobalizationPreferencesStatics := IGlobalizationPreferencesStatics(factoryPtr)
        }

        return GlobalizationPreferences.__IGlobalizationPreferencesStatics.get_Currencies()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    static get_Languages() {
        if (!GlobalizationPreferences.HasProp("__IGlobalizationPreferencesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.GlobalizationPreferences")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlobalizationPreferencesStatics.IID)
            GlobalizationPreferences.__IGlobalizationPreferencesStatics := IGlobalizationPreferencesStatics(factoryPtr)
        }

        return GlobalizationPreferences.__IGlobalizationPreferencesStatics.get_Languages()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HomeGeographicRegion() {
        if (!GlobalizationPreferences.HasProp("__IGlobalizationPreferencesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.GlobalizationPreferences")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlobalizationPreferencesStatics.IID)
            GlobalizationPreferences.__IGlobalizationPreferencesStatics := IGlobalizationPreferencesStatics(factoryPtr)
        }

        return GlobalizationPreferences.__IGlobalizationPreferencesStatics.get_HomeGeographicRegion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_WeekStartsOn() {
        if (!GlobalizationPreferences.HasProp("__IGlobalizationPreferencesStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.GlobalizationPreferences")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGlobalizationPreferencesStatics.IID)
            GlobalizationPreferences.__IGlobalizationPreferencesStatics := IGlobalizationPreferencesStatics(factoryPtr)
        }

        return GlobalizationPreferences.__IGlobalizationPreferencesStatics.get_WeekStartsOn()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
