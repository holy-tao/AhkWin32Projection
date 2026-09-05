#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msifiFastInstallBits extends Win32Enum {

    /**
     * Native name: msifiFastInstallNoSR
     * @type {Integer (Int32)}
     */
    static NoSR => 1

    /**
     * Native name: msifiFastInstallQuickCosting
     * @type {Integer (Int32)}
     */
    static QuickCosting => 2

    /**
     * Native name: msifiFastInstallLessPrgMsg
     * @type {Integer (Int32)}
     */
    static LessPrgMsg => 4
}
