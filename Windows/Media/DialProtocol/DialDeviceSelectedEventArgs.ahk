#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDialDeviceSelectedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the event arguments for the [DialDeviceSelected](dialdevicepicker_dialdeviceselected.md) event on the [DialDevicePicker](dialdevicepicker.md) object.
 * @remarks
 * Get an instance of this class by accessing the [DialDeviceSelected](dialdevicepicker_dialdeviceselected.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdeviceselectedeventargs
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class DialDeviceSelectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDialDeviceSelectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDialDeviceSelectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [DialDevice](dialdevice.md) object that represents the remote device that has been selected by the user in a [DialDevicePicker](dialdevicepicker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdeviceselectedeventargs.selecteddialdevice
     * @type {DialDevice} 
     */
    SelectedDialDevice {
        get => this.get_SelectedDialDevice()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DialDevice} 
     */
    get_SelectedDialDevice() {
        if (!this.HasProp("__IDialDeviceSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDialDeviceSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDeviceSelectedEventArgs := IDialDeviceSelectedEventArgs(outPtr)
        }

        return this.__IDialDeviceSelectedEventArgs.get_SelectedDialDevice()
    }

;@endregion Instance Methods
}
