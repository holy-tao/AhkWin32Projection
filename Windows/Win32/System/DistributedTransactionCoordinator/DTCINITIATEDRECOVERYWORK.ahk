#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class DTCINITIATEDRECOVERYWORK extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DTCINITIATEDRECOVERYWORK_CHECKLUSTATUS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DTCINITIATEDRECOVERYWORK_TRANS => 2

    /**
     * @type {Integer (Int32)}
     */
    static DTCINITIATEDRECOVERYWORK_TMDOWN => 3
}
