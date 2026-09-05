#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class WSA_COMPATIBILITY_BEHAVIOR_ID extends Win32Enum {

    /**
     * Native name: WsaBehaviorAll
     * @type {Integer (Int32)}
     */
    static All => 0

    /**
     * Native name: WsaBehaviorReceiveBuffering
     * @type {Integer (Int32)}
     */
    static ReceiveBuffering => 1

    /**
     * Native name: WsaBehaviorAutoTuning
     * @type {Integer (Int32)}
     */
    static AutoTuning => 2
}
