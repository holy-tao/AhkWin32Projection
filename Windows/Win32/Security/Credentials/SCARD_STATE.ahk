#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class SCARD_STATE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_UNAWARE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_IGNORE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_UNAVAILABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_EMPTY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_PRESENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_ATRMATCH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_EXCLUSIVE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_INUSE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_MUTE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_CHANGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCARD_STATE_UNKNOWN => 4
}
