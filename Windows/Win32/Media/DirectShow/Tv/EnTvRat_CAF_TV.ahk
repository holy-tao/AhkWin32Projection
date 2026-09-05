#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class EnTvRat_CAF_TV extends Win32Enum {

    /**
     * Native name: CAF_TV_Exempt
     * @type {Integer (Int32)}
     */
    static Exempt => 0

    /**
     * Native name: CAF_TV_G
     * @type {Integer (Int32)}
     */
    static G => 1

    /**
     * Native name: CAF_TV_8
     * @type {Integer (Int32)}
     */
    static 8 => 2

    /**
     * Native name: CAF_TV_13
     * @type {Integer (Int32)}
     */
    static 13 => 3

    /**
     * Native name: CAF_TV_16
     * @type {Integer (Int32)}
     */
    static 16 => 4

    /**
     * Native name: CAF_TV_18
     * @type {Integer (Int32)}
     */
    static 18 => 5

    /**
     * Native name: CAF_TV_Reserved6
     * @type {Integer (Int32)}
     */
    static Reserved6 => 6

    /**
     * Native name: CAF_TV_Reserved
     * @type {Integer (Int32)}
     */
    static Reserved => 7
}
