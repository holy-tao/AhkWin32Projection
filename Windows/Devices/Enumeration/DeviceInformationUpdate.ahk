#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceInformationUpdate.ahk
#Include .\IDeviceInformationUpdate2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains updated properties for a [DeviceInformation](deviceinformation.md) object.
 * @remarks
 * The [Updated](devicewatcher_updated.md) and [Removed](devicewatcher_removed.md) events of the [DeviceWatcher](devicewatcher.md) class receive a **DeviceInformationUpdate** object.
 * 
 * For more information about **DeviceInformationUpdate**, see [Enumerate and watch devices](/windows/uwp/devices-sensors/enumerate-devices#enumerate-and-watch-devices).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationupdate
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceInformationUpdate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceInformationUpdate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceInformationUpdate.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The [DeviceInformation](deviceinformation.md) ID of the updated device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationupdate.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * The changed properties in a update to a [DeviceInformation](deviceinformation.md) object.
     * @remarks
     * For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationupdate.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the type of device for the updated device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformationupdate.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
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
    get_Id() {
        if (!this.HasProp("__IDeviceInformationUpdate")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationUpdate := IDeviceInformationUpdate(outPtr)
        }

        return this.__IDeviceInformationUpdate.get_Id()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IDeviceInformationUpdate")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationUpdate := IDeviceInformationUpdate(outPtr)
        }

        return this.__IDeviceInformationUpdate.get_Properties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IDeviceInformationUpdate2")) {
            if ((queryResult := this.QueryInterface(IDeviceInformationUpdate2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformationUpdate2 := IDeviceInformationUpdate2(outPtr)
        }

        return this.__IDeviceInformationUpdate2.get_Kind()
    }

;@endregion Instance Methods
}
