#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class DTCINITIATEDRECOVERYWORK extends Win32Enum {

    /**
     * Native name: DTCINITIATEDRECOVERYWORK_CHECKLUSTATUS
     * @type {Integer (Int32)}
     */
    static CHECKLUSTATUS => 1

    /**
     * Native name: DTCINITIATEDRECOVERYWORK_TRANS
     * @type {Integer (Int32)}
     */
    static TRANS => 2

    /**
     * Native name: DTCINITIATEDRECOVERYWORK_TMDOWN
     * @type {Integer (Int32)}
     */
    static TMDOWN => 3
}
