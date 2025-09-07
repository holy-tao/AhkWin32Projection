#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the interval, in weeks, between invocations of a task.
 * @remarks
 * The 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> union uses an instance of this structure as part of the <b>Type</b> member of the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure definition.
  * 
  * The following C++ shows how to  combine the <b>rgfDaysOfTheWeek</b> flags. The example runs a task on every other Sunday, Wednesday, and Friday.
  * 
  * 
  * ```cpp
  * WEEKLY example;
  * example.WeeksInterval = 2;
  * example.rgfDaysOfTheWeek = TASK_SUNDAY | TASK_WEDNESDAY | TASK_FRIDAY;
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/mstask/ns-mstask-weekly
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class WEEKLY extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Number of weeks between invocations of a task.
     * @type {Integer}
     */
    WeeksInterval {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Value that describes the days of the week the task runs. This value is a bitfield and is a combination of the following flags. See Remarks for an example of specifying multiple flags. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_SUNDAY"></a><a id="task_sunday"></a><dl>
     * <dt><b>TASK_SUNDAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run on Sunday.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_MONDAY"></a><a id="task_monday"></a><dl>
     * <dt><b>TASK_MONDAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run on Monday.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_TUESDAY"></a><a id="task_tuesday"></a><dl>
     * <dt><b>TASK_TUESDAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run on Tuesday.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_WEDNESDAY"></a><a id="task_wednesday"></a><dl>
     * <dt><b>TASK_WEDNESDAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run on Wednesday.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_THURSDAY"></a><a id="task_thursday"></a><dl>
     * <dt><b>TASK_THURSDAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run on Thursday.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_FRIDAY"></a><a id="task_friday"></a><dl>
     * <dt><b>TASK_FRIDAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run on Friday.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_SATURDAY"></a><a id="task_saturday"></a><dl>
     * <dt><b>TASK_SATURDAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run on Saturday.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    rgfDaysOfTheWeek {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
