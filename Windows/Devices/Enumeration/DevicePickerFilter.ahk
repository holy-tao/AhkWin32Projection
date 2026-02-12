#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDevicePickerFilter.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the filter used to determine which devices to show in the device picker. The filter parameters are OR-ed together to build the resulting filter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepickerfilter
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DevicePickerFilter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDevicePickerFilter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDevicePickerFilter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of supported device classes to show in the picker. This defaults to an empty list (no filter). You can add device classes to this vector and filter the devices list to those that are in one or more of the provided classes.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepickerfilter.supporteddeviceclasses
     * @type {IVector<Integer>} 
     */
    SupportedDeviceClasses {
        get => this.get_SupportedDeviceClasses()
    }

    /**
     * Gets a list of AQS filter strings. This defaults to empty list (no filter). You can add one or more AQS filter strings to this vector and filter the devices list to those that meet one or more of the provided filters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepickerfilter.supporteddeviceselectors
     * @type {IVector<HSTRING>} 
     */
    SupportedDeviceSelectors {
        get => this.get_SupportedDeviceSelectors()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_SupportedDeviceClasses() {
        if (!this.HasProp("__IDevicePickerFilter")) {
            if ((queryResult := this.QueryInterface(IDevicePickerFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerFilter := IDevicePickerFilter(outPtr)
        }

        return this.__IDevicePickerFilter.get_SupportedDeviceClasses()
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SupportedDeviceSelectors() {
        if (!this.HasProp("__IDevicePickerFilter")) {
            if ((queryResult := this.QueryInterface(IDevicePickerFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDevicePickerFilter := IDevicePickerFilter(outPtr)
        }

        return this.__IDevicePickerFilter.get_SupportedDeviceSelectors()
    }

;@endregion Instance Methods
}
