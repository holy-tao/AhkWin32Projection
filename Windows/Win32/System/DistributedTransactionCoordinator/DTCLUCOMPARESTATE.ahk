#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct DTCLUCOMPARESTATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
