#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class COLORSPACE_TRANSFORM_TARGET_CAPS_VERSION extends Win32Enum {

    /**
     * Native name: COLORSPACE_TRANSFORM_VERSION_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: COLORSPACE_TRANSFORM_VERSION_1
     * @type {Integer (Int32)}
     */
    static 1 => 1

    /**
     * Native name: COLORSPACE_TRANSFORM_VERSION_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static NOT_SUPPORTED => 0
}
