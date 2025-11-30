#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether the device is a primary or immersive type of display.
 * @see https://docs.microsoft.com/windows/win32/api//shellscalingapi/ne-shellscalingapi-display_device_type
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DISPLAY_DEVICE_TYPE extends Win32Enum{

    /**
     * The device is a primary display device.
     * @type {Integer (Int32)}
     */
    static DEVICE_PRIMARY => 0

    /**
     * The device is an immersive display device.
     * @type {Integer (Int32)}
     */
    static DEVICE_IMMERSIVE => 1
}
