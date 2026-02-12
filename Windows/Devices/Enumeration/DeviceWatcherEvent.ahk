#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceWatcherEvent.ahk
#Include ..\..\..\Guid.ahk

/**
 * Triggered when the list of devices is updated after the initial enumeration is complete.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicewatcherevent
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceWatcherEvent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceWatcherEvent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceWatcherEvent.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type for the device indicated by the [DeviceWatcherEvent](devicewatcherevent.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicewatcherevent.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the information for the device associated with the [DeviceWatcherEvent](devicewatcherevent.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicewatcherevent.deviceinformation
     * @type {DeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * Gets updated information for a device updated by the [DeviceWatcherEvent](devicewatcherevent.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicewatcherevent.deviceinformationupdate
     * @type {DeviceInformationUpdate} 
     */
    DeviceInformationUpdate {
        get => this.get_DeviceInformationUpdate()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IDeviceWatcherEvent")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcherEvent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcherEvent := IDeviceWatcherEvent(outPtr)
        }

        return this.__IDeviceWatcherEvent.get_Kind()
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_DeviceInformation() {
        if (!this.HasProp("__IDeviceWatcherEvent")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcherEvent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcherEvent := IDeviceWatcherEvent(outPtr)
        }

        return this.__IDeviceWatcherEvent.get_DeviceInformation()
    }

    /**
     * 
     * @returns {DeviceInformationUpdate} 
     */
    get_DeviceInformationUpdate() {
        if (!this.HasProp("__IDeviceWatcherEvent")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcherEvent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcherEvent := IDeviceWatcherEvent(outPtr)
        }

        return this.__IDeviceWatcherEvent.get_DeviceInformationUpdate()
    }

;@endregion Instance Methods
}
