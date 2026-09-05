#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the state of screen auto-rotation for the system. For example, whether auto-rotation is supported, and whether it is enabled by the user.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-ar_state
 * @namespace Windows.Win32.Devices.Display
 */
class AR_STATE extends Win32BitflagEnum {

    /**
     * Auto-rotation is enabled by the user.
     * Native name: AR_ENABLED
     * @type {Integer (Int32)}
     */
    static ENABLED => 0

    /**
     * Auto-rotation is disabled by the user.
     * Native name: AR_DISABLED
     * @type {Integer (Int32)}
     */
    static DISABLED => 1

    /**
     * Auto-rotation is currently suppressed by one or more process auto-rotation preferences.
     * Native name: AR_SUPPRESSED
     * @type {Integer (Int32)}
     */
    static SUPPRESSED => 2

    /**
     * The session is remote, and auto-rotation is temporarily disabled as a result.
     * Native name: AR_REMOTESESSION
     * @type {Integer (Int32)}
     */
    static REMOTESESSION => 4

    /**
     * The system has multiple monitors attached, and auto-rotation is temporarily disabled as a result.
     * Native name: AR_MULTIMON
     * @type {Integer (Int32)}
     */
    static MULTIMON => 8

    /**
     * The system does not have an auto-rotation sensor.
     * Native name: AR_NOSENSOR
     * @type {Integer (Int32)}
     */
    static NOSENSOR => 16

    /**
     * Auto-rotation is not supported with the current system configuration.
     * Native name: AR_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static NOT_SUPPORTED => 32

    /**
     * The device is docked, and auto-rotation is temporarily disabled as a result.
     * Native name: AR_DOCKED
     * @type {Integer (Int32)}
     */
    static DOCKED => 64

    /**
     * The device is in laptop mode, and auto-rotation is temporarily disabled as a result.
     * Native name: AR_LAPTOP
     * @type {Integer (Int32)}
     */
    static LAPTOP => 128
}
