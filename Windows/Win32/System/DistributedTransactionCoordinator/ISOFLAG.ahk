#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ISOFLAG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_COMMIT_DC => 1

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_COMMIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_COMMIT_NO => 3

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_ABORT_DC => 4

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_ABORT => 8

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_ABORT_NO => 12

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_DONTCARE => 5

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_BOTH => 10

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_RETAIN_NONE => 15

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_OPTIMISTIC => 16

    /**
     * @type {Integer (Int32)}
     */
    static ISOFLAG_READONLY => 32
}
