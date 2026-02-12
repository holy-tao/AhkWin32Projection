#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceSelectedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [DeviceSelected](devicepicker_deviceselected.md) event on the [DevicePicker](devicepicker.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceselectedeventargs
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceSelectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceSelectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceSelectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The device selected by the user in the picker.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceselectedeventargs.selecteddevice
     * @type {DeviceInformation} 
     */
    SelectedDevice {
        get => this.get_SelectedDevice()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_SelectedDevice() {
        if (!this.HasProp("__IDeviceSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDeviceSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceSelectedEventArgs := IDeviceSelectedEventArgs(outPtr)
        }

        return this.__IDeviceSelectedEventArgs.get_SelectedDevice()
    }

;@endregion Instance Methods
}
