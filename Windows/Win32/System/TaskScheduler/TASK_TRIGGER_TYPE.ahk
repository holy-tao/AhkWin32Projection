#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the types of triggers associated with a task.
 * @remarks
 * 
  * The constants defined here are used in the <b>TriggerType</b> member of the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mstask/ne-mstask-task_trigger_type
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class TASK_TRIGGER_TYPE{

    /**
     * Trigger is set to run the task a single time. 
 * 
 * 
 * 
 * 
 * When this value is specified, the <b>Type</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure is ignored.
     * @type {Integer (Int32)}
     */
    static TASK_TIME_TRIGGER_ONCE => 0

    /**
     * Trigger is set to run the task on a daily interval. 
 * 
 * 
 * 
 * 
 * When this value is specified, the 
 * <b>DAILY</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> structure is used.
     * @type {Integer (Int32)}
     */
    static TASK_TIME_TRIGGER_DAILY => 1

    /**
     * Trigger is set to run the work item on specific days of a specific week of a specific month. 
 * 
 * 
 * 
 * 
 * When this value is specified, the 
 * <b>WEEKLY</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> structure is used.
     * @type {Integer (Int32)}
     */
    static TASK_TIME_TRIGGER_WEEKLY => 2

    /**
     * Trigger is set to run the task on a specific day(s) of the month. 
 * 
 * 
 * 
 * 
 * When this value is specified, the 
 * <b>MONTHLYDATE</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> structure is used.
     * @type {Integer (Int32)}
     */
    static TASK_TIME_TRIGGER_MONTHLYDATE => 3

    /**
     * Trigger is set to run the task on specific days, weeks, and months. 
 * 
 * 
 * 
 * 
 * When this value is specified, the 
 * <b>MONTHLYDOW</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> structure is used.
     * @type {Integer (Int32)}
     */
    static TASK_TIME_TRIGGER_MONTHLYDOW => 4

    /**
     * Trigger is set to run the task if the system remains idle for the amount of time specified by the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/i">idle wait time</a> of the task. 
 * 
 * 
 * 
 * 
 * When this value is specified, the <b>wStartHour</b>, <b>wStartMinute</b>, and <b>Type</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure are ignored.
     * @type {Integer (Int32)}
     */
    static TASK_EVENT_TRIGGER_ON_IDLE => 5

    /**
     * Trigger is set to run the task at system startup. 
 * 
 * 
 * 
 * 
 * When this value is specified, the <b>Type</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure is ignored.
     * @type {Integer (Int32)}
     */
    static TASK_EVENT_TRIGGER_AT_SYSTEMSTART => 6

    /**
     * Trigger is set to run the task when a user logs on. 
 * 
 * 
 * 
 * 
 * When this value is specified, the <b>Type</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure is ignored.
     * @type {Integer (Int32)}
     */
    static TASK_EVENT_TRIGGER_AT_LOGON => 7
}
