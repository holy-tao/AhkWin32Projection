#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-capture-modes
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_CAPTURE_MODES extends Win32Enum{

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
