#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WEEKLY.ahk
#Include .\MONTHLYDATE.ahk
#Include .\MONTHLYDOW.ahk
#Include .\TRIGGER_TYPE_UNION.ahk

/**
 * Defines the times to run a scheduled work item.
 * @remarks
 * These times may include the start time, end time, duration, and modification flags for the work item. Note that when setting a trigger, the beginning day month and year must be set.
  * 
  * <div class="alert"><b>Note</b>  A scheduled work item can have one or more triggers defined. The times that the work item will run is the union of all the triggers defined for that item.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/mstask/ns-mstask-task_trigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class TASK_TRIGGER extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Size of this structure, in bytes.
     * @type {Integer}
     */
    cbTriggerSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * For internal use only; this value must be zero.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Year that the task trigger activates. This value must be four digits (1997, not 97). The beginning year must be specified when setting a task.
     * @type {Integer}
     */
    wBeginYear {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Month of the year (specified in the <b>wBeginYear</b> member) that the task trigger activates. The beginning month must be specified when setting a task.
     * @type {Integer}
     */
    wBeginMonth {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Day of the month (specified in the <b>wBeginMonth</b> member) that the task trigger activates. The beginning day must be specified when setting a task.
     * @type {Integer}
     */
    wBeginDay {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Year that the task trigger deactivates. This value must be four digits (1997, not 97).
     * @type {Integer}
     */
    wEndYear {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Month of the year (specified in the <b>wEndYear</b> member) that the task trigger deactivates.
     * @type {Integer}
     */
    wEndMonth {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * Day of the month (specified in the <b>wEndMonth</b> member) that the task trigger deactivates.
     * @type {Integer}
     */
    wEndDay {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * Hour of the day the task runs. This value is on a 24-hour clock; hours go from 00 to 23.
     * @type {Integer}
     */
    wStartHour {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Minute of the hour (specified in the <b>wStartHour</b> member) that the task runs.
     * @type {Integer}
     */
    wStartMinute {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * Number of minutes after the task starts that the trigger will remain active. The number of minutes specified here must be greater than or equal to the <b>MinutesInterval</b> setting. 
     * 
     * 
     * 
     * 
     * For example, if you start a task at 8:00 A.M. and want to repeatedly start the task until 5:00 P.M., there would be 540 minutes in the duration.
     * @type {Integer}
     */
    MinutesDuration {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Number of minutes between consecutive task executions. This number is counted from the start of the previous scheduled task. The number of minutes specified here must be less than the <b>MinutesDuration</b> setting. 
     * 
     * 
     * 
     * 
     * For example, to run a task every hour from 8:00 A.M. to 5:00 P.M., set this field to 60.
     * @type {Integer}
     */
    MinutesInterval {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Value that describes the behavior of the trigger. This value is a combination of the following flags.
     * @type {Integer}
     */
    rgFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ne-mstask-task_trigger_type">TASK_TRIGGER_TYPE</a> enumerated value that specifies the type of trigger. This member is used with <b>Type</b>. The type of trigger specified here determines which fields of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> specified in <b>Type</b> member will be used. Trigger type is based on when the trigger will run the task.
     * @type {Integer}
     */
    TriggerType {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> structure that specifies details about the trigger. Note that the <b>TriggerType</b> member determines which fields of the TRIGGER_TYPE_UNION union will be used.
     * @type {TRIGGER_TYPE_UNION}
     */
    Type{
        get {
            if(!this.HasProp("__Type"))
                this.__Type := TRIGGER_TYPE_UNION(this.ptr + 40)
            return this.__Type
        }
    }

    /**
     * For internal use only; this value must be zero.
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 64, "ushort")
        set => NumPut("ushort", value, this, 64)
    }

    /**
     * Not currently used.
     * @type {Integer}
     */
    wRandomMinutesInterval {
        get => NumGet(this, 66, "ushort")
        set => NumPut("ushort", value, this, 66)
    }
}
