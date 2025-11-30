#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PDH_LOG extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_READ_ACCESS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_WRITE_ACCESS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PDH_LOG_UPDATE_ACCESS => 262144
}
