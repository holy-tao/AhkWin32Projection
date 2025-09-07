#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the state of screen auto-rotation for the system. For example, whether auto-rotation is supported, and whether it is enabled by the user.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-ar_state
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class AR_STATE{

    /**
     * Auto-rotation is enabled by the user.
     * @type {Integer (Int32)}
     */
    static AR_ENABLED => 0

    /**
     * Auto-rotation is disabled by the user.
     * @type {Integer (Int32)}
     */
    static AR_DISABLED => 1

    /**
     * Auto-rotation is currently suppressed by one or more process auto-rotation preferences.
     * @type {Integer (Int32)}
     */
    static AR_SUPPRESSED => 2

    /**
     * The session is remote, and auto-rotation is temporarily disabled as a result.
     * @type {Integer (Int32)}
     */
    static AR_REMOTESESSION => 4

    /**
     * The system has multiple monitors attached, and auto-rotation is temporarily disabled as a result.
     * @type {Integer (Int32)}
     */
    static AR_MULTIMON => 8

    /**
     * The system does not have an auto-rotation sensor.
     * @type {Integer (Int32)}
     */
    static AR_NOSENSOR => 16

    /**
     * Auto-rotation is not supported with the current system configuration.
     * @type {Integer (Int32)}
     */
    static AR_NOT_SUPPORTED => 32

    /**
     * The device is docked, and auto-rotation is temporarily disabled as a result.
     * @type {Integer (Int32)}
     */
    static AR_DOCKED => 64

    /**
     * The device is in laptop mode, and auto-rotation is temporarily disabled as a result.
     * @type {Integer (Int32)}
     */
    static AR_LAPTOP => 128
}
