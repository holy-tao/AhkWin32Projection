#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Credentials
 */
class SCARD_STATE extends Win32Enum {

    /**
     * Native name: SCARD_STATE_UNAWARE
     * @type {Integer (UInt32)}
     */
    static UNAWARE => 0

    /**
     * Native name: SCARD_STATE_IGNORE
     * @type {Integer (UInt32)}
     */
    static IGNORE => 1

    /**
     * Native name: SCARD_STATE_UNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static UNAVAILABLE => 8

    /**
     * Native name: SCARD_STATE_EMPTY
     * @type {Integer (UInt32)}
     */
    static EMPTY => 16

    /**
     * Native name: SCARD_STATE_PRESENT
     * @type {Integer (UInt32)}
     */
    static PRESENT => 32

    /**
     * Native name: SCARD_STATE_ATRMATCH
     * @type {Integer (UInt32)}
     */
    static ATRMATCH => 64

    /**
     * Native name: SCARD_STATE_EXCLUSIVE
     * @type {Integer (UInt32)}
     */
    static EXCLUSIVE => 128

    /**
     * Native name: SCARD_STATE_INUSE
     * @type {Integer (UInt32)}
     */
    static INUSE => 256

    /**
     * Native name: SCARD_STATE_MUTE
     * @type {Integer (UInt32)}
     */
    static MUTE => 512

    /**
     * Native name: SCARD_STATE_CHANGED
     * @type {Integer (UInt32)}
     */
    static CHANGED => 2

    /**
     * Native name: SCARD_STATE_UNKNOWN
     * @type {Integer (UInt32)}
     */
    static UNKNOWN => 4
}
