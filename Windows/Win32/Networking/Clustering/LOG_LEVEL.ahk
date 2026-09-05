#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the severity of the log event passed to the LogEvent callback function.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-log_level
 * @namespace Windows.Win32.Networking.Clustering
 */
class LOG_LEVEL extends Win32Enum {

    /**
     * The event is informational.
     * Native name: LOG_INFORMATION
     * @type {Integer (Int32)}
     */
    static INFORMATION => 0

    /**
     * The event is reporting a failure that might have happened, but it is uncertain whether a failure really did 
     *       occur.
     * Native name: LOG_WARNING
     * @type {Integer (Int32)}
     */
    static WARNING => 1

    /**
     * The event affects a single component, but other components are not affected and the integrity of the rest 
     *       of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> is not compromised.
     * Native name: LOG_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 2

    /**
     * The event is reporting a severe failure that affects multiple components, or the integrity of the entire 
     *       system is compromised or believed to be compromised.
     * Native name: LOG_SEVERE
     * @type {Integer (Int32)}
     */
    static SEVERE => 3
}
