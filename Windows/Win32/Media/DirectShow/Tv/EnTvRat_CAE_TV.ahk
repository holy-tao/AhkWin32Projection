#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class EnTvRat_CAE_TV extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_Exempt => 0

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_C => 1

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_C8 => 2

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_G => 3

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_PG => 4

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_14 => 5

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_18 => 6

    /**
     * @type {Integer (Int32)}
     */
    static CAE_TV_Reserved => 7
}
