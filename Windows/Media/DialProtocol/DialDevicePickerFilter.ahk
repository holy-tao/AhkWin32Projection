#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDialDevicePickerFilter.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the filter used to determine which devices to show in a [DialDevicePicker](dialdevicepicker.md). The filter parameters are OR-ed together to build the resulting filter.
 * @remarks
 * This class is received by accessing the [DialDevicePicker.Filter](dialdevicepicker_filter.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevicepickerfilter
 * @namespace Windows.Media.DialProtocol
 * @version WindowsRuntime 1.4
 */
class DialDevicePickerFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDialDevicePickerFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDialDevicePickerFilter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of DIAL apps supported by the remote devices. Defaults to an empty list (no filter). You can add one or more app names and filter the devices list to those that can launch one the supported apps.
     * @see https://learn.microsoft.com/uwp/api/windows.media.dialprotocol.dialdevicepickerfilter.supportedappnames
     * @type {IVector<HSTRING>} 
     */
    SupportedAppNames {
        get => this.get_SupportedAppNames()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SupportedAppNames() {
        if (!this.HasProp("__IDialDevicePickerFilter")) {
            if ((queryResult := this.QueryInterface(IDialDevicePickerFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDialDevicePickerFilter := IDialDevicePickerFilter(outPtr)
        }

        return this.__IDialDevicePickerFilter.get_SupportedAppNames()
    }

;@endregion Instance Methods
}
