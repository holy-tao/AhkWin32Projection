#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_TRANSFORM_TARGET_CAPS_VERSION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_VERSION_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_VERSION_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_VERSION_NOT_SUPPORTED => 0
}
