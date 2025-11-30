#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ETaskType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TT_DEBUGGERHELPER => 1

    /**
     * @type {Integer (Int32)}
     */
    static TT_GC => 2

    /**
     * @type {Integer (Int32)}
     */
    static TT_FINALIZER => 4

    /**
     * @type {Integer (Int32)}
     */
    static TT_THREADPOOL_TIMER => 8

    /**
     * @type {Integer (Int32)}
     */
    static TT_THREADPOOL_GATE => 16

    /**
     * @type {Integer (Int32)}
     */
    static TT_THREADPOOL_WORKER => 32

    /**
     * @type {Integer (Int32)}
     */
    static TT_THREADPOOL_IOCOMPLETION => 64

    /**
     * @type {Integer (Int32)}
     */
    static TT_ADUNLOAD => 128

    /**
     * @type {Integer (Int32)}
     */
    static TT_USER => 256

    /**
     * @type {Integer (Int32)}
     */
    static TT_THREADPOOL_WAIT => 512

    /**
     * @type {Integer (Int32)}
     */
    static TT_UNKNOWN => -2147483648
}
