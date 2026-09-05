#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Kernel
 */
class WAIT_TYPE extends Win32Enum {

    /**
     * Native name: WaitAll
     * @type {Integer (Int32)}
     */
    static All => 0

    /**
     * Native name: WaitAny
     * @type {Integer (Int32)}
     */
    static Any => 1

    /**
     * Native name: WaitNotification
     * @type {Integer (Int32)}
     */
    static Notification => 2

    /**
     * Native name: WaitDequeue
     * @type {Integer (Int32)}
     */
    static Dequeue => 3

    /**
     * Native name: WaitDpc
     * @type {Integer (Int32)}
     */
    static Dpc => 4
}
