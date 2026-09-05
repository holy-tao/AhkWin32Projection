#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class XACTHEURISTIC extends Win32Enum {

    /**
     * Native name: XACTHEURISTIC_ABORT
     * @type {Integer (Int32)}
     */
    static ABORT => 1

    /**
     * Native name: XACTHEURISTIC_COMMIT
     * @type {Integer (Int32)}
     */
    static COMMIT => 2

    /**
     * Native name: XACTHEURISTIC_DAMAGE
     * @type {Integer (Int32)}
     */
    static DAMAGE => 3

    /**
     * Native name: XACTHEURISTIC_DANGER
     * @type {Integer (Int32)}
     */
    static DANGER => 4
}
