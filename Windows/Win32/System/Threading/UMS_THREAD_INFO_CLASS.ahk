#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class UMS_THREAD_INFO_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadInvalidInfoClass => 0

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadUserContext => 1

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadPriority => 2

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadAffinity => 3

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadTeb => 4

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadIsSuspended => 5

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadIsTerminated => 6

    /**
     * @type {Integer (Int32)}
     */
    static UmsThreadMaxInfoClass => 7
}
