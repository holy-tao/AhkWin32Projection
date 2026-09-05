#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class MXDC_LANDSCAPE_ROTATION_ENUMS extends Win32Enum {

    /**
     * Native name: MXDC_LANDSCAPE_ROTATE_COUNTERCLOCKWISE_90_DEGREES
     * @type {Integer (Int32)}
     */
    static ROTATE_COUNTERCLOCKWISE_90_DEGREES => 90

    /**
     * Native name: MXDC_LANDSCAPE_ROTATE_NONE
     * @type {Integer (Int32)}
     */
    static ROTATE_NONE => 0

    /**
     * Native name: MXDC_LANDSCAPE_ROTATE_COUNTERCLOCKWISE_270_DEGREES
     * @type {Integer (Int32)}
     */
    static ROTATE_COUNTERCLOCKWISE_270_DEGREES => -90
}
