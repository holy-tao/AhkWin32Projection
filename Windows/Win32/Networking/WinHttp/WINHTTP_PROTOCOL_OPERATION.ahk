#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROTOCOL_OPERATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WINHTTP_PROTOCOL_SEND_OPERATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static WINHTTP_PROTOCOL_RECEIVE_OPERATION => 1
}
