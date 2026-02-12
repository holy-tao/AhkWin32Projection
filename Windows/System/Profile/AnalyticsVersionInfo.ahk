#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAnalyticsVersionInfo.ahk
#Include .\IAnalyticsVersionInfo2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides version information about the device family.
 * @remarks
 * Use [VersionInfo](analyticsinfo_versioninfo.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.analyticsversioninfo
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class AnalyticsVersionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAnalyticsVersionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAnalyticsVersionInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a string that represents the type of device the application is running on.
     * @remarks
     * The values of this property will change over time as new device families are released. You should not depend on the value of this property, it is intended for analytics use only. For example, you could prioritize marketing activities based on data that more of your customers are using one device-family versus another device-family.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.analyticsversioninfo.devicefamily
     * @type {HSTRING} 
     */
    DeviceFamily {
        get => this.get_DeviceFamily()
    }

    /**
     * Gets the version within the device family.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.analyticsversioninfo.devicefamilyversion
     * @type {HSTRING} 
     */
    DeviceFamilyVersion {
        get => this.get_DeviceFamilyVersion()
    }

    /**
     * Gets the product name of the device that the application is running on.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.analyticsversioninfo.productname
     * @type {HSTRING} 
     */
    ProductName {
        get => this.get_ProductName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceFamily() {
        if (!this.HasProp("__IAnalyticsVersionInfo")) {
            if ((queryResult := this.QueryInterface(IAnalyticsVersionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnalyticsVersionInfo := IAnalyticsVersionInfo(outPtr)
        }

        return this.__IAnalyticsVersionInfo.get_DeviceFamily()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceFamilyVersion() {
        if (!this.HasProp("__IAnalyticsVersionInfo")) {
            if ((queryResult := this.QueryInterface(IAnalyticsVersionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnalyticsVersionInfo := IAnalyticsVersionInfo(outPtr)
        }

        return this.__IAnalyticsVersionInfo.get_DeviceFamilyVersion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProductName() {
        if (!this.HasProp("__IAnalyticsVersionInfo2")) {
            if ((queryResult := this.QueryInterface(IAnalyticsVersionInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnalyticsVersionInfo2 := IAnalyticsVersionInfo2(outPtr)
        }

        return this.__IAnalyticsVersionInfo2.get_ProductName()
    }

;@endregion Instance Methods
}
