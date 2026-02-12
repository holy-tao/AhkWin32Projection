#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEasClientDeviceInformation.ahk
#Include .\IEasClientDeviceInformation2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the app with the ability to retrieve device information from the local device.
  * 
  * For a Windows 8.x sample application showing how mail clients can retrieve device information, see the [EAS policies for mail clients Windows 8.x sample]((https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/EAS%20policies%20for%20mail%20clients%20sample)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation
 * @namespace Windows.Security.ExchangeActiveSyncProvisioning
 * @version WindowsRuntime 1.4
 */
class EasClientDeviceInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEasClientDeviceInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEasClientDeviceInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the identifier of the local device.
     * @remarks
     * > UWP apps only. The Id property represents the DeviceId using the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) truncated from the first 16 bytes of the SHA256 hash of the MachineID, User SID, and Package Family Name where the MachineID uses the SID of the local users group. Each component of the GUID is returned in network byte order.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation.id
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the name of the operating system of the local device.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation.operatingsystem
     * @type {HSTRING} 
     */
    OperatingSystem {
        get => this.get_OperatingSystem()
    }

    /**
     * Gets the friendly name of the local device. This value might come from a NetBIOS computer name.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * Gets the system manufacturer of the local device. Use **SystemManufacturer** only if the value of [SystemSku](easclientdeviceinformation_systemsku.md) is empty.
     * @remarks
     * **SystemManufacturer** is retrieved from the Windows Registry. If the Registry can't be read for any reason, then **SystemManufacturer** is returned as an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation.systemmanufacturer
     * @type {HSTRING} 
     */
    SystemManufacturer {
        get => this.get_SystemManufacturer()
    }

    /**
     * Gets the system product name of the local device. Use **SystemProductName** only if the value of [SystemSku](easclientdeviceinformation_systemsku.md) is empty.
     * @remarks
     * **SystemProductName** is retrieved from the Windows Registry. If the Registry can't be read for any reason, **SystemProductName** returns an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation.systemproductname
     * @type {HSTRING} 
     */
    SystemProductName {
        get => this.get_SystemProductName()
    }

    /**
     * Gets the system SKU of the local device.
     * @remarks
     * The **SystemSku** property is retrieved from the registry. If the registry can't be read for any reason, **SystemSku** is returned as an empty string. If **SystemSku** is not empty, **SystemSku** is recommended to be used as the Model string. Otherwise, you can use [SystemManufacturer](easclientdeviceinformation_systemmanufacturer.md) and [SystemProductName](easclientdeviceinformation_systemproductname.md) to compose **SystemSku**.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation.systemsku
     * @type {HSTRING} 
     */
    SystemSku {
        get => this.get_SystemSku()
    }

    /**
     * Gets the system hardware version of the local device.
     * @remarks
     * The **SystemHardwareVersion** property is retrieved from the Windows Registry. If the Registry can't be read for any reason, **SystemHardwareVersion** returns an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation.systemhardwareversion
     * @type {HSTRING} 
     */
    SystemHardwareVersion {
        get => this.get_SystemHardwareVersion()
    }

    /**
     * Gets the system firmware version of the local device.
     * @remarks
     * The **SystemFirmwareVersion** property is retrieved from the Windows Registry. If the Registry can't be read for any reason, **SystemFirmwareVersion** returns an empty string.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientdeviceinformation.systemfirmwareversion
     * @type {HSTRING} 
     */
    SystemFirmwareVersion {
        get => this.get_SystemFirmwareVersion()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of an object that allows the caller app to retrieve device information from the local device.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.ExchangeActiveSyncProvisioning.EasClientDeviceInformation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        if (!this.HasProp("__IEasClientDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IEasClientDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientDeviceInformation := IEasClientDeviceInformation(outPtr)
        }

        return this.__IEasClientDeviceInformation.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OperatingSystem() {
        if (!this.HasProp("__IEasClientDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IEasClientDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientDeviceInformation := IEasClientDeviceInformation(outPtr)
        }

        return this.__IEasClientDeviceInformation.get_OperatingSystem()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        if (!this.HasProp("__IEasClientDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IEasClientDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientDeviceInformation := IEasClientDeviceInformation(outPtr)
        }

        return this.__IEasClientDeviceInformation.get_FriendlyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemManufacturer() {
        if (!this.HasProp("__IEasClientDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IEasClientDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientDeviceInformation := IEasClientDeviceInformation(outPtr)
        }

        return this.__IEasClientDeviceInformation.get_SystemManufacturer()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemProductName() {
        if (!this.HasProp("__IEasClientDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IEasClientDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientDeviceInformation := IEasClientDeviceInformation(outPtr)
        }

        return this.__IEasClientDeviceInformation.get_SystemProductName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemSku() {
        if (!this.HasProp("__IEasClientDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IEasClientDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientDeviceInformation := IEasClientDeviceInformation(outPtr)
        }

        return this.__IEasClientDeviceInformation.get_SystemSku()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemHardwareVersion() {
        if (!this.HasProp("__IEasClientDeviceInformation2")) {
            if ((queryResult := this.QueryInterface(IEasClientDeviceInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientDeviceInformation2 := IEasClientDeviceInformation2(outPtr)
        }

        return this.__IEasClientDeviceInformation2.get_SystemHardwareVersion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SystemFirmwareVersion() {
        if (!this.HasProp("__IEasClientDeviceInformation2")) {
            if ((queryResult := this.QueryInterface(IEasClientDeviceInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientDeviceInformation2 := IEasClientDeviceInformation2(outPtr)
        }

        return this.__IEasClientDeviceInformation2.get_SystemFirmwareVersion()
    }

;@endregion Instance Methods
}
