#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class WCT_OBJECT_STATUS extends Win32Enum {

    /**
     * Native name: WctStatusNoAccess
     * @type {Integer (Int32)}
     */
    static NoAccess => 1

    /**
     * Native name: WctStatusRunning
     * @type {Integer (Int32)}
     */
    static Running => 2

    /**
     * Native name: WctStatusBlocked
     * @type {Integer (Int32)}
     */
    static Blocked => 3

    /**
     * Native name: WctStatusPidOnly
     * @type {Integer (Int32)}
     */
    static PidOnly => 4

    /**
     * Native name: WctStatusPidOnlyRpcss
     * @type {Integer (Int32)}
     */
    static PidOnlyRpcss => 5

    /**
     * Native name: WctStatusOwned
     * @type {Integer (Int32)}
     */
    static Owned => 6

    /**
     * Native name: WctStatusNotOwned
     * @type {Integer (Int32)}
     */
    static NotOwned => 7

    /**
     * Native name: WctStatusAbandoned
     * @type {Integer (Int32)}
     */
    static Abandoned => 8

    /**
     * Native name: WctStatusUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 9

    /**
     * Native name: WctStatusError
     * @type {Integer (Int32)}
     */
    static Error => 10

    /**
     * Native name: WctStatusMax
     * @type {Integer (Int32)}
     */
    static Max => 11
}
