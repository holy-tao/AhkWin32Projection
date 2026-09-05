#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class ADVISE_TYPE extends Win32BitflagEnum {

    /**
     * Native name: ADVISE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: ADVISE_CLIPPING
     * @type {Integer (Int32)}
     */
    static CLIPPING => 1

    /**
     * Native name: ADVISE_PALETTE
     * @type {Integer (Int32)}
     */
    static PALETTE => 2

    /**
     * Native name: ADVISE_COLORKEY
     * @type {Integer (Int32)}
     */
    static COLORKEY => 4

    /**
     * Native name: ADVISE_POSITION
     * @type {Integer (Int32)}
     */
    static POSITION => 8

    /**
     * Native name: ADVISE_DISPLAY_CHANGE
     * @type {Integer (Int32)}
     */
    static DISPLAY_CHANGE => 16
}
