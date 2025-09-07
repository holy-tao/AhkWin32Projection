#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WPD\_FOCUS\_METERING\_MODES enumeration type describes how a device should decide what part of a frame to use to set focus.
 * @remarks
 * This enumeration is specified by the [WPD\_STILL\_IMAGE\_FOCUS\_METERING\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-focus-metering-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_FOCUS_METERING_MODES{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FOCUS_METERING_MODE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FOCUS_METERING_MODE_CENTER_SPOT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_FOCUS_METERING_MODE_MULTI_SPOT => 2
}
