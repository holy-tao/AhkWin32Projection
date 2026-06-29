#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TASK_TRIGGER_TYPE.ahk" { TASK_TRIGGER_TYPE }
#Import ".\TRIGGER_TYPE_UNION.ahk" { TRIGGER_TYPE_UNION }
#Import ".\MONTHLYDATE.ahk" { MONTHLYDATE }
#Import ".\WEEKLY.ahk" { WEEKLY }
#Import ".\MONTHLYDOW.ahk" { MONTHLYDOW }
#Import ".\DAILY.ahk" { DAILY }

/**
 * Defines the times to run a scheduled work item.
 * @remarks
 * These times may include the start time, end time, duration, and modification flags for the work item. Note that when setting a trigger, the beginning day month and year must be set.
 * 
 * <div class="alert"><b>Note</b>  A scheduled work item can have one or more triggers defined. The times that the work item will run is the union of all the triggers defined for that item.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/mstask/ns-mstask-task_trigger
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct TASK_TRIGGER {
    #StructPack 4

    /**
     * Size of this structure, in bytes.
     */
    cbTriggerSize : UInt16

    /**
     * For internal use only; this value must be zero.
     */
    Reserved1 : UInt16

    /**
     * Year that the task trigger activates. This value must be four digits (1997, not 97). The beginning year must be specified when setting a task.
     */
    wBeginYear : UInt16

    /**
     * Month of the year (specified in the <b>wBeginYear</b> member) that the task trigger activates. The beginning month must be specified when setting a task.
     */
    wBeginMonth : UInt16

    /**
     * Day of the month (specified in the <b>wBeginMonth</b> member) that the task trigger activates. The beginning day must be specified when setting a task.
     */
    wBeginDay : UInt16

    /**
     * Year that the task trigger deactivates. This value must be four digits (1997, not 97).
     */
    wEndYear : UInt16

    /**
     * Month of the year (specified in the <b>wEndYear</b> member) that the task trigger deactivates.
     */
    wEndMonth : UInt16

    /**
     * Day of the month (specified in the <b>wEndMonth</b> member) that the task trigger deactivates.
     */
    wEndDay : UInt16

    /**
     * Hour of the day the task runs. This value is on a 24-hour clock; hours go from 00 to 23.
     */
    wStartHour : UInt16

    /**
     * Minute of the hour (specified in the <b>wStartHour</b> member) that the task runs.
     */
    wStartMinute : UInt16

    /**
     * Number of minutes after the task starts that the trigger will remain active. The number of minutes specified here must be greater than or equal to the <b>MinutesInterval</b> setting. 
     * 
     * 
     * 
     * 
     * For example, if you start a task at 8:00 A.M. and want to repeatedly start the task until 5:00 P.M., there would be 540 minutes in the duration.
     */
    MinutesDuration : UInt32

    /**
     * Number of minutes between consecutive task executions. This number is counted from the start of the previous scheduled task. The number of minutes specified here must be less than the <b>MinutesDuration</b> setting. 
     * 
     * 
     * 
     * 
     * For example, to run a task every hour from 8:00 A.M. to 5:00 P.M., set this field to 60.
     */
    MinutesInterval : UInt32

    /**
     * Value that describes the behavior of the trigger. This value is a combination of the following flags.
     */
    rgFlags : UInt32

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ne-mstask-task_trigger_type">TASK_TRIGGER_TYPE</a> enumerated value that specifies the type of trigger. This member is used with <b>Type</b>. The type of trigger specified here determines which fields of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> specified in <b>Type</b> member will be used. Trigger type is based on when the trigger will run the task.
     */
    TriggerType : TASK_TRIGGER_TYPE

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> structure that specifies details about the trigger. Note that the <b>TriggerType</b> member determines which fields of the TRIGGER_TYPE_UNION union will be used.
     */
    Type : TRIGGER_TYPE_UNION

    /**
     * For internal use only; this value must be zero.
     */
    Reserved2 : UInt16

    /**
     * Not currently used.
     */
    wRandomMinutesInterval : UInt16

}
