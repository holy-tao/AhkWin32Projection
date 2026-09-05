#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 */
class CASTING_CONNECTION_STATE extends Win32Enum {

    /**
     * Native name: CASTING_CONNECTION_STATE_DISCONNECTED
     * @type {Integer (Int32)}
     */
    static DISCONNECTED => 0

    /**
     * Native name: CASTING_CONNECTION_STATE_CONNECTED
     * @type {Integer (Int32)}
     */
    static CONNECTED => 1

    /**
     * Native name: CASTING_CONNECTION_STATE_RENDERING
     * @type {Integer (Int32)}
     */
    static RENDERING => 2

    /**
     * Native name: CASTING_CONNECTION_STATE_DISCONNECTING
     * @type {Integer (Int32)}
     */
    static DISCONNECTING => 3

    /**
     * Native name: CASTING_CONNECTION_STATE_CONNECTING
     * @type {Integer (Int32)}
     */
    static CONNECTING => 4
}
