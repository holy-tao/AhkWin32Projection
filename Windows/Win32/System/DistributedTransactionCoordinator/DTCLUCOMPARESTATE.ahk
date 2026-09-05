#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class DTCLUCOMPARESTATE extends Win32Enum {

    /**
     * Native name: DTCLUCOMPARESTATE_COMMITTED
     * @type {Integer (Int32)}
     */
    static COMMITTED => 1

    /**
     * Native name: DTCLUCOMPARESTATE_HEURISTICCOMMITTED
     * @type {Integer (Int32)}
     */
    static HEURISTICCOMMITTED => 2

    /**
     * Native name: DTCLUCOMPARESTATE_HEURISTICMIXED
     * @type {Integer (Int32)}
     */
    static HEURISTICMIXED => 3

    /**
     * Native name: DTCLUCOMPARESTATE_HEURISTICRESET
     * @type {Integer (Int32)}
     */
    static HEURISTICRESET => 4

    /**
     * Native name: DTCLUCOMPARESTATE_INDOUBT
     * @type {Integer (Int32)}
     */
    static INDOUBT => 5

    /**
     * Native name: DTCLUCOMPARESTATE_RESET
     * @type {Integer (Int32)}
     */
    static RESET => 6
}
