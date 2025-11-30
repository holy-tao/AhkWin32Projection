#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class INTERNET_ACCESS_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPEN_TYPE_DIRECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPEN_TYPE_PRECONFIG => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_OPEN_TYPE_PROXY => 3
}
