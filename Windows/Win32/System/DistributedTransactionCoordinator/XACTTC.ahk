#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class XACTTC extends Win32Enum {

    /**
     * Native name: XACTTC_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: XACTTC_SYNC_PHASEONE
     * @type {Integer (Int32)}
     */
    static SYNC_PHASEONE => 1

    /**
     * Native name: XACTTC_SYNC_PHASETWO
     * @type {Integer (Int32)}
     */
    static SYNC_PHASETWO => 2

    /**
     * Native name: XACTTC_SYNC
     * @type {Integer (Int32)}
     */
    static SYNC => 2

    /**
     * Native name: XACTTC_ASYNC_PHASEONE
     * @type {Integer (Int32)}
     */
    static ASYNC_PHASEONE => 4

    /**
     * Native name: XACTTC_ASYNC
     * @type {Integer (Int32)}
     */
    static ASYNC => 4
}
