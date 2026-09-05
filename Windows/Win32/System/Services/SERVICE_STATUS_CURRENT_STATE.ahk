#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Services
 */
class SERVICE_STATUS_CURRENT_STATE extends Win32Enum {

    /**
     * Native name: SERVICE_CONTINUE_PENDING
     * @type {Integer (UInt32)}
     */
    static CONTINUE_PENDING => 5

    /**
     * Native name: SERVICE_PAUSE_PENDING
     * @type {Integer (UInt32)}
     */
    static PAUSE_PENDING => 6

    /**
     * Native name: SERVICE_PAUSED
     * @type {Integer (UInt32)}
     */
    static PAUSED => 7

    /**
     * Native name: SERVICE_RUNNING
     * @type {Integer (UInt32)}
     */
    static RUNNING => 4

    /**
     * Native name: SERVICE_START_PENDING
     * @type {Integer (UInt32)}
     */
    static START_PENDING => 2

    /**
     * Native name: SERVICE_STOP_PENDING
     * @type {Integer (UInt32)}
     */
    static STOP_PENDING => 3

    /**
     * Native name: SERVICE_STOPPED
     * @type {Integer (UInt32)}
     */
    static STOPPED => 1
}
