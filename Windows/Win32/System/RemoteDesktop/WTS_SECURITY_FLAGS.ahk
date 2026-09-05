#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WTS_SECURITY_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: WTS_SECURITY_CURRENT_GUEST_ACCESS
     * @type {Integer (UInt32)}
     */
    static CURRENT_GUEST_ACCESS => 72

    /**
     * Native name: WTS_SECURITY_USER_ACCESS
     * @type {Integer (UInt32)}
     */
    static USER_ACCESS => 329

    /**
     * Native name: WTS_SECURITY_CURRENT_USER_ACCESS
     * @type {Integer (UInt32)}
     */
    static CURRENT_USER_ACCESS => 590

    /**
     * Native name: WTS_SECURITY_ALL_ACCESS
     * @type {Integer (UInt32)}
     */
    static ALL_ACCESS => 983999

    /**
     * Native name: WTS_SECURITY_QUERY_INFORMATION
     * @type {Integer (UInt32)}
     */
    static QUERY_INFORMATION => 1

    /**
     * Native name: WTS_SECURITY_SET_INFORMATION
     * @type {Integer (UInt32)}
     */
    static SET_INFORMATION => 2

    /**
     * Native name: WTS_SECURITY_RESET
     * @type {Integer (UInt32)}
     */
    static RESET => 4

    /**
     * Native name: WTS_SECURITY_VIRTUAL_CHANNELS
     * @type {Integer (UInt32)}
     */
    static VIRTUAL_CHANNELS => 8

    /**
     * Native name: WTS_SECURITY_REMOTE_CONTROL
     * @type {Integer (UInt32)}
     */
    static REMOTE_CONTROL => 16

    /**
     * Native name: WTS_SECURITY_LOGON
     * @type {Integer (UInt32)}
     */
    static LOGON => 32

    /**
     * Native name: WTS_SECURITY_LOGOFF
     * @type {Integer (UInt32)}
     */
    static LOGOFF => 64

    /**
     * Native name: WTS_SECURITY_MESSAGE
     * @type {Integer (UInt32)}
     */
    static MESSAGE => 128

    /**
     * Native name: WTS_SECURITY_CONNECT
     * @type {Integer (UInt32)}
     */
    static CONNECT => 256

    /**
     * Native name: WTS_SECURITY_DISCONNECT
     * @type {Integer (UInt32)}
     */
    static DISCONNECT => 512

    /**
     * Native name: WTS_SECURITY_GUEST_ACCESS
     * @type {Integer (UInt32)}
     */
    static GUEST_ACCESS => 32
}
