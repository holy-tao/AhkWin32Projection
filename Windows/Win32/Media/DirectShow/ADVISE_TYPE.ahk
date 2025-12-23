#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ADVISE_TYPE extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static ADVISE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ADVISE_CLIPPING => 1

    /**
     * @type {Integer (Int32)}
     */
    static ADVISE_PALETTE => 2

    /**
     * @type {Integer (Int32)}
     */
    static ADVISE_COLORKEY => 4

    /**
     * @type {Integer (Int32)}
     */
    static ADVISE_POSITION => 8

    /**
     * @type {Integer (Int32)}
     */
    static ADVISE_DISPLAY_CHANGE => 16
}
