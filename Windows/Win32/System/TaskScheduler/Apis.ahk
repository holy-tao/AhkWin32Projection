#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class TaskScheduler {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_SUNDAY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_MONDAY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_TUESDAY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_WEDNESDAY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_THURSDAY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FRIDAY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_SATURDAY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FIRST_WEEK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_SECOND_WEEK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_THIRD_WEEK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FOURTH_WEEK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_LAST_WEEK => 5

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_JANUARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FEBRUARY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_MARCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_APRIL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_MAY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_JUNE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_JULY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_AUGUST => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_SEPTEMBER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_OCTOBER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_NOVEMBER => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_DECEMBER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_INTERACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_DELETE_WHEN_DONE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_DISABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_START_ONLY_IF_IDLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_KILL_ON_IDLE_END => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_DONT_START_IF_ON_BATTERIES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_KILL_IF_GOING_ON_BATTERIES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_RUN_ONLY_IF_DOCKED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_HIDDEN => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_RUN_IF_CONNECTED_TO_INTERNET => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_RESTART_ON_IDLE_RESUME => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_SYSTEM_REQUIRED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_FLAG_RUN_ONLY_IF_LOGGED_ON => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_TRIGGER_FLAG_HAS_END_DATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_TRIGGER_FLAG_KILL_AT_DURATION_END => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_TRIGGER_FLAG_DISABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TASK_MAX_RUN_TIMES => 1440

    /**
     * @type {String}
     */
    static CLSID_CTask => "{148bd520-a2ab-11ce-b11f-00aa00530503}"

    /**
     * @type {String}
     */
    static CLSID_CTaskScheduler => "{148bd52a-a2ab-11ce-b11f-00aa00530503}"
;@endregion Constants

;@region Methods
;@endregion Methods
}
