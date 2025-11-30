#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class CASTING_CONNECTION_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_STATE_DISCONNECTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_STATE_CONNECTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_STATE_RENDERING => 2

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_STATE_DISCONNECTING => 3

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_STATE_CONNECTING => 4
}
