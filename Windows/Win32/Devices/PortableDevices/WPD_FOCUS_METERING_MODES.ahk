#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_FOCUS\_METERING\_MODES enumeration type describes how a device should decide what part of a frame to use to set focus.
 * @remarks
 * This enumeration is specified by the [WPD\_STILL\_IMAGE\_FOCUS\_METERING\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-focus-metering-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_FOCUS_METERING_MODES extends Win32Enum {

    /**
     * Native name: WPD_FOCUS_METERING_MODE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static MODE_UNDEFINED => 0

    /**
     * Native name: WPD_FOCUS_METERING_MODE_CENTER_SPOT
     * @type {Integer (Int32)}
     */
    static MODE_CENTER_SPOT => 1

    /**
     * Native name: WPD_FOCUS_METERING_MODE_MULTI_SPOT
     * @type {Integer (Int32)}
     */
    static MODE_MULTI_SPOT => 2
}
