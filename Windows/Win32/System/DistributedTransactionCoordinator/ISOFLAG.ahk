#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
class ISOFLAG extends Win32Enum {

    /**
     * Native name: ISOFLAG_RETAIN_COMMIT_DC
     * @type {Integer (Int32)}
     */
    static RETAIN_COMMIT_DC => 1

    /**
     * Native name: ISOFLAG_RETAIN_COMMIT
     * @type {Integer (Int32)}
     */
    static RETAIN_COMMIT => 2

    /**
     * Native name: ISOFLAG_RETAIN_COMMIT_NO
     * @type {Integer (Int32)}
     */
    static RETAIN_COMMIT_NO => 3

    /**
     * Native name: ISOFLAG_RETAIN_ABORT_DC
     * @type {Integer (Int32)}
     */
    static RETAIN_ABORT_DC => 4

    /**
     * Native name: ISOFLAG_RETAIN_ABORT
     * @type {Integer (Int32)}
     */
    static RETAIN_ABORT => 8

    /**
     * Native name: ISOFLAG_RETAIN_ABORT_NO
     * @type {Integer (Int32)}
     */
    static RETAIN_ABORT_NO => 12

    /**
     * Native name: ISOFLAG_RETAIN_DONTCARE
     * @type {Integer (Int32)}
     */
    static RETAIN_DONTCARE => 5

    /**
     * Native name: ISOFLAG_RETAIN_BOTH
     * @type {Integer (Int32)}
     */
    static RETAIN_BOTH => 10

    /**
     * Native name: ISOFLAG_RETAIN_NONE
     * @type {Integer (Int32)}
     */
    static RETAIN_NONE => 15

    /**
     * Native name: ISOFLAG_OPTIMISTIC
     * @type {Integer (Int32)}
     */
    static OPTIMISTIC => 16

    /**
     * Native name: ISOFLAG_READONLY
     * @type {Integer (Int32)}
     */
    static READONLY => 32
}
