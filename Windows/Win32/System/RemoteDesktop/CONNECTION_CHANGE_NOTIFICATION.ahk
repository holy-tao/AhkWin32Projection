#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class CONNECTION_CHANGE_NOTIFICATION extends Win32Enum {

    /**
     * Native name: CONNECTION_REQUEST_INVALID
     * @type {Integer (Int32)}
     */
    static REQUEST_INVALID => 0

    /**
     * Native name: CONNECTION_REQUEST_PENDING
     * @type {Integer (Int32)}
     */
    static REQUEST_PENDING => 1

    /**
     * Native name: CONNECTION_REQUEST_FAILED
     * @type {Integer (Int32)}
     */
    static REQUEST_FAILED => 2

    /**
     * Native name: CONNECTION_REQUEST_TIMEDOUT
     * @type {Integer (Int32)}
     */
    static REQUEST_TIMEDOUT => 3

    /**
     * Native name: CONNECTION_REQUEST_SUCCEEDED
     * @type {Integer (Int32)}
     */
    static REQUEST_SUCCEEDED => 4

    /**
     * Native name: CONNECTION_REQUEST_CANCELLED
     * @type {Integer (Int32)}
     */
    static REQUEST_CANCELLED => 5

    /**
     * Native name: CONNECTION_REQUEST_LB_COMPLETED
     * @type {Integer (Int32)}
     */
    static REQUEST_LB_COMPLETED => 6

    /**
     * Native name: CONNECTION_REQUEST_QUERY_PL_COMPLETED
     * @type {Integer (Int32)}
     */
    static REQUEST_QUERY_PL_COMPLETED => 7

    /**
     * Native name: CONNECTION_REQUEST_ORCH_COMPLETED
     * @type {Integer (Int32)}
     */
    static REQUEST_ORCH_COMPLETED => 8
}
