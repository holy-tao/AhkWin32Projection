#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_FOCUS\_MODES enumeration type describes the focus mode used by a still image capture device.
 * @remarks
 * This enumeration is used by the [WPD\_STILL\_IMAGE\_FOCUS\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-focus-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_FOCUS_MODES extends Win32Enum {

    /**
     * Native name: WPD_FOCUS_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Native name: WPD_FOCUS_MANUAL
     * @type {Integer (Int32)}
     */
    static MANUAL => 1

    /**
     * Native name: WPD_FOCUS_AUTOMATIC
     * @type {Integer (Int32)}
     */
    static AUTOMATIC => 2

    /**
     * Native name: WPD_FOCUS_AUTOMATIC_MACRO
     * @type {Integer (Int32)}
     */
    static AUTOMATIC_MACRO => 3
}
