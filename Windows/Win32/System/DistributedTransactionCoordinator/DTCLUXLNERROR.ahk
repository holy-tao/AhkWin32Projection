#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class DTCLUXLNERROR extends Win32Enum {

    /**
     * Native name: DTCLUXLNERROR_PROTOCOL
     * @type {Integer (Int32)}
     */
    static PROTOCOL => 1

    /**
     * Native name: DTCLUXLNERROR_LOGNAMEMISMATCH
     * @type {Integer (Int32)}
     */
    static LOGNAMEMISMATCH => 2

    /**
     * Native name: DTCLUXLNERROR_COLDWARMMISMATCH
     * @type {Integer (Int32)}
     */
    static COLDWARMMISMATCH => 3
}
