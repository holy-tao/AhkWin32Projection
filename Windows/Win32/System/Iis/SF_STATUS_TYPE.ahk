#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class SF_STATUS_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SF_STATUS_REQ_FINISHED => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static SF_STATUS_REQ_FINISHED_KEEP_CONN => 134217729

    /**
     * @type {Integer (Int32)}
     */
    static SF_STATUS_REQ_NEXT_NOTIFICATION => 134217730

    /**
     * @type {Integer (Int32)}
     */
    static SF_STATUS_REQ_HANDLED_NOTIFICATION => 134217731

    /**
     * @type {Integer (Int32)}
     */
    static SF_STATUS_REQ_ERROR => 134217732

    /**
     * @type {Integer (Int32)}
     */
    static SF_STATUS_REQ_READ_NEXT => 134217733
}
