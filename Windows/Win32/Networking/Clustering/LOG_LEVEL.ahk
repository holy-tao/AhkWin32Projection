#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the severity of the log event passed to the LogEvent callback function.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-log_level
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class LOG_LEVEL{

    /**
     * The event is informational.
     * @type {Integer (Int32)}
     */
    static LOG_INFORMATION => 0

    /**
     * The event is reporting a failure that might have happened, but it is uncertain whether a failure really did 
 *       occur.
     * @type {Integer (Int32)}
     */
    static LOG_WARNING => 1

    /**
     * The event affects a single component, but other components are not affected and the integrity of the rest 
 *       of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> is not compromised.
     * @type {Integer (Int32)}
     */
    static LOG_ERROR => 2

    /**
     * The event is reporting a severe failure that affects multiple components, or the integrity of the entire 
 *       system is compromised or believed to be compromised.
     * @type {Integer (Int32)}
     */
    static LOG_SEVERE => 3
}
