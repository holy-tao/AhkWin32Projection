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
     * 
     * @param {Pointer<Int16>} pDays 
     * @returns {HRESULT} 
     */
    get_DaysOfWeek(pDays) {
        result := ComCall(20, this, "short*", pDays, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     */
    put_DaysOfWeek(days) {
        result := ComCall(21, this, "short", days, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} pWeeks 
     * @returns {HRESULT} 
     */
    get_WeeksOfMonth(pWeeks) {
        result := ComCall(22, this, "short*", pWeeks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} weeks 
     * @returns {HRESULT} 
     */
    put_WeeksOfMonth(weeks) {
        result := ComCall(23, this, "short", weeks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} pMonths 
     * @returns {HRESULT} 
     */
    get_MonthsOfYear(pMonths) {
        result := ComCall(24, this, "short*", pMonths, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} months 
     * @returns {HRESULT} 
     */
    put_MonthsOfYear(months) {
        result := ComCall(25, this, "short", months, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pLastWeek 
     * @returns {HRESULT} 
     */
    get_RunOnLastWeekOfMonth(pLastWeek) {
        result := ComCall(26, this, "ptr", pLastWeek, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} lastWeek 
     * @returns {HRESULT} 
     */
    put_RunOnLastWeekOfMonth(lastWeek) {
        result := ComCall(27, this, "short", lastWeek, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(28, this, "ptr", pRandomDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     */
    put_RandomDelay(randomDelay) {
        randomDelay := randomDelay is String ? BSTR.Alloc(randomDelay).Value : randomDelay

        result := ComCall(29, this, "ptr", randomDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
