#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UVerticalOrientation extends Win32Enum {

    /**
     * Native name: U_VO_ROTATED
     * @type {Integer (Int32)}
     */
    static VO_ROTATED => 0

    /**
     * Native name: U_VO_TRANSFORMED_ROTATED
     * @type {Integer (Int32)}
     */
    static VO_TRANSFORMED_ROTATED => 1

    /**
     * Native name: U_VO_TRANSFORMED_UPRIGHT
     * @type {Integer (Int32)}
     */
    static VO_TRANSFORMED_UPRIGHT => 2

    /**
     * Native name: U_VO_UPRIGHT
     * @type {Integer (Int32)}
     */
    static VO_UPRIGHT => 3
}
