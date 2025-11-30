#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_TRANSFORM_DATA_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_DATA_TYPE_FIXED_POINT => 0

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_DATA_TYPE_FLOAT => 1
}
