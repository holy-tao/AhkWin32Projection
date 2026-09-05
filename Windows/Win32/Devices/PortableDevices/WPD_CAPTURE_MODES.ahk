#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_CAPTURE\_MODES enumeration type describes the capture timing mode of a still image capture.
 * @remarks
 * This enumeration is used by the [WPD\_STILL\_IMAGE\_CAPTURE\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-capture-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_CAPTURE_MODES extends Win32Enum {

    /**
     * Native name: WPD_CAPTURE_MODE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static MODE_UNDEFINED => 0

    /**
     * Native name: WPD_CAPTURE_MODE_NORMAL
     * @type {Integer (Int32)}
     */
    static MODE_NORMAL => 1

    /**
     * Native name: WPD_CAPTURE_MODE_BURST
     * @type {Integer (Int32)}
     */
    static MODE_BURST => 2

    /**
     * Native name: WPD_CAPTURE_MODE_TIMELAPSE
     * @type {Integer (Int32)}
     */
    static MODE_TIMELAPSE => 3
}
