#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_LLCP_SOCKET_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ConnectionOriented => 0

    /**
     * @type {Integer (Int32)}
     */
    static Connectionless => 1
}
