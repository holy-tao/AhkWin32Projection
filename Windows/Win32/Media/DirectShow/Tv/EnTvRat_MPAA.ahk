#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class EnTvRat_MPAA extends Win32Enum {

    /**
     * Native name: MPAA_NotApplicable
     * @type {Integer (Int32)}
     */
    static NotApplicable => 0

    /**
     * Native name: MPAA_G
     * @type {Integer (Int32)}
     */
    static G => 1

    /**
     * Native name: MPAA_PG
     * @type {Integer (Int32)}
     */
    static PG => 2

    /**
     * Native name: MPAA_PG13
     * @type {Integer (Int32)}
     */
    static PG13 => 3

    /**
     * Native name: MPAA_R
     * @type {Integer (Int32)}
     */
    static R => 4

    /**
     * Native name: MPAA_NC17
     * @type {Integer (Int32)}
     */
    static NC17 => 5

    /**
     * Native name: MPAA_X
     * @type {Integer (Int32)}
     */
    static X => 6

    /**
     * Native name: MPAA_NotRated
     * @type {Integer (Int32)}
     */
    static NotRated => 7
}
