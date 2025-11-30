#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_NOTIFY extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_CREATED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_CONTINUE_PENDING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_DELETE_PENDING => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_DELETED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_PAUSE_PENDING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_PAUSED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_RUNNING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_START_PENDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_STOP_PENDING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_STOPPED => 1
}
