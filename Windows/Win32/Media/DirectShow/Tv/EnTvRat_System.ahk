#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class EnTvRat_System extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MPAA => 0

    /**
     * @type {Integer (Int32)}
     */
    static US_TV => 1

    /**
     * @type {Integer (Int32)}
     */
    static Canadian_English => 2

    /**
     * @type {Integer (Int32)}
     */
    static Canadian_French => 3

    /**
     * @type {Integer (Int32)}
     */
    static Reserved4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static System5 => 5

    /**
     * @type {Integer (Int32)}
     */
    static System6 => 6

    /**
     * @type {Integer (Int32)}
     */
    static Reserved7 => 7

    /**
     * @type {Integer (Int32)}
     */
    static PBDA => 8

    /**
     * @type {Integer (Int32)}
     */
    static AgeBased => 9

    /**
     * @type {Integer (Int32)}
     */
    static TvRat_kSystems => 10

    /**
     * @type {Integer (Int32)}
     */
    static TvRat_SystemDontKnow => 255
}
