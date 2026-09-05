#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class ESymbolReadingPolicy extends Win32Enum {

    /**
     * Native name: eSymbolReadingNever
     * @type {Integer (Int32)}
     */
    static Never => 0

    /**
     * Native name: eSymbolReadingAlways
     * @type {Integer (Int32)}
     */
    static Always => 1

    /**
     * Native name: eSymbolReadingFullTrustOnly
     * @type {Integer (Int32)}
     */
    static FullTrustOnly => 2
}
