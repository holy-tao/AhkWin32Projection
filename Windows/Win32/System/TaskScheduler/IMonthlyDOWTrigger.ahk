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
     * 
     * @param {Pointer<Integer>} pDays 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-get_daysofweek
     */
    get_DaysOfWeek(pDays) {
        result := ComCall(20, this, "short*", pDays, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-put_daysofweek
     */
    put_DaysOfWeek(days) {
        result := ComCall(21, this, "short", days, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pWeeks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-get_weeksofmonth
     */
    get_WeeksOfMonth(pWeeks) {
        result := ComCall(22, this, "short*", pWeeks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} weeks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-put_weeksofmonth
     */
    put_WeeksOfMonth(weeks) {
        result := ComCall(23, this, "short", weeks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMonths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-get_monthsofyear
     */
    get_MonthsOfYear(pMonths) {
        result := ComCall(24, this, "short*", pMonths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} months 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-put_monthsofyear
     */
    put_MonthsOfYear(months) {
        result := ComCall(25, this, "short", months, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pLastWeek 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-get_runonlastweekofmonth
     */
    get_RunOnLastWeekOfMonth(pLastWeek) {
        result := ComCall(26, this, "ptr", pLastWeek, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} lastWeek 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-put_runonlastweekofmonth
     */
    put_RunOnLastWeekOfMonth(lastWeek) {
        result := ComCall(27, this, "short", lastWeek, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-get_randomdelay
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(28, this, "ptr", pRandomDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlydowtrigger-put_randomdelay
     */
    put_RandomDelay(randomDelay) {
        randomDelay := randomDelay is String ? BSTR.Alloc(randomDelay).Value : randomDelay

        result := ComCall(29, this, "ptr", randomDelay, "HRESULT")
        return result
    }
}
