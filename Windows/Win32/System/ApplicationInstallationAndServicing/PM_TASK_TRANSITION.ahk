#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_TASK_TRANSITION extends Win32Enum {

    /**
     * Native name: PM_TASK_TRANSITION_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: PM_TASK_TRANSITION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 1

    /**
     * Native name: PM_TASK_TRANSITION_TURNSTILE
     * @type {Integer (Int32)}
     */
    static TURNSTILE => 2

    /**
     * Native name: PM_TASK_TRANSITION_SLIDE
     * @type {Integer (Int32)}
     */
    static SLIDE => 3

    /**
     * Native name: PM_TASK_TRANSITION_SWIVEL
     * @type {Integer (Int32)}
     */
    static SWIVEL => 4

    /**
     * Native name: PM_TASK_TRANSITION_READERBOARD
     * @type {Integer (Int32)}
     */
    static READERBOARD => 5

    /**
     * Native name: PM_TASK_TRANSITION_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => 6

    /**
     * Native name: PM_TASK_TRANSITION_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 7
}
