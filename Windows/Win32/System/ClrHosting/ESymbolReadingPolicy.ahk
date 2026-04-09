#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class ESymbolReadingPolicy extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static eSymbolReadingNever => 0

    /**
     * @type {Integer (Int32)}
     */
    static eSymbolReadingAlways => 1

    /**
     * @type {Integer (Int32)}
     */
    static eSymbolReadingFullTrustOnly => 2
}
