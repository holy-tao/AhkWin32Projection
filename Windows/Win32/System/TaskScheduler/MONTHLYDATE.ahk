#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the day of the month the task will run.
 * @remarks
 * 
  *  The 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> union uses an instance of this structure as part of the <b>Type</b> member of the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure definition.
  * 
  * The following C++ example shows how to combine the flags.  The example runs a task quarterly.
  * 
  * 
  * ```cpp
  * MONTHLYDATE example;
  * example.rgfDays = 1;
  * example.rgfMonths = TASK_JANUARY | TASK_APRIL | TASK_JULY | TASK_OCTOBER;
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mstask/ns-mstask-monthlydate
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class MONTHLYDATE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the day of the month a task runs. This value is a bitfield that specifies the day(s) the task will run. Bit 0 corresponds to the first of the month, bit 1 to the second, and so forth.
     * @type {Integer}
     */
    rgfDays {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the month(s) when the task runs. This value is a combination of the following flags. See Remarks for an example of setting multiple flags.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_JANUARY"></a><a id="task_january"></a><dl>
     * <dt><b>TASK_JANUARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run in January.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_FEBRUARY"></a><a id="task_february"></a><dl>
     * <dt><b>TASK_FEBRUARY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run in February.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_MARCH"></a><a id="task_march"></a><dl>
     * <dt><b>TASK_MARCH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run in March.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_APRIL"></a><a id="task_april"></a><dl>
     * <dt><b>TASK_APRIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run in April.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_MAY"></a><a id="task_may"></a><dl>
     * <dt><b>TASK_MAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run in May.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_JUNE"></a><a id="task_june"></a><dl>
     * <dt><b>TASK_JUNE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run in June.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_JULY"></a><a id="task_july"></a><dl>
     * <dt><b>TASK_JULY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run in July.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_AUGUST"></a><a id="task_august"></a><dl>
     * <dt><b>TASK_AUGUST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run in August.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_SEPTEMBER"></a><a id="task_september"></a><dl>
     * <dt><b>TASK_SEPTEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run in September.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_OCTOBER"></a><a id="task_october"></a><dl>
     * <dt><b>TASK_OCTOBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run in October.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_NOVEMBER"></a><a id="task_november"></a><dl>
     * <dt><b>TASK_NOVEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run in November.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_DECEMBER"></a><a id="task_december"></a><dl>
     * <dt><b>TASK_DECEMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run in December.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    rgfMonths {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
