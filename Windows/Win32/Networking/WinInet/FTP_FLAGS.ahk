#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class FTP_FLAGS extends Win32Enum {

    /**
     * Native name: FTP_TRANSFER_TYPE_ASCII
     * @type {Integer (UInt32)}
     */
    static TRANSFER_TYPE_ASCII => 1

    /**
     * Native name: FTP_TRANSFER_TYPE_BINARY
     * @type {Integer (UInt32)}
     */
    static TRANSFER_TYPE_BINARY => 2

    /**
     * Native name: FTP_TRANSFER_TYPE_UNKNOWN
     * @type {Integer (UInt32)}
     */
    static TRANSFER_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_TRANSFER_ASCII => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_FLAG_TRANSFER_BINARY => 2
}
