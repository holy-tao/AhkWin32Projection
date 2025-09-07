#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_TASK_TRANSITION{

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_NONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_TURNSTILE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_SLIDE => 3

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_SWIVEL => 4

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_READERBOARD => 5

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_CUSTOM => 6

    /**
     * @type {Integer (Int32)}
     */
    static PM_TASK_TRANSITION_INVALID => 7
}
