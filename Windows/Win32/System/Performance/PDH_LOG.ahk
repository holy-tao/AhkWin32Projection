#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 */
class PDH_LOG extends Win32Enum {

    /**
     * Native name: PDH_LOG_READ_ACCESS
     * @type {Integer (UInt32)}
     */
    static READ_ACCESS => 65536

    /**
     * Native name: PDH_LOG_WRITE_ACCESS
     * @type {Integer (UInt32)}
     */
    static WRITE_ACCESS => 131072

    /**
     * Native name: PDH_LOG_UPDATE_ACCESS
     * @type {Integer (UInt32)}
     */
    static UPDATE_ACCESS => 262144
}
