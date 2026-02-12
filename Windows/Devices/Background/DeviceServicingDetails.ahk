#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceServicingDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to provide the [DeviceInformation.ID](../windows.devices.enumeration/deviceinformation_id.md), expected duration, and arguments given by the app that triggered the background servicing task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.background.deviceservicingdetails
 * @namespace Windows.Devices.Background
 * @version WindowsRuntime 1.4
 */
class DeviceServicingDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceServicingDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceServicingDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [DeviceInformation.ID](../windows.devices.enumeration/deviceinformation_id.md) of the device the task is targeting. The background task can provide this to the `FromIdAsync` method of the appropriate device access class to open the device. For example, call [UsbDevice.FromIdAsync](../windows.devices.usb/usbdevice_fromidasync_1322863552.md) in the [Windows.Devices.Usb](../windows.devices.usb/windows_devices_usb.md) namespace to open a USB device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.background.deviceservicingdetails.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the arguments string provided by the app when it called [RequestAsync](../windows.applicationmodel.background/deviceservicingtrigger_requestasync_2058358296.md) on the [DeviceServicingTrigger](../windows.applicationmodel.background/deviceservicingtrigger.md). This allows the app to easily pass parameters to the task when it invokes it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.background.deviceservicingdetails.arguments
     * @type {HSTRING} 
     */
    Arguments {
        get => this.get_Arguments()
    }

    /**
     * Gets the estimated duration provided by the app when it called [RequestAsync](../windows.applicationmodel.background/deviceservicingtrigger_requestasync_2058358296.md) on the [DeviceServicingTrigger](../windows.applicationmodel.background/deviceservicingtrigger.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.background.deviceservicingdetails.expectedduration
     * @type {TimeSpan} 
     */
    ExpectedDuration {
        get => this.get_ExpectedDuration()
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
    get_DeviceId() {
        if (!this.HasProp("__IDeviceServicingDetails")) {
            if ((queryResult := this.QueryInterface(IDeviceServicingDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceServicingDetails := IDeviceServicingDetails(outPtr)
        }

        return this.__IDeviceServicingDetails.get_DeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Arguments() {
        if (!this.HasProp("__IDeviceServicingDetails")) {
            if ((queryResult := this.QueryInterface(IDeviceServicingDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceServicingDetails := IDeviceServicingDetails(outPtr)
        }

        return this.__IDeviceServicingDetails.get_Arguments()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ExpectedDuration() {
        if (!this.HasProp("__IDeviceServicingDetails")) {
            if ((queryResult := this.QueryInterface(IDeviceServicingDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceServicingDetails := IDeviceServicingDetails(outPtr)
        }

        return this.__IDeviceServicingDetails.get_ExpectedDuration()
    }

;@endregion Instance Methods
}
