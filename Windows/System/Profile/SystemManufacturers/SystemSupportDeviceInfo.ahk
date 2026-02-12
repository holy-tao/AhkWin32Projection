#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemSupportDeviceInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the app with the ability to retrieve device information from the local device.
  * 
  * **SystemSupportDeviceInfo** mirrors the functionality of [EasClientDeviceInformation](../windows.security.exchangeactivesyncprovisioning/easclientdeviceinformation.md). For a Windows 8.x sample application showing how mail clients can retrieve device information using **EasClientDeviceInformation**, see the [EAS policies for mail clients Windows 8.x sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/EAS%20policies%20for%20mail%20clients%20sample).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.systemsupportdeviceinfo
 * @namespace Windows.System.Profile.SystemManufacturers
 * @version WindowsRuntime 1.4
 */
class SystemSupportDeviceInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemSupportDeviceInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemSupportDeviceInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the operating system of the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.systemsupportdeviceinfo.operatingsystem
     * @type {HSTRING} 
     */
    OperatingSystem {
        get => this.get_OperatingSystem()
    }

    /**
     * Gets the friendly name of the local device. This value might come from a NetBIOS computer name.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.systemsupportdeviceinfo.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * Gets the system manufacturer of the local device. Use **SystemManufacturer** only if the value of [SystemSku](systemsupportdeviceinfo_systemsku.md) is empty.
     * @remarks
     * **SystemManufacturer** is retrieved from the Windows Registry. If the Registry can't be read for any reason, then **SystemManufacturer** returns an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.systemsupportdeviceinfo.systemmanufacturer
     * @type {HSTRING} 
     */
    SystemManufacturer {
        get => this.get_SystemManufacturer()
    }

    /**
     * Gets the system product name of the local device. Use **SystemProductName** only if the value of [SystemSku](systemsupportdeviceinfo_systemsku.md) is empty.
     * @remarks
     * **SystemProductName** is retrieved from the Window Registry. If the Registry can't be read for any reason, **SystemProductName** returns an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.systemsupportdeviceinfo.systemproductname
     * @type {HSTRING} 
     */
    SystemProductName {
        get => this.get_SystemProductName()
    }

    /**
     * Gets the system SKU of the local device.
     * @remarks
     * The **SystemSku** property is retrieved from the registry. If the registry can't be read for any reason, **SystemSku** is returned as an empty string. If **SystemSku** is not empty, **SystemSku** is recommended to be used as the Model string. Otherwise, you can use [SystemManufacturer](systemsupportdeviceinfo_systemmanufacturer.md) and [SystemProductName](systemsupportdeviceinfo_systemproductname.md) to compose **SystemSku**.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.systemsupportdeviceinfo.systemsku
     * @type {HSTRING} 
     */
    SystemSku {
        get => this.get_SystemSku()
    }

    /**
     * Gets the system hardware version of the local device.
     * @remarks
     * The **SystemHardwareVersion** property is retrieved from the Windows Registry. If the Registry can't be read for any reason, **SystemHardwareVersion** returns an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.systemsupportdeviceinfo.systemhardwareversion
     * @type {HSTRING} 
     */
    SystemHardwareVersion {
        get => this.get_SystemHardwareVersion()
    }

    /**
     * Gets the system firmware version of the local device.
     * @remarks
     * The **SystemFirmwareVersion** property is retrieved from the Windows Registry. If the Registry can't be read for any reason, **SystemFirmwareVersion** returns an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemmanufacturers.systemsupportdeviceinfo.systemfirmwareversion
     * @type {HSTRING} 
     */
    SystemFirmwareVersion {
        get => this.get_SystemFirmwareVersion()
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
    get_OperatingSystem() {
        if (!this.HasProp("__ISystemSupportDeviceInfo")) {
            if ((queryResult := this.QueryInterface(ISystemSupportDeviceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemSupportDeviceInfo := ISystemSupportDeviceInfo(outPtr)
        }

        return this.__ISystemSupportDeviceInfo.get_OperatingSystem()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        if (!this.HasProp("__ISystemSupportDeviceInfo")) {
            if ((queryResult := this.QueryInterface(ISystemSupportDeviceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemSupportDeviceInfo := ISystemSupportDeviceInfo(outPtr)
        }

        return this.__ISystemSupportDeviceInfo.get_FriendlyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemManufacturer() {
        if (!this.HasProp("__ISystemSupportDeviceInfo")) {
            if ((queryResult := this.QueryInterface(ISystemSupportDeviceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemSupportDeviceInfo := ISystemSupportDeviceInfo(outPtr)
        }

        return this.__ISystemSupportDeviceInfo.get_SystemManufacturer()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemProductName() {
        if (!this.HasProp("__ISystemSupportDeviceInfo")) {
            if ((queryResult := this.QueryInterface(ISystemSupportDeviceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemSupportDeviceInfo := ISystemSupportDeviceInfo(outPtr)
        }

        return this.__ISystemSupportDeviceInfo.get_SystemProductName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemSku() {
        if (!this.HasProp("__ISystemSupportDeviceInfo")) {
            if ((queryResult := this.QueryInterface(ISystemSupportDeviceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemSupportDeviceInfo := ISystemSupportDeviceInfo(outPtr)
        }

        return this.__ISystemSupportDeviceInfo.get_SystemSku()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemHardwareVersion() {
        if (!this.HasProp("__ISystemSupportDeviceInfo")) {
            if ((queryResult := this.QueryInterface(ISystemSupportDeviceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemSupportDeviceInfo := ISystemSupportDeviceInfo(outPtr)
        }

        return this.__ISystemSupportDeviceInfo.get_SystemHardwareVersion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemFirmwareVersion() {
        if (!this.HasProp("__ISystemSupportDeviceInfo")) {
            if ((queryResult := this.QueryInterface(ISystemSupportDeviceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemSupportDeviceInfo := ISystemSupportDeviceInfo(outPtr)
        }

        return this.__ISystemSupportDeviceInfo.get_SystemFirmwareVersion()
    }

;@endregion Instance Methods
}
