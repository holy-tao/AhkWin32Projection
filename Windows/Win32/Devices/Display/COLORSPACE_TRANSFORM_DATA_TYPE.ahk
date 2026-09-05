#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class COLORSPACE_TRANSFORM_DATA_TYPE extends Win32Enum {

    /**
     * Native name: COLORSPACE_TRANSFORM_DATA_TYPE_FIXED_POINT
     * @type {Integer (Int32)}
     */
    static FIXED_POINT => 0

    /**
     * Native name: COLORSPACE_TRANSFORM_DATA_TYPE_FLOAT
     * @type {Integer (Int32)}
     */
    static FLOAT => 1
}
