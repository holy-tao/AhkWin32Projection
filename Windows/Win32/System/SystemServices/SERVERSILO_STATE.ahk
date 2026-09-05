#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class SERVERSILO_STATE extends Win32Enum {

    /**
     * Native name: SERVERSILO_INITING
     * @type {Integer (Int32)}
     */
    static INITING => 0

    /**
     * Native name: SERVERSILO_STARTED
     * @type {Integer (Int32)}
     */
    static STARTED => 1

    /**
     * Native name: SERVERSILO_SHUTTING_DOWN
     * @type {Integer (Int32)}
     */
    static SHUTTING_DOWN => 2

    /**
     * Native name: SERVERSILO_TERMINATING
     * @type {Integer (Int32)}
     */
    static TERMINATING => 3

    /**
     * Native name: SERVERSILO_TERMINATED
     * @type {Integer (Int32)}
     */
    static TERMINATED => 4
}
