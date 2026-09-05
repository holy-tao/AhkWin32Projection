#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 */
class UMS_THREAD_INFO_CLASS extends Win32Enum {

    /**
     * Native name: UmsThreadInvalidInfoClass
     * @type {Integer (Int32)}
     */
    static InvalidInfoClass => 0

    /**
     * Native name: UmsThreadUserContext
     * @type {Integer (Int32)}
     */
    static UserContext => 1

    /**
     * Native name: UmsThreadPriority
     * @type {Integer (Int32)}
     */
    static Priority => 2

    /**
     * Native name: UmsThreadAffinity
     * @type {Integer (Int32)}
     */
    static Affinity => 3

    /**
     * Native name: UmsThreadTeb
     * @type {Integer (Int32)}
     */
    static Teb => 4

    /**
     * Native name: UmsThreadIsSuspended
     * @type {Integer (Int32)}
     */
    static IsSuspended => 5

    /**
     * Native name: UmsThreadIsTerminated
     * @type {Integer (Int32)}
     */
    static IsTerminated => 6

    /**
     * Native name: UmsThreadMaxInfoClass
     * @type {Integer (Int32)}
     */
    static MaxInfoClass => 7
}
