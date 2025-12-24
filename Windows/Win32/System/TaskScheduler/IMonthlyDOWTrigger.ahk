#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a task on a monthly day-of-week schedule.
 * @remarks
 * 
 * The time of day that the task is started is set by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary">StartBoundary</a> property.
 * 
 * When reading or writing  XML for a task, a monthly day-of-week trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-schedulebymonthdayofweek-calendartriggertype-element">ScheduleByMonthDayOfWeek</a> element of the Task Scheduler schema.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-imonthlydowtrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IMonthlyDOWTrigger extends ITrigger{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMonthlyDOWTrigger
     * @type {Guid}
     */
    static IID => Guid("{77d025a3-90fa-43aa-b52e-cda5499b946a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DaysOfWeek", "put_DaysOfWeek", "get_WeeksOfMonth", "put_WeeksOfMonth", "get_MonthsOfYear", "put_MonthsOfYear", "get_RunOnLastWeekOfMonth", "put_RunOnLastWeekOfMonth", "get_RandomDelay", "put_RandomDelay"]

    /**
     */
    DaysOfWeek {
        get => this.get_DaysOfWeek()
        set => this.put_DaysOfWeek(value)
    }

    /**
     */
    WeeksOfMonth {
        get => this.get_WeeksOfMonth()
        set => this.put_WeeksOfMonth(value)
    }

    /**
     */
    MonthsOfYear {
        get => this.get_MonthsOfYear()
        set => this.put_MonthsOfYear(value)
    }

    /**
     */
    RunOnLastWeekOfMonth {
        get => this.get_RunOnLastWeekOfMonth()
        set => this.put_RunOnLastWeekOfMonth(value)
    }

    /**
     */
    RandomDelay {
        get => this.get_RandomDelay()
        set => this.put_RandomDelay(value)
    }

    /**
     * Gets or sets the days of the week during which the task runs.
     * @remarks
     * 
     * The following table shows the mapping of the bitwise mask used by this property.<table>
     * <tr>
     * <th>Day of Week</th>
     * <th>Hex Value</th>
     * <th>Decimal Value</th>
     * </tr>
     * <tr>
     * <td>Sunday</td>
     * <td>0X01</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>Monday</td>
     * <td>0x02</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>Tuesday</td>
     * <td>0X04</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>Wednesday</td>
     * <td>0X08</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>Thursday</td>
     * <td>0X10</td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>Friday</td>
     * <td>0X20</td>
     * <td>32</td>
     * </tr>
     * <tr>
     * <td>Saturday</td>
     * <td>0X40</td>
     * <td>64</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * When reading or writing XML for a task, the days of the week of a monthly day-of-week calendar are specified by the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-daysofweek-monthlydayofweekscheduletype-element">DaysOfWeek</a> element.
     * 
     * 
     * @param {Pointer<Integer>} pDays 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlydowtrigger-get_daysofweek
     */
    get_DaysOfWeek(pDays) {
        pDaysMarshal := pDays is VarRef ? "short*" : "ptr"

        result := ComCall(20, this, pDaysMarshal, pDays, "HRESULT")
        return result
    }

    /**
     * Gets or sets the days of the week during which the task runs.
     * @remarks
     * 
     * The following table shows the mapping of the bitwise mask used by this property.<table>
     * <tr>
     * <th>Day of Week</th>
     * <th>Hex Value</th>
     * <th>Decimal Value</th>
     * </tr>
     * <tr>
     * <td>Sunday</td>
     * <td>0X01</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>Monday</td>
     * <td>0x02</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>Tuesday</td>
     * <td>0X04</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>Wednesday</td>
     * <td>0X08</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>Thursday</td>
     * <td>0X10</td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>Friday</td>
     * <td>0X20</td>
     * <td>32</td>
     * </tr>
     * <tr>
     * <td>Saturday</td>
     * <td>0X40</td>
     * <td>64</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * When reading or writing XML for a task, the days of the week of a monthly day-of-week calendar are specified by the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-daysofweek-monthlydayofweekscheduletype-element">DaysOfWeek</a> element.
     * 
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlydowtrigger-put_daysofweek
     */
    put_DaysOfWeek(days) {
        result := ComCall(21, this, "short", days, "HRESULT")
        return result
    }

    /**
     * Gets or sets the weeks of the month during which the task runs.
     * @remarks
     * 
     * The following table shows the mapping of the bitwise mask used by this property. Note that you can explicitly specify the last week of the month, regardless  of what week it is, by specifying 0X10 (16).<table>
     * <tr>
     * <th>Week</th>
     * <th>Hex value</th>
     * <th>Decimal value</th>
     * </tr>
     * <tr>
     * <td>First</td>
     * <td>0X01</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>Second</td>
     * <td>0x02</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>Third</td>
     * <td>0X04</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>Fourth</td>
     * <td>0X08</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>Last</td>
     * <td>0X10</td>
     * <td>16</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * When reading or writing XML for a task, the weeks of the month of a monthly day-of-week calendar are specified by the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-weeks-monthlydayofweekscheduletype-element">Weeks</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<Integer>} pWeeks 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlydowtrigger-get_weeksofmonth
     */
    get_WeeksOfMonth(pWeeks) {
        pWeeksMarshal := pWeeks is VarRef ? "short*" : "ptr"

        result := ComCall(22, this, pWeeksMarshal, pWeeks, "HRESULT")
        return result
    }

    /**
     * Gets or sets the weeks of the month during which the task runs.
     * @remarks
     * 
     * The following table shows the mapping of the bitwise mask used by this property. Note that you can explicitly specify the last week of the month, regardless  of what week it is, by specifying 0X10 (16).<table>
     * <tr>
     * <th>Week</th>
     * <th>Hex value</th>
     * <th>Decimal value</th>
     * </tr>
     * <tr>
     * <td>First</td>
     * <td>0X01</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>Second</td>
     * <td>0x02</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>Third</td>
     * <td>0X04</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>Fourth</td>
     * <td>0X08</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>Last</td>
     * <td>0X10</td>
     * <td>16</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * When reading or writing XML for a task, the weeks of the month of a monthly day-of-week calendar are specified by the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-weeks-monthlydayofweekscheduletype-element">Weeks</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Integer} weeks 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlydowtrigger-put_weeksofmonth
     */
    put_WeeksOfMonth(weeks) {
        result := ComCall(23, this, "short", weeks, "HRESULT")
        return result
    }

    /**
     * Gets or sets the months of the year during which the task runs.
     * @remarks
     * 
     * The following table shows the mapping of the bitwise mask used by this property.<table>
     * <tr>
     * <th>Month</th>
     * <th>Hex value</th>
     * <th>Decimal value</th>
     * </tr>
     * <tr>
     * <td>January</td>
     * <td>0X01</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>February</td>
     * <td>0x02</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>March</td>
     * <td>0X04</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>April</td>
     * <td>0X08</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>May</td>
     * <td>0X10</td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>June</td>
     * <td>0X20</td>
     * <td>32</td>
     * </tr>
     * <tr>
     * <td>July</td>
     * <td>0x40</td>
     * <td>64</td>
     * </tr>
     * <tr>
     * <td>August</td>
     * <td>0X80</td>
     * <td>128</td>
     * </tr>
     * <tr>
     * <td>September</td>
     * <td>0X100</td>
     * <td>256</td>
     * </tr>
     * <tr>
     * <td>October</td>
     * <td>0X200</td>
     * <td>512</td>
     * </tr>
     * <tr>
     * <td>November</td>
     * <td>0X400</td>
     * <td>1024</td>
     * </tr>
     * <tr>
     * <td>December</td>
     * <td>0X800</td>
     * <td>2048</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * When reading or writing XML for a task, the months of the year of a monthly day-of-week calendar are specified by the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-months-monthlydayofweekscheduletype-element">Months</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<Integer>} pMonths 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlydowtrigger-get_monthsofyear
     */
    get_MonthsOfYear(pMonths) {
        pMonthsMarshal := pMonths is VarRef ? "short*" : "ptr"

        result := ComCall(24, this, pMonthsMarshal, pMonths, "HRESULT")
        return result
    }

    /**
     * Gets or sets the months of the year during which the task runs.
     * @remarks
     * 
     * The following table shows the mapping of the bitwise mask used by this property.<table>
     * <tr>
     * <th>Month</th>
     * <th>Hex value</th>
     * <th>Decimal value</th>
     * </tr>
     * <tr>
     * <td>January</td>
     * <td>0X01</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>February</td>
     * <td>0x02</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>March</td>
     * <td>0X04</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>April</td>
     * <td>0X08</td>
     * <td>8</td>
     * </tr>
     * <tr>
     * <td>May</td>
     * <td>0X10</td>
     * <td>16</td>
     * </tr>
     * <tr>
     * <td>June</td>
     * <td>0X20</td>
     * <td>32</td>
     * </tr>
     * <tr>
     * <td>July</td>
     * <td>0x40</td>
     * <td>64</td>
     * </tr>
     * <tr>
     * <td>August</td>
     * <td>0X80</td>
     * <td>128</td>
     * </tr>
     * <tr>
     * <td>September</td>
     * <td>0X100</td>
     * <td>256</td>
     * </tr>
     * <tr>
     * <td>October</td>
     * <td>0X200</td>
     * <td>512</td>
     * </tr>
     * <tr>
     * <td>November</td>
     * <td>0X400</td>
     * <td>1024</td>
     * </tr>
     * <tr>
     * <td>December</td>
     * <td>0X800</td>
     * <td>2048</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * When reading or writing XML for a task, the months of the year of a monthly day-of-week calendar are specified by the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-months-monthlydayofweekscheduletype-element">Months</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Integer} months 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlydowtrigger-put_monthsofyear
     */
    put_MonthsOfYear(months) {
        result := ComCall(25, this, "short", months, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task runs on the last week of the month.
     * @param {Pointer<VARIANT_BOOL>} pLastWeek 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlydowtrigger-get_runonlastweekofmonth
     */
    get_RunOnLastWeekOfMonth(pLastWeek) {
        pLastWeekMarshal := pLastWeek is VarRef ? "short*" : "ptr"

        result := ComCall(26, this, pLastWeekMarshal, pLastWeek, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task runs on the last week of the month.
     * @param {VARIANT_BOOL} lastWeek 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlydowtrigger-put_runonlastweekofmonth
     */
    put_RunOnLastWeekOfMonth(lastWeek) {
        result := ComCall(27, this, "short", lastWeek, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger.
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlydowtrigger-get_randomdelay
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(28, this, "ptr", pRandomDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger.
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-imonthlydowtrigger-put_randomdelay
     */
    put_RandomDelay(randomDelay) {
        randomDelay := randomDelay is String ? BSTR.Alloc(randomDelay).Value : randomDelay

        result := ComCall(29, this, "ptr", randomDelay, "HRESULT")
        return result
    }
}
