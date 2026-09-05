#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class EMemoryAvailable extends Win32Enum {

    /**
     * Native name: eMemoryAvailableLow
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * Native name: eMemoryAvailableNeutral
     * @type {Integer (Int32)}
     */
    static Neutral => 2

    /**
     * Native name: eMemoryAvailableHigh
     * @type {Integer (Int32)}
     */
    static High => 3
}
