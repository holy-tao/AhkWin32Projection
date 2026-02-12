#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICastingDeviceSelectedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the event arguments for the [CastingDeviceSelected](castingdevicepicker_castingdeviceselected.md) event on the [CastingDevicePicker](castingdevicepicker.md) object.
 * @remarks
 * Get an instance of this class by handling the [CastingDeviceSelected](castingdevicepicker_castingdeviceselected.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdeviceselectedeventargs
 * @namespace Windows.Media.Casting
 * @version WindowsRuntime 1.4
 */
class CastingDeviceSelectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICastingDeviceSelectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICastingDeviceSelectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Represents the [CastingDevice](castingdevice.md) that has been selected by the user in a casting device picker.
     * @see https://learn.microsoft.com/uwp/api/windows.media.casting.castingdeviceselectedeventargs.selectedcastingdevice
     * @type {CastingDevice} 
     */
    SelectedCastingDevice {
        get => this.get_SelectedCastingDevice()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CastingDevice} 
     */
    get_SelectedCastingDevice() {
        if (!this.HasProp("__ICastingDeviceSelectedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICastingDeviceSelectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICastingDeviceSelectedEventArgs := ICastingDeviceSelectedEventArgs(outPtr)
        }

        return this.__ICastingDeviceSelectedEventArgs.get_SelectedCastingDevice()
    }

;@endregion Instance Methods
}
