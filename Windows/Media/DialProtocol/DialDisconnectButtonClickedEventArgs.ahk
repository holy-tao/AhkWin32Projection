#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDialDisconnectButtonClickedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the event arguments for the [DisconnectButtonClicked](dialdevicepicker_disconnectbuttonclicked.md) event on the [DialDevicePicker](dialdevicepicker.md) object.
 * @remarks
 * Get an instance of this class by accessing the [DisconnectButtonClicked](dialdevicepicker_disconnectbuttonclicked.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdisconnectbuttonclickedeventargs
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class DialDisconnectButtonClickedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDialDisconnectButtonClickedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDialDisconnectButtonClickedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [DialDevice](dialdevice.md) object that represents the remote device that the user wants to disconnect.
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdisconnectbuttonclickedeventargs.device
     * @type {DialDevice} 
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
     * @returns {DialDevice} 
     */
    get_Device() {
        if (!this.HasProp("__IDialDisconnectButtonClickedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDialDisconnectButtonClickedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDisconnectButtonClickedEventArgs := IDialDisconnectButtonClickedEventArgs(outPtr)
        }

        return this.__IDialDisconnectButtonClickedEventArgs.get_Device()
    }

;@endregion Instance Methods
}
