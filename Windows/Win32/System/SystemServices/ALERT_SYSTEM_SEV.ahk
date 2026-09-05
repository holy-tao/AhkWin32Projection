#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class ALERT_SYSTEM_SEV extends Win32Enum {

    /**
     * Native name: ALERT_SYSTEM_INFORMATIONAL
     * @type {Integer (UInt32)}
     */
    static INFORMATIONAL => 1

    /**
     * Native name: ALERT_SYSTEM_WARNING
     * @type {Integer (UInt32)}
     */
    static WARNING => 2

    /**
     * Native name: ALERT_SYSTEM_ERROR
     * @type {Integer (UInt32)}
     */
    static ERROR => 3

    /**
     * Native name: ALERT_SYSTEM_QUERY
     * @type {Integer (UInt32)}
     */
    static QUERY => 4

    /**
     * Native name: ALERT_SYSTEM_CRITICAL
     * @type {Integer (UInt32)}
     */
    static CRITICAL => 5
}
