#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceDisconnectButtonClickedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [DisconnectButtonClicked](devicepicker_disconnectbuttonclicked.md) event on the [DevicePicker](devicepicker.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicedisconnectbuttonclickedeventargs
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceDisconnectButtonClickedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceDisconnectButtonClickedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceDisconnectButtonClickedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The device that the user clicked the disconnect button for.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicedisconnectbuttonclickedeventargs.device
     * @type {DeviceInformation} 
     */
    Device {
        get => this.get_Device()
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
    get_Device() {
        if (!this.HasProp("__IDeviceDisconnectButtonClickedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDeviceDisconnectButtonClickedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceDisconnectButtonClickedEventArgs := IDeviceDisconnectButtonClickedEventArgs(outPtr)
        }

        return this.__IDeviceDisconnectButtonClickedEventArgs.get_Device()
    }

;@endregion Instance Methods
}
