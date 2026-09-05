#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class EnTvRat_CAE_TV extends Win32Enum {

    /**
     * Native name: CAE_TV_Exempt
     * @type {Integer (Int32)}
     */
    static Exempt => 0

    /**
     * Native name: CAE_TV_C
     * @type {Integer (Int32)}
     */
    static C => 1

    /**
     * Native name: CAE_TV_C8
     * @type {Integer (Int32)}
     */
    static C8 => 2

    /**
     * Native name: CAE_TV_G
     * @type {Integer (Int32)}
     */
    static G => 3

    /**
     * Native name: CAE_TV_PG
     * @type {Integer (Int32)}
     */
    static PG => 4

    /**
     * Native name: CAE_TV_14
     * @type {Integer (Int32)}
     */
    static 14 => 5

    /**
     * Native name: CAE_TV_18
     * @type {Integer (Int32)}
     */
    static 18 => 6

    /**
     * Native name: CAE_TV_Reserved
     * @type {Integer (Int32)}
     */
    static Reserved => 7
}
