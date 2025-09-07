#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class WAIT_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static WaitAll => 0

    /**
     * @type {Integer (Int32)}
     */
    static WaitAny => 1

    /**
     * @type {Integer (Int32)}
     */
    static WaitNotification => 2

    /**
     * @type {Integer (Int32)}
     */
    static WaitDequeue => 3

    /**
     * @type {Integer (Int32)}
     */
    static WaitDpc => 4
}
