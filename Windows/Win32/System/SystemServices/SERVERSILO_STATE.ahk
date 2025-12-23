#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class SERVERSILO_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SERVERSILO_INITING => 0

    /**
     * @type {Integer (Int32)}
     */
    static SERVERSILO_STARTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static SERVERSILO_SHUTTING_DOWN => 2

    /**
     * @type {Integer (Int32)}
     */
    static SERVERSILO_TERMINATING => 3

    /**
     * @type {Integer (Int32)}
     */
    static SERVERSILO_TERMINATED => 4
}
