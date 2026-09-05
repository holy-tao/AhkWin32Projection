#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class DISP_CHANGE extends Win32Enum {

    /**
     * Native name: DISP_CHANGE_SUCCESSFUL
     * @type {Integer (Int32)}
     */
    static SUCCESSFUL => 0

    /**
     * Native name: DISP_CHANGE_RESTART
     * @type {Integer (Int32)}
     */
    static RESTART => 1

    /**
     * Native name: DISP_CHANGE_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => -1

    /**
     * Native name: DISP_CHANGE_BADMODE
     * @type {Integer (Int32)}
     */
    static BADMODE => -2

    /**
     * Native name: DISP_CHANGE_NOTUPDATED
     * @type {Integer (Int32)}
     */
    static NOTUPDATED => -3

    /**
     * Native name: DISP_CHANGE_BADFLAGS
     * @type {Integer (Int32)}
     */
    static BADFLAGS => -4

    /**
     * Native name: DISP_CHANGE_BADPARAM
     * @type {Integer (Int32)}
     */
    static BADPARAM => -5

    /**
     * Native name: DISP_CHANGE_BADDUALVIEW
     * @type {Integer (Int32)}
     */
    static BADDUALVIEW => -6
}
