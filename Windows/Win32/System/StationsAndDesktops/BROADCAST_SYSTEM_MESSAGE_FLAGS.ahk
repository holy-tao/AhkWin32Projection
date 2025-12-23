#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.StationsAndDesktops
 * @version v4.0.30319
 */
class BROADCAST_SYSTEM_MESSAGE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_ALLOWSFW => 128

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_FLUSHDISK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_FORCEIFHUNG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_IGNORECURRENTTASK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_NOHANG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_NOTIMEOUTIFNOTHUNG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_POSTMESSAGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_QUERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_SENDNOTIFYMESSAGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_LUID => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static BSF_RETURNHDESK => 512
}
