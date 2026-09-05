#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Iis
 */
class SF_STATUS_TYPE extends Win32Enum {

    /**
     * Native name: SF_STATUS_REQ_FINISHED
     * @type {Integer (Int32)}
     */
    static REQ_FINISHED => 134217728

    /**
     * Native name: SF_STATUS_REQ_FINISHED_KEEP_CONN
     * @type {Integer (Int32)}
     */
    static REQ_FINISHED_KEEP_CONN => 134217729

    /**
     * Native name: SF_STATUS_REQ_NEXT_NOTIFICATION
     * @type {Integer (Int32)}
     */
    static REQ_NEXT_NOTIFICATION => 134217730

    /**
     * Native name: SF_STATUS_REQ_HANDLED_NOTIFICATION
     * @type {Integer (Int32)}
     */
    static REQ_HANDLED_NOTIFICATION => 134217731

    /**
     * Native name: SF_STATUS_REQ_ERROR
     * @type {Integer (Int32)}
     */
    static REQ_ERROR => 134217732

    /**
     * Native name: SF_STATUS_REQ_READ_NEXT
     * @type {Integer (Int32)}
     */
    static REQ_READ_NEXT => 134217733
}
