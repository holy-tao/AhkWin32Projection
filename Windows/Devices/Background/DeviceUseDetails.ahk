#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceUseDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to provide the [DeviceInformation.ID](../windows.devices.enumeration/deviceinformation_id.md) and arguments given by the app that triggered the background sync task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.background.deviceusedetails
 * @namespace Windows.Devices.Background
 * @version WindowsRuntime 1.4
 */
class DeviceUseDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceUseDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceUseDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [DeviceInformation.ID](../windows.devices.enumeration/deviceinformation_id.md) of the device the task is targeting. The background task can provide this to the `FromIdAsync` method of the appropriate device access class to open the device. For example, call [UsbDevice.FromIdAsync](../windows.devices.usb/usbdevice_fromidasync_1322863552.md) in the [Windows.Devices.Usb](../windows.devices.usb/windows_devices_usb.md) namespace to open a USB device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.background.deviceusedetails.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the arguments string provided by the app when it called [RequestAsync](../windows.applicationmodel.background/deviceusetrigger_requestasync_1558743216.md) on the [DeviceUseTrigger](../windows.applicationmodel.background/deviceusetrigger.md). This allows the app to easily pass parameters to the task when it invokes it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.background.deviceusedetails.arguments
     * @type {HSTRING} 
     */
    Arguments {
        get => this.get_Arguments()
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
        if (!this.HasProp("__IDeviceUseDetails")) {
            if ((queryResult := this.QueryInterface(IDeviceUseDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceUseDetails := IDeviceUseDetails(outPtr)
        }

        return this.__IDeviceUseDetails.get_DeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Arguments() {
        if (!this.HasProp("__IDeviceUseDetails")) {
            if ((queryResult := this.QueryInterface(IDeviceUseDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceUseDetails := IDeviceUseDetails(outPtr)
        }

        return this.__IDeviceUseDetails.get_Arguments()
    }

;@endregion Instance Methods
}
