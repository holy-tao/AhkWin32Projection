#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimeZoneSettingsStatics.ahk
#Include .\ITimeZoneSettingsStatics2.ahk
#Include ..\..\Guid.ahk

/**
 * Contains methods and properties for interacting with time zones.
 * @remarks
 * This API requires the use of the IoT **systemManagement** capability. Users can add the following to their **Package.appmanifest**:`
 * <iot:Capability Name="systemManagement"/>`
 * @see https://learn.microsoft.com/uwp/api/windows.system.timezonesettings
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class TimeZoneSettings extends IInspectable {
;@region Static Properties
    /**
     * Gets the display name of the current time zone.
     * @remarks
     * This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list. Users can add the following to their **Package.appmanifest**:`
     * <iot:Capability Name="systemManagement"/>`, and add **iot** to their existing list of **IgnorableNamespaces**.
     * @see https://learn.microsoft.com/uwp/api/windows.system.timezonesettings.currenttimezonedisplayname
     * @type {HSTRING} 
     */
    static CurrentTimeZoneDisplayName {
        get => TimeZoneSettings.get_CurrentTimeZoneDisplayName()
    }

    /**
     * Gets the display names for all supported time zones.
     * @remarks
     * This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list. Users can add the following to their **Package.appmanifest**:`
     * <iot:Capability Name="systemManagement"/>`, and add **iot** to their existing list of **IgnorableNamespaces**.
     * @see https://learn.microsoft.com/uwp/api/windows.system.timezonesettings.supportedtimezonedisplaynames
     * @type {IVectorView<HSTRING>} 
     */
    static SupportedTimeZoneDisplayNames {
        get => TimeZoneSettings.get_SupportedTimeZoneDisplayNames()
    }

    /**
     * Gets whether the time zone can be changed.
     * @remarks
     * This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list. Users can add the following to their **Package.appmanifest**:`
     * <iot:Capability Name="systemManagement"/>`, and add **iot** to their existing list of **IgnorableNamespaces**.
     * @see https://learn.microsoft.com/uwp/api/windows.system.timezonesettings.canchangetimezone
     * @type {Boolean} 
     */
    static CanChangeTimeZone {
        get => TimeZoneSettings.get_CanChangeTimeZone()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CurrentTimeZoneDisplayName() {
        if (!TimeZoneSettings.HasProp("__ITimeZoneSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.TimeZoneSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimeZoneSettingsStatics.IID)
            TimeZoneSettings.__ITimeZoneSettingsStatics := ITimeZoneSettingsStatics(factoryPtr)
        }

        return TimeZoneSettings.__ITimeZoneSettingsStatics.get_CurrentTimeZoneDisplayName()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    static get_SupportedTimeZoneDisplayNames() {
        if (!TimeZoneSettings.HasProp("__ITimeZoneSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.TimeZoneSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimeZoneSettingsStatics.IID)
            TimeZoneSettings.__ITimeZoneSettingsStatics := ITimeZoneSettingsStatics(factoryPtr)
        }

        return TimeZoneSettings.__ITimeZoneSettingsStatics.get_SupportedTimeZoneDisplayNames()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_CanChangeTimeZone() {
        if (!TimeZoneSettings.HasProp("__ITimeZoneSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.TimeZoneSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimeZoneSettingsStatics.IID)
            TimeZoneSettings.__ITimeZoneSettingsStatics := ITimeZoneSettingsStatics(factoryPtr)
        }

        return TimeZoneSettings.__ITimeZoneSettingsStatics.get_CanChangeTimeZone()
    }

    /**
     * Changes the time zone using the display name.
     * @remarks
     * This API requires the use of the IoT **systemManagement** capability, and the inclusion of **iot** in the **IgnorableNamespaces** list. Users can add the following to their **Package.appmanifest**:`
     * <iot:Capability Name="systemManagement"/>`, and add **iot** to their existing list of **IgnorableNamespaces**.
     * @param {HSTRING} timeZoneDisplayName The display name of the time zone to change to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.timezonesettings.changetimezonebydisplayname
     */
    static ChangeTimeZoneByDisplayName(timeZoneDisplayName) {
        if (!TimeZoneSettings.HasProp("__ITimeZoneSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.TimeZoneSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimeZoneSettingsStatics.IID)
            TimeZoneSettings.__ITimeZoneSettingsStatics := ITimeZoneSettingsStatics(factoryPtr)
        }

        return TimeZoneSettings.__ITimeZoneSettingsStatics.ChangeTimeZoneByDisplayName(timeZoneDisplayName)
    }

    /**
     * Attempts to automatically determine and set the time zone for embedded mode devices.
     * @remarks
     * You can run this method at start up to set the time zone without prompting users for information.
     * 
     * This method does not necessarily change the time zone or find the correct time zone. 
     * For the results of the attempt, see the [AutoUpdateTimeZoneStatus](autoupdatetimezonestatus.md) enumeration.
     * 
     * Separately, you can include a way for the user to set the time zone at a later time.
     * 
     * This method can use information from any of the following sources to determine the time zone:
     * 
     * - GPS
     * - Cellular
     * - Wi-Fi
     * - IP Address
     * 
     * If your device does not have access to any method of determining location, you should not run this method.
     * @param {TimeSpan} timeout If the time-out period is exceeded, this method returns a value of **TimedOut** for the [AutoUpdateTimeZoneStatus](autoupdatetimezonestatus.md).
     * 
     * The recommended time-out value is 60 seconds.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.timezonesettings.autoupdatetimezoneasync
     */
    static AutoUpdateTimeZoneAsync(timeout) {
        if (!TimeZoneSettings.HasProp("__ITimeZoneSettingsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.TimeZoneSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITimeZoneSettingsStatics2.IID)
            TimeZoneSettings.__ITimeZoneSettingsStatics2 := ITimeZoneSettingsStatics2(factoryPtr)
        }

        return TimeZoneSettings.__ITimeZoneSettingsStatics2.AutoUpdateTimeZoneAsync(timeout)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
