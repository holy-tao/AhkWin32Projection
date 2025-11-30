#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class COLORSPACE_TRANSFORM_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_TYPE_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_TYPE_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_TYPE_RGB256x3x16 => 2

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_TYPE_DXGI_1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_TYPE_MATRIX_3x4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static COLORSPACE_TRANSFORM_TYPE_MATRIX_V2 => 5
}
