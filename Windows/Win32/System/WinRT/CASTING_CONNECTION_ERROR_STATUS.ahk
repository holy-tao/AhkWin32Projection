#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class CASTING_CONNECTION_ERROR_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_SUCCEEDED => 0

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_DEVICE_DID_NOT_RESPOND => 1

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_DEVICE_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_DEVICE_LOCKED => 3

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_PROTECTED_PLAYBACK_FAILED => 4

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_INVALID_CASTING_SOURCE => 5

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_UNKNOWN => 6
}
