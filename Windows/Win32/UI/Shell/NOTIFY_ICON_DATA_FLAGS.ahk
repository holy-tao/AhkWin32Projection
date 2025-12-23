#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class NOTIFY_ICON_DATA_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_MESSAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_ICON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_TIP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_STATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_INFO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_GUID => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_REALTIME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NIF_SHOWTIP => 128
}
