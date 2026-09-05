#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class WTS_CACHEFLAGS extends Win32BitflagEnum {

    /**
     * Native name: WTS_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: WTS_LOWQUALITY
     * @type {Integer (Int32)}
     */
    static LOWQUALITY => 1

    /**
     * Native name: WTS_CACHED
     * @type {Integer (Int32)}
     */
    static CACHED => 2
}
