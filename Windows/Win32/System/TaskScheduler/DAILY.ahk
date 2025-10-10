#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the interval, in days, at which a task is run.
 * @remarks
 * 
  *  The 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> union uses an instance of this structure as part of the <b>Type</b> member of the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure definition.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mstask/ns-mstask-daily
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class DAILY extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * Specifies the number of days between task runs.
     * @type {Integer}
     */
    DaysInterval {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
