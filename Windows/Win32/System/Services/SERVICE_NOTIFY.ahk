#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class SERVICE_NOTIFY extends Win32BitflagEnum {

    /**
     * Native name: SERVICE_NOTIFY_CREATED
     * @type {Integer (UInt32)}
     */
    static CREATED => 128

    /**
     * Native name: SERVICE_NOTIFY_CONTINUE_PENDING
     * @type {Integer (UInt32)}
     */
    static CONTINUE_PENDING => 16

    /**
     * Native name: SERVICE_NOTIFY_DELETE_PENDING
     * @type {Integer (UInt32)}
     */
    static DELETE_PENDING => 512

    /**
     * Native name: SERVICE_NOTIFY_DELETED
     * @type {Integer (UInt32)}
     */
    static DELETED => 256

    /**
     * Native name: SERVICE_NOTIFY_PAUSE_PENDING
     * @type {Integer (UInt32)}
     */
    static PAUSE_PENDING => 32

    /**
     * Native name: SERVICE_NOTIFY_PAUSED
     * @type {Integer (UInt32)}
     */
    static PAUSED => 64

    /**
     * Native name: SERVICE_NOTIFY_RUNNING
     * @type {Integer (UInt32)}
     */
    static RUNNING => 8

    /**
     * Native name: SERVICE_NOTIFY_START_PENDING
     * @type {Integer (UInt32)}
     */
    static START_PENDING => 2

    /**
     * Native name: SERVICE_NOTIFY_STOP_PENDING
     * @type {Integer (UInt32)}
     */
    static STOP_PENDING => 4

    /**
     * Native name: SERVICE_NOTIFY_STOPPED
     * @type {Integer (UInt32)}
     */
    static STOPPED => 1
}
