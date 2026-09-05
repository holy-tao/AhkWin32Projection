#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class DTCLUXLN extends Win32Enum {

    /**
     * Native name: DTCLUXLN_COLD
     * @type {Integer (Int32)}
     */
    static COLD => 1

    /**
     * Native name: DTCLUXLN_WARM
     * @type {Integer (Int32)}
     */
    static WARM => 2
}
