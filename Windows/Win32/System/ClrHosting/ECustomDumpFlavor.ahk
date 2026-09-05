#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class ECustomDumpFlavor extends Win32Enum {

    /**
     * Native name: DUMP_FLAVOR_Mini
     * @type {Integer (Int32)}
     */
    static Mini => 0

    /**
     * Native name: DUMP_FLAVOR_CriticalCLRState
     * @type {Integer (Int32)}
     */
    static CriticalCLRState => 1

    /**
     * Native name: DUMP_FLAVOR_NonHeapCLRState
     * @type {Integer (Int32)}
     */
    static NonHeapCLRState => 2

    /**
     * Native name: DUMP_FLAVOR_Default
     * @type {Integer (Int32)}
     */
    static Default => 0
}
