#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ITrigger.ahk" { ITrigger }

/**
 * Represents a trigger that starts a task on a monthly day-of-week schedule.
 * @remarks
 * The time of day that the task is started is set by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary">StartBoundary</a> property.
 * 
 * When reading or writing  XML for a task, a monthly day-of-week trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-schedulebymonthdayofweek-calendartriggertype-element">ScheduleByMonthDayOfWeek</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-imonthlydowtrigger
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IMonthlyDOWTrigger extends ITrigger {
    /**
     * The interface identifier for IMonthlyDOWTrigger
     * @type {Guid}
     */
    static IID := Guid("{77d025a3-90fa-43aa-b52e-cda5499b946a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMonthlyDOWTrigger interfaces
    */
    struct Vtbl extends ITrigger.Vtbl {
        get_DaysOfWeek           : IntPtr
        put_DaysOfWeek           : IntPtr
        get_WeeksOfMonth         : IntPtr
        put_WeeksOfMonth         : IntPtr
        get_MonthsOfYear         : IntPtr
        put_MonthsOfYear         : IntPtr
        get_RunOnLastWeekOfMonth : IntPtr
        put_RunOnLastWeekOfMonth : IntPtr
        get_RandomDelay          : IntPtr
        put_RandomDelay          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMonthlyDOWTrigger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    DaysOfWeek {
        get => this.get_DaysOfWeek()
        set => this.put_DaysOfWeek(value)
    }

    /**
     * @type {Integer} 
     */
    WeeksOfMonth {
        get => this.get_WeeksOfMonth()
        set => this.put_WeeksOfMonth(value)
    }

    /**
     * @type {Integer} 
     */
    MonthsOfYear {
        get => this.get_MonthsOfYear()
        set => this.put_MonthsOfYear(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RunOnLastWeekOfMonth {
        get => this.get_RunOnLastWeekOfMonth()
        set => this.put_RunOnLastWeekOfMonth(value)
    }

    /**
     * @type {BSTR} 
     */
    RandomDelay {
        get => this.get_RandomDelay()
        set => this.put_RandomDelay(value)
    }

    /**
     * Gets or sets the days of the week during which the task runs. (Get)
     * @remarks
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
     * @param {Pointer<Integer>} pDays 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-get_daysofweek
     */
    get_DaysOfWeek(pDays) {
        pDaysMarshal := pDays is VarRef ? "short*" : "ptr"

        result := ComCall(20, this, pDaysMarshal, pDays, "HRESULT")
        return result
    }

    /**
     * Gets or sets the days of the week during which the task runs. (Put)
     * @remarks
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
     * @param {Integer} days 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-put_daysofweek
     */
    put_DaysOfWeek(days) {
        result := ComCall(21, this, "short", days, "HRESULT")
        return result
    }

    /**
     * Gets or sets the weeks of the month during which the task runs. (Get)
     * @remarks
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
     * @param {Pointer<Integer>} pWeeks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-get_weeksofmonth
     */
    get_WeeksOfMonth(pWeeks) {
        pWeeksMarshal := pWeeks is VarRef ? "short*" : "ptr"

        result := ComCall(22, this, pWeeksMarshal, pWeeks, "HRESULT")
        return result
    }

    /**
     * Gets or sets the weeks of the month during which the task runs. (Put)
     * @remarks
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
     * @param {Integer} weeks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-put_weeksofmonth
     */
    put_WeeksOfMonth(weeks) {
        result := ComCall(23, this, "short", weeks, "HRESULT")
        return result
    }

    /**
     * Gets or sets the months of the year during which the task runs. (IMonthlyDOWTrigger.get_MonthsOfYear)
     * @remarks
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
     * @param {Pointer<Integer>} pMonths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-get_monthsofyear
     */
    get_MonthsOfYear(pMonths) {
        pMonthsMarshal := pMonths is VarRef ? "short*" : "ptr"

        result := ComCall(24, this, pMonthsMarshal, pMonths, "HRESULT")
        return result
    }

    /**
     * Gets or sets the months of the year during which the task runs. (IMonthlyDOWTrigger.put_MonthsOfYear)
     * @remarks
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
     * @param {Integer} months 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-put_monthsofyear
     */
    put_MonthsOfYear(months) {
        result := ComCall(25, this, "short", months, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task runs on the last week of the month. (Get)
     * @param {Pointer<VARIANT_BOOL>} pLastWeek 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-get_runonlastweekofmonth
     */
    get_RunOnLastWeekOfMonth(pLastWeek) {
        pLastWeekMarshal := pLastWeek is VarRef ? "short*" : "ptr"

        result := ComCall(26, this, pLastWeekMarshal, pLastWeek, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the task runs on the last week of the month. (Put)
     * @param {VARIANT_BOOL} lastWeek 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-put_runonlastweekofmonth
     */
    put_RunOnLastWeekOfMonth(lastWeek) {
        result := ComCall(27, this, VARIANT_BOOL, lastWeek, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger. (IMonthlyDOWTrigger.get_RandomDelay)
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-get_randomdelay
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(28, this, BSTR.Ptr, pRandomDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger. (IMonthlyDOWTrigger.put_RandomDelay)
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-put_randomdelay
     */
    put_RandomDelay(randomDelay) {
        randomDelay := randomDelay is String ? BSTR.Alloc(randomDelay).Value : randomDelay

        result := ComCall(29, this, BSTR, randomDelay, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMonthlyDOWTrigger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DaysOfWeek := CallbackCreate(GetMethod(implObj, "get_DaysOfWeek"), flags, 2)
        this.vtbl.put_DaysOfWeek := CallbackCreate(GetMethod(implObj, "put_DaysOfWeek"), flags, 2)
        this.vtbl.get_WeeksOfMonth := CallbackCreate(GetMethod(implObj, "get_WeeksOfMonth"), flags, 2)
        this.vtbl.put_WeeksOfMonth := CallbackCreate(GetMethod(implObj, "put_WeeksOfMonth"), flags, 2)
        this.vtbl.get_MonthsOfYear := CallbackCreate(GetMethod(implObj, "get_MonthsOfYear"), flags, 2)
        this.vtbl.put_MonthsOfYear := CallbackCreate(GetMethod(implObj, "put_MonthsOfYear"), flags, 2)
        this.vtbl.get_RunOnLastWeekOfMonth := CallbackCreate(GetMethod(implObj, "get_RunOnLastWeekOfMonth"), flags, 2)
        this.vtbl.put_RunOnLastWeekOfMonth := CallbackCreate(GetMethod(implObj, "put_RunOnLastWeekOfMonth"), flags, 2)
        this.vtbl.get_RandomDelay := CallbackCreate(GetMethod(implObj, "get_RandomDelay"), flags, 2)
        this.vtbl.put_RandomDelay := CallbackCreate(GetMethod(implObj, "put_RandomDelay"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DaysOfWeek)
        CallbackFree(this.vtbl.put_DaysOfWeek)
        CallbackFree(this.vtbl.get_WeeksOfMonth)
        CallbackFree(this.vtbl.put_WeeksOfMonth)
        CallbackFree(this.vtbl.get_MonthsOfYear)
        CallbackFree(this.vtbl.put_MonthsOfYear)
        CallbackFree(this.vtbl.get_RunOnLastWeekOfMonth)
        CallbackFree(this.vtbl.put_RunOnLastWeekOfMonth)
        CallbackFree(this.vtbl.get_RandomDelay)
        CallbackFree(this.vtbl.put_RandomDelay)
    }
}
