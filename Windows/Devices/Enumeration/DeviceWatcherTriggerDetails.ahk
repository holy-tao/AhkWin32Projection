#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceWatcherTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides details about the device updates that invoked the trigger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicewatchertriggerdetails
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceWatcherTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceWatcherTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceWatcherTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the events that activated the trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicewatchertriggerdetails.devicewatcherevents
     * @type {IVectorView<DeviceWatcherEvent>} 
     */
    DeviceWatcherEvents {
        get => this.get_DeviceWatcherEvents()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<DeviceWatcherEvent>} 
     */
    get_DeviceWatcherEvents() {
        if (!this.HasProp("__IDeviceWatcherTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IDeviceWatcherTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceWatcherTriggerDetails := IDeviceWatcherTriggerDetails(outPtr)
        }

        return this.__IDeviceWatcherTriggerDetails.get_DeviceWatcherEvents()
    }

;@endregion Instance Methods
}
