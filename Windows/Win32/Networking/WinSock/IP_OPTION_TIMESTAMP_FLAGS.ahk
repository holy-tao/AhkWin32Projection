#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class IP_OPTION_TIMESTAMP_FLAGS extends Win32Enum {

    /**
     * Native name: IP_OPTION_TIMESTAMP_ONLY
     * @type {Integer (Int32)}
     */
    static ONLY => 0

    /**
     * Native name: IP_OPTION_TIMESTAMP_ADDRESS
     * @type {Integer (Int32)}
     */
    static ADDRESS => 1

    /**
     * Native name: IP_OPTION_TIMESTAMP_SPECIFIC_ADDRESS
     * @type {Integer (Int32)}
     */
    static SPECIFIC_ADDRESS => 3
}
