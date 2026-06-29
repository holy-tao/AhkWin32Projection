#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines what versions of Task Scheduler or the AT command that the task is compatible with.
 * @remarks
 * Task compatibility, which is set through the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_compatibility">Compatibility</a> property, should only be set to TASK_COMPATIBILITY_V1 if a task needs to be accessed or modified from a  Windows XP, Windows Server 2003, or Windows 2000 computer. Otherwise, it is recommended that Task Scheduler 2.0 compatibility be used because the task will have more features.
 * 
 * Once the task <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_compatibility">Compatibility</a> property is set to TASK_COMPATIBILITY_V2 and the task is registered, then the task <b>Compatibility</b> property cannot be changed to TASK_COMPATIBILITY_V1.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_compatibility
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct TASK_COMPATIBILITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The task is compatible with the AT command.
     * @type {Integer (Int32)}
     */
    static TASK_COMPATIBILITY_AT => 0

    /**
     * The task is compatible with Task Scheduler 1.0.
     * @type {Integer (Int32)}
     */
    static TASK_COMPATIBILITY_V1 => 1

    /**
     * The task is compatible with Task Scheduler 2.0.
     * @type {Integer (Int32)}
     */
    static TASK_COMPATIBILITY_V2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static TASK_COMPATIBILITY_V2_1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static TASK_COMPATIBILITY_V2_2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static TASK_COMPATIBILITY_V2_3 => 5

    /**
     * @type {Integer (Int32)}
     */
    static TASK_COMPATIBILITY_V2_4 => 6
}
