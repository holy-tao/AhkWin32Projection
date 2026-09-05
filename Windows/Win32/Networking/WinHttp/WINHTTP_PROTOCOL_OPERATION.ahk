#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
class WINHTTP_PROTOCOL_OPERATION extends Win32Enum {

    /**
     * Native name: WINHTTP_PROTOCOL_SEND_OPERATION
     * @type {Integer (Int32)}
     */
    static SEND_OPERATION => 0

    /**
     * Native name: WINHTTP_PROTOCOL_RECEIVE_OPERATION
     * @type {Integer (Int32)}
     */
    static RECEIVE_OPERATION => 1
}
