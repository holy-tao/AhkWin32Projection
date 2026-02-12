#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAnalyticsInfoStatics.ahk
#Include .\IAnalyticsInfoStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the device for profiling purposes.
 * @remarks
 * This is a static class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.analyticsinfo
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class AnalyticsInfo extends IInspectable {
;@region Static Properties
    /**
     * Gets version info about the device family.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.analyticsinfo.versioninfo
     * @type {AnalyticsVersionInfo} 
     */
    static VersionInfo {
        get => AnalyticsInfo.get_VersionInfo()
    }

    /**
     * Gets the device form factor running Windows 10. For example, the app could be running on a phone, tablet, desktop, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.analyticsinfo.deviceform
     * @type {HSTRING} 
     */
    static DeviceForm {
        get => AnalyticsInfo.get_DeviceForm()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {AnalyticsVersionInfo} 
     */
    static get_VersionInfo() {
        if (!AnalyticsInfo.HasProp("__IAnalyticsInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.AnalyticsInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAnalyticsInfoStatics.IID)
            AnalyticsInfo.__IAnalyticsInfoStatics := IAnalyticsInfoStatics(factoryPtr)
        }

        return AnalyticsInfo.__IAnalyticsInfoStatics.get_VersionInfo()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DeviceForm() {
        if (!AnalyticsInfo.HasProp("__IAnalyticsInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.AnalyticsInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAnalyticsInfoStatics.IID)
            AnalyticsInfo.__IAnalyticsInfoStatics := IAnalyticsInfoStatics(factoryPtr)
        }

        return AnalyticsInfo.__IAnalyticsInfoStatics.get_DeviceForm()
    }

    /**
     * Asynchronously retrieves the requested system attributes.
     * @remarks
     * Supported values for the *attributeNames* parameter are potentially endless. There are many providers that hook in and can expose arbitrary values. There a handful of known attributes that are likely to be supported. In most cases, these are case sensitive:  
     * 
     * * App  
     * * AppVer  
     * * DeviceFamily  
     * * FlightRing  
     * * OSVersionFull
     * * n:TriggeredFlightIds
     * 
     * The intention of this method is to use this information only for analytics and not rely on a particular value on the client. Support for these values will change over time.
     * @param {IIterable<HSTRING>} attributeNames An [IIterable](../windows.foundation.collections/iiterable_1.md) list of strings containing the system attributes to retrieve.
     * @returns {IAsyncOperation<IMapView<HSTRING, HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.analyticsinfo.getsystempropertiesasync
     */
    static GetSystemPropertiesAsync(attributeNames) {
        if (!AnalyticsInfo.HasProp("__IAnalyticsInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.AnalyticsInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAnalyticsInfoStatics2.IID)
            AnalyticsInfo.__IAnalyticsInfoStatics2 := IAnalyticsInfoStatics2(factoryPtr)
        }

        return AnalyticsInfo.__IAnalyticsInfoStatics2.GetSystemPropertiesAsync(attributeNames)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
