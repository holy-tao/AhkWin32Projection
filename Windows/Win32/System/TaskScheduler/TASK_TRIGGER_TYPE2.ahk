#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of triggers that can be used by tasks.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/ne-taskschd-task_trigger_type2
 * @namespace Windows.Win32.System.TaskScheduler
 */
class TASK_TRIGGER_TYPE2 extends Win32Enum {

    /**
     * Triggers the task when a specific event occurs. For more information about event triggers, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ieventtrigger">IEventTrigger</a>.
     * Native name: TASK_TRIGGER_EVENT
     * @type {Integer (Int32)}
     */
    static EVENT => 0

    /**
     * Triggers the task at a specific time of day. For more information about time triggers, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itimetrigger">ITimeTrigger</a>.
     * Native name: TASK_TRIGGER_TIME
     * @type {Integer (Int32)}
     */
    static TIME => 1

    /**
     * Triggers the task on a daily schedule. For example, the task starts at a specific time every day, every other day, or every third day. For more information about daily triggers, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-idailytrigger">IDailyTrigger</a>.
     * Native name: TASK_TRIGGER_DAILY
     * @type {Integer (Int32)}
     */
    static DAILY => 2

    /**
     * Triggers the task on a weekly schedule. For example, the task starts at 8:00 AM on a specific day every week or other week.  For more information about weekly triggers, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iweeklytrigger">IWeeklyTrigger</a>.
     * Native name: TASK_TRIGGER_WEEKLY
     * @type {Integer (Int32)}
     */
    static WEEKLY => 3

    /**
     * Triggers the task on a monthly schedule. For example, the task starts on specific days of specific months. For more information about monthly triggers, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-imonthlytrigger">IMonthlyTrigger</a>.
     * Native name: TASK_TRIGGER_MONTHLY
     * @type {Integer (Int32)}
     */
    static MONTHLY => 4

    /**
     * Triggers the task on a monthly day-of-week schedule. For example, the task starts on a specific   days of the week, weeks of the  month, and months of the year. For more information about monthly day-of-week triggers, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-imonthlydowtrigger">IMonthlyDOWTrigger</a>.
     * Native name: TASK_TRIGGER_MONTHLYDOW
     * @type {Integer (Int32)}
     */
    static MONTHLYDOW => 5

    /**
     * Triggers the task when the computer goes into an idle state. For more information about idle triggers, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iidletrigger">IIdleTrigger</a>.
     * Native name: TASK_TRIGGER_IDLE
     * @type {Integer (Int32)}
     */
    static IDLE => 6

    /**
     * Triggers the task when the task is registered. For more information about registration triggers, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iregistrationtrigger">IRegistrationTrigger</a>.
     * Native name: TASK_TRIGGER_REGISTRATION
     * @type {Integer (Int32)}
     */
    static REGISTRATION => 7

    /**
     * Triggers the task when the computer boots.  For more information about boot triggers, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iboottrigger">IBootTrigger</a>.
     * Native name: TASK_TRIGGER_BOOT
     * @type {Integer (Int32)}
     */
    static BOOT => 8

    /**
     * Triggers the task when a specific user logs on.  For more information about logon triggers, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-ilogontrigger">ILogonTrigger</a>.
     * Native name: TASK_TRIGGER_LOGON
     * @type {Integer (Int32)}
     */
    static LOGON => 9

    /**
     * Triggers the task when a specific user session state changes.  For more information about session state change triggers, see <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-isessionstatechangetrigger">ISessionStateChangeTrigger</a>.
     * Native name: TASK_TRIGGER_SESSION_STATE_CHANGE
     * @type {Integer (Int32)}
     */
    static SESSION_STATE_CHANGE => 11

    /**
     * Native name: TASK_TRIGGER_CUSTOM_TRIGGER_01
     * @type {Integer (Int32)}
     */
    static CUSTOM_TRIGGER_01 => 12
}
