#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlatformDiagnosticsAndUsageDataSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to settings for collecting diagnostic data and an event to subscribe to changes to the platform diagnostics and usage data collection level settings.
 * @remarks
 * This is a static class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.platformdiagnosticsandusagedatasettings
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class PlatformDiagnosticsAndUsageDataSettings extends IInspectable {
;@region Static Properties
    /**
     * Gets the current data collection level.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.platformdiagnosticsandusagedatasettings.collectionlevel
     * @type {Integer} 
     */
    static CollectionLevel {
        get => PlatformDiagnosticsAndUsageDataSettings.get_CollectionLevel()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_CollectionLevel() {
        if (!PlatformDiagnosticsAndUsageDataSettings.HasProp("__IPlatformDiagnosticsAndUsageDataSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.PlatformDiagnosticsAndUsageDataSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformDiagnosticsAndUsageDataSettingsStatics.IID)
            PlatformDiagnosticsAndUsageDataSettings.__IPlatformDiagnosticsAndUsageDataSettingsStatics := IPlatformDiagnosticsAndUsageDataSettingsStatics(factoryPtr)
        }

        return PlatformDiagnosticsAndUsageDataSettings.__IPlatformDiagnosticsAndUsageDataSettingsStatics.get_CollectionLevel()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_CollectionLevelChanged(handler) {
        if (!PlatformDiagnosticsAndUsageDataSettings.HasProp("__IPlatformDiagnosticsAndUsageDataSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.PlatformDiagnosticsAndUsageDataSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformDiagnosticsAndUsageDataSettingsStatics.IID)
            PlatformDiagnosticsAndUsageDataSettings.__IPlatformDiagnosticsAndUsageDataSettingsStatics := IPlatformDiagnosticsAndUsageDataSettingsStatics(factoryPtr)
        }

        return PlatformDiagnosticsAndUsageDataSettings.__IPlatformDiagnosticsAndUsageDataSettingsStatics.add_CollectionLevelChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_CollectionLevelChanged(token) {
        if (!PlatformDiagnosticsAndUsageDataSettings.HasProp("__IPlatformDiagnosticsAndUsageDataSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.PlatformDiagnosticsAndUsageDataSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformDiagnosticsAndUsageDataSettingsStatics.IID)
            PlatformDiagnosticsAndUsageDataSettings.__IPlatformDiagnosticsAndUsageDataSettingsStatics := IPlatformDiagnosticsAndUsageDataSettingsStatics(factoryPtr)
        }

        return PlatformDiagnosticsAndUsageDataSettings.__IPlatformDiagnosticsAndUsageDataSettingsStatics.remove_CollectionLevelChanged(token)
    }

    /**
     * Returns a Boolean value indicating if the requested data collection level can be enabled.
     * @param {Integer} level The desired data collection level.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.platformdiagnosticsandusagedatasettings.cancollectdiagnostics
     */
    static CanCollectDiagnostics(level) {
        if (!PlatformDiagnosticsAndUsageDataSettings.HasProp("__IPlatformDiagnosticsAndUsageDataSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.PlatformDiagnosticsAndUsageDataSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformDiagnosticsAndUsageDataSettingsStatics.IID)
            PlatformDiagnosticsAndUsageDataSettings.__IPlatformDiagnosticsAndUsageDataSettingsStatics := IPlatformDiagnosticsAndUsageDataSettingsStatics(factoryPtr)
        }

        return PlatformDiagnosticsAndUsageDataSettings.__IPlatformDiagnosticsAndUsageDataSettingsStatics.CanCollectDiagnostics(level)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
