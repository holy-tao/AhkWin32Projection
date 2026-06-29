#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class SERVICE_ERROR extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ERROR_CRITICAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ERROR_IGNORE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ERROR_NORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ERROR_SEVERE => 2
}
