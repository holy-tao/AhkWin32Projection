#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class XACTTC extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XACTTC_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static XACTTC_SYNC_PHASEONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static XACTTC_SYNC_PHASETWO => 2

    /**
     * @type {Integer (Int32)}
     */
    static XACTTC_SYNC => 2

    /**
     * @type {Integer (Int32)}
     */
    static XACTTC_ASYNC_PHASEONE => 4

    /**
     * @type {Integer (Int32)}
     */
    static XACTTC_ASYNC => 4
}
