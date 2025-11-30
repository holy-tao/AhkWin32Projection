#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WCT_OBJECT_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WctStatusNoAccess => 1

    /**
     * @type {Integer (Int32)}
     */
    static WctStatusRunning => 2

    /**
     * @type {Integer (Int32)}
     */
    static WctStatusBlocked => 3

    /**
     * @type {Integer (Int32)}
     */
    static WctStatusPidOnly => 4

    /**
     * @type {Integer (Int32)}
     */
    static WctStatusPidOnlyRpcss => 5

    /**
     * @type {Integer (Int32)}
     */
    static WctStatusOwned => 6

    /**
     * @type {Integer (Int32)}
     */
    static WctStatusNotOwned => 7

    /**
     * @type {Integer (Int32)}
     */
    static WctStatusAbandoned => 8

    /**
     * @type {Integer (Int32)}
     */
    static WctStatusUnknown => 9

    /**
     * @type {Integer (Int32)}
     */
    static WctStatusError => 10

    /**
     * @type {Integer (Int32)}
     */
    static WctStatusMax => 11
}
