#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MOVESIZE_OPERATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_RIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_TOP => 3

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_TOPLEFT => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_TOPRIGHT => 5

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_BOTTOM => 6

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_BOTTOMLEFT => 7

    /**
     * @type {Integer (Int32)}
     */
    static MSO_SIZE_BOTTOMRIGHT => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSO_MOVE => 9
}
