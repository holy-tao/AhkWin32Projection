#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class MXDC_LANDSCAPE_ROTATION_ENUMS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_LANDSCAPE_ROTATE_COUNTERCLOCKWISE_90_DEGREES => 90

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_LANDSCAPE_ROTATE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_LANDSCAPE_ROTATE_COUNTERCLOCKWISE_270_DEGREES => -90
}
