#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSA_COMPATIBILITY_BEHAVIOR_ID extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WsaBehaviorAll => 0

    /**
     * @type {Integer (Int32)}
     */
    static WsaBehaviorReceiveBuffering => 1

    /**
     * @type {Integer (Int32)}
     */
    static WsaBehaviorAutoTuning => 2
}
