#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_STATUS_CURRENT_STATE{

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTINUE_PENDING => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_PAUSE_PENDING => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_PAUSED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_RUNNING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_START_PENDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_PENDING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOPPED => 1
}
