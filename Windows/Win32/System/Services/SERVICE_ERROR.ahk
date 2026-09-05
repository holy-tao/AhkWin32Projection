#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class SERVICE_ERROR extends Win32Enum {

    /**
     * Native name: SERVICE_ERROR_CRITICAL
     * @type {Integer (UInt32)}
     */
    static CRITICAL => 3

    /**
     * Native name: SERVICE_ERROR_IGNORE
     * @type {Integer (UInt32)}
     */
    static IGNORE => 0

    /**
     * Native name: SERVICE_ERROR_NORMAL
     * @type {Integer (UInt32)}
     */
    static NORMAL => 1

    /**
     * Native name: SERVICE_ERROR_SEVERE
     * @type {Integer (UInt32)}
     */
    static SEVERE => 2
}
