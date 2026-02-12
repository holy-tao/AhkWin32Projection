#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates what you'd like the device picker to show about a given device. Used with the [SetDisplayStatus](devicepicker_setdisplaystatus_987185536.md) method on the [DevicePicker](devicepicker.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepickerdisplaystatusoptions
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DevicePickerDisplayStatusOptions extends Win32BitflagEnum{

    /**
     * Picker should show nothing, or no changes.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Picker should display progress.
     * @type {Integer (UInt32)}
     */
    static ShowProgress => 1

    /**
     * Picker should display a disconnect button.
     * @type {Integer (UInt32)}
     */
    static ShowDisconnectButton => 2

    /**
     * Picker should display a retry button.
     * @type {Integer (UInt32)}
     */
    static ShowRetryButton => 4
}
