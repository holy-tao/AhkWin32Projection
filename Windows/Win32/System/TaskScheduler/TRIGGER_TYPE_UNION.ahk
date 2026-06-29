#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MONTHLYDATE.ahk" { MONTHLYDATE }
#Import ".\WEEKLY.ahk" { WEEKLY }
#Import ".\MONTHLYDOW.ahk" { MONTHLYDOW }
#Import ".\DAILY.ahk" { DAILY }

/**
 * Defines the invocation schedule of the trigger within the Type member of a TASK_TRIGGER structure.
 * @remarks
 * The <b>TriggerType</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure defines which fields of this union are used.
 * @see https://learn.microsoft.com/windows/win32/api/mstask/ns-mstask-trigger_type_union
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct TRIGGER_TYPE_UNION {
    #StructPack 4

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-daily">DAILY</a> structure that specifies the number of days between invocations of a task.
     */
    Daily : DAILY

    static __New() {
        DefineProp(this.Prototype, 'Weekly', { type: WEEKLY, offset: 0 })
        DefineProp(this.Prototype, 'MonthlyDate', { type: MONTHLYDATE, offset: 0 })
        DefineProp(this.Prototype, 'MonthlyDOW', { type: MONTHLYDOW, offset: 0 })
        this.DeleteProp("__New")
    }
}
