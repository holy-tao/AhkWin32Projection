#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WPD\_CAPTURE\_MODES enumeration type describes the capture timing mode of a still image capture.
 * @remarks
 * This enumeration is used by the [WPD\_STILL\_IMAGE\_CAPTURE\_MODE](still-image-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-capture-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_CAPTURE_MODES{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_CAPTURE_MODE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_CAPTURE_MODE_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_CAPTURE_MODE_BURST => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_CAPTURE_MODE_TIMELAPSE => 3
}
