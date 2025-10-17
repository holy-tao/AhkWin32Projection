#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DAILY.ahk
#Include .\WEEKLY.ahk
#Include .\MONTHLYDATE.ahk
#Include .\MONTHLYDOW.ahk

/**
 * Defines the invocation schedule of the trigger within the Type member of a TASK_TRIGGER structure.
 * @remarks
 * 
  * The <b>TriggerType</b> member of the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure defines which fields of this union are used.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mstask/ns-mstask-trigger_type_union
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class TRIGGER_TYPE_UNION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-daily">DAILY</a> structure that specifies the number of days between invocations of a task.
     * @type {DAILY}
     */
    Daily{
        get {
            if(!this.HasProp("__Daily"))
                this.__Daily := DAILY(0, this)
            return this.__Daily
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-weekly">WEEKLY</a> structure that specifies the number of weeks between invocations of a task, and day(s) of the week the task will run.
     * @type {WEEKLY}
     */
    Weekly{
        get {
            if(!this.HasProp("__Weekly"))
                this.__Weekly := WEEKLY(0, this)
            return this.__Weekly
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-monthlydate">MONTHLYDATE</a> structure that specifies the month(s) and day(s) of the month a task will run.
     * @type {MONTHLYDATE}
     */
    MonthlyDate{
        get {
            if(!this.HasProp("__MonthlyDate"))
                this.__MonthlyDate := MONTHLYDATE(0, this)
            return this.__MonthlyDate
        }
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-monthlydow">MONTHLYDOW</a> structure that specifies the day(s) of the year a task runs by month(s), week of month, and day(s) of week.
     * @type {MONTHLYDOW}
     */
    MonthlyDOW{
        get {
            if(!this.HasProp("__MonthlyDOW"))
                this.__MonthlyDOW := MONTHLYDOW(0, this)
            return this.__MonthlyDOW
        }
    }
}
