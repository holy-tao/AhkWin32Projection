#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the interval, in days, at which a task is run.
 * @remarks
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> union uses an instance of this structure as part of the <b>Type</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure definition.
 * @see https://learn.microsoft.com/windows/win32/api/mstask/ns-mstask-daily
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct DAILY {
    #StructPack 2

    /**
     * Specifies the number of days between task runs.
     */
    DaysInterval : UInt16

}
