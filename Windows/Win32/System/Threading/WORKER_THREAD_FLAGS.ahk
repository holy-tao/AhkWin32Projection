#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class WORKER_THREAD_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEDEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEINIOTHREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEINPERSISTENTTHREAD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEINWAITTHREAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTELONGFUNCTION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEONLYONCE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WT_TRANSFER_IMPERSONATION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEINTIMERTHREAD => 32
}
