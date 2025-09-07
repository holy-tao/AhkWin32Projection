#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class DTCLUCOMPARESTATE{

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUCOMPARESTATE_COMMITTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUCOMPARESTATE_HEURISTICCOMMITTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUCOMPARESTATE_HEURISTICMIXED => 3

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUCOMPARESTATE_HEURISTICRESET => 4

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUCOMPARESTATE_INDOUBT => 5

    /**
     * @type {Integer (Int32)}
     */
    static DTCLUCOMPARESTATE_RESET => 6
}
