#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether the device is a primary or immersive type of display.
 * @see https://learn.microsoft.com/windows/win32/api/shellscalingapi/ne-shellscalingapi-display_device_type
 * @namespace Windows.Win32.UI.Shell
 */
class DISPLAY_DEVICE_TYPE extends Win32Enum {

    /**
     * The device is a primary display device.
     * Native name: DEVICE_PRIMARY
     * @type {Integer (Int32)}
     */
    static PRIMARY => 0

    /**
     * The device is an immersive display device.
     * Native name: DEVICE_IMMERSIVE
     * @type {Integer (Int32)}
     */
    static IMMERSIVE => 1
}
