#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 */
class CASTING_CONNECTION_ERROR_STATUS extends Win32Enum {

    /**
     * Native name: CASTING_CONNECTION_ERROR_STATUS_SUCCEEDED
     * @type {Integer (Int32)}
     */
    static SUCCEEDED => 0

    /**
     * Native name: CASTING_CONNECTION_ERROR_STATUS_DEVICE_DID_NOT_RESPOND
     * @type {Integer (Int32)}
     */
    static DEVICE_DID_NOT_RESPOND => 1

    /**
     * Native name: CASTING_CONNECTION_ERROR_STATUS_DEVICE_ERROR
     * @type {Integer (Int32)}
     */
    static DEVICE_ERROR => 2

    /**
     * Native name: CASTING_CONNECTION_ERROR_STATUS_DEVICE_LOCKED
     * @type {Integer (Int32)}
     */
    static DEVICE_LOCKED => 3

    /**
     * Native name: CASTING_CONNECTION_ERROR_STATUS_PROTECTED_PLAYBACK_FAILED
     * @type {Integer (Int32)}
     */
    static PROTECTED_PLAYBACK_FAILED => 4

    /**
     * Native name: CASTING_CONNECTION_ERROR_STATUS_INVALID_CASTING_SOURCE
     * @type {Integer (Int32)}
     */
    static INVALID_CASTING_SOURCE => 5

    /**
     * Native name: CASTING_CONNECTION_ERROR_STATUS_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 6
}
