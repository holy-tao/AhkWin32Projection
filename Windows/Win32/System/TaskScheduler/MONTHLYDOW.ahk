#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the date(s) that the task runs by month, week, and day of the week.
 * @remarks
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-trigger_type_union">TRIGGER_TYPE_UNION</a> union uses an instance of this structure as part of the <b>Type</b> member of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/ns-mstask-task_trigger">TASK_TRIGGER</a> structure definition.
 * 
 * The following C++ example shows how to  combine these flags. The example runs a task on the Monday and the Friday of the third week of every third month.
 * 
 * 
 * ```cpp
 * MONTHLYDOW example;
 * example.wWhichWeek = TASK_THIRD_WEEK;
 * example.rgfDaysOfTheWeek = TASK_FRIDAY | TASK_MONDAY;
 * example.rgfMonths = TASK_JANUARY | TASK_APRIL | TASK_JULY | TASK_OCTOBER;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/mstask/ns-mstask-monthlydow
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class MONTHLYDOW extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * Specifies the week of the month when the task runs. This value is exclusive and is one of the following flags. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_FIRST_WEEK"></a><a id="task_first_week"></a><dl>
     * <dt><b>TASK_FIRST_WEEK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run between the first and seventh day of the month.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_SECOND_WEEK"></a><a id="task_second_week"></a><dl>
     * <dt><b>TASK_SECOND_WEEK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run between the eighth and 14<sup>th</sup> day of the month.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_THIRD_WEEK"></a><a id="task_third_week"></a><dl>
     * <dt><b>TASK_THIRD_WEEK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run between the 15<sup>th</sup> and 21<sup>st</sup> day of the month.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_FOURTH_WEEK"></a><a id="task_fourth_week"></a><dl>
     * <dt><b>TASK_FOURTH_WEEK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run between the 22<sup>nd</sup> and 28<sup>th</sup> of the month.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TASK_LAST_WEEK"></a><a id="task_last_week"></a><dl>
     * <dt><b>TASK_LAST_WEEK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will run between the last seven days of the month.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    wWhichWeek {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies the day(s) of the week (specified in <b>wWhichWeek</b>) when the task runs. This value is a combination of the following flags. 
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

    /**
     * Value that describes the month(s) when the task runs. This value is a combination of the following flags. 
     * 
     * 
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
