#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class ALERT_SYSTEM_SEV extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static ALERT_SYSTEM_INFORMATIONAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ALERT_SYSTEM_WARNING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ALERT_SYSTEM_ERROR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ALERT_SYSTEM_QUERY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ALERT_SYSTEM_CRITICAL => 5
}
