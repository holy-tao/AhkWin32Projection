#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a job based on a monthly schedule.
 * @remarks
 * 
  * The time of day that the task is started is set by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary">StartBoundary</a> property.
  * 
  * When reading or writing your own XML for a task, a monthly trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-schedulebymonth-calendartriggertype-element">ScheduleByMonth </a> element of the Task Scheduler schema.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-imonthlytrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IMonthlyTrigger extends ITrigger{
    /**
     * The interface identifier for IMonthlyTrigger
     * @type {Guid}
     */
    static IID => Guid("{97c45ef1-6b02-4a1a-9c0e-1ebfba1500ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {Pointer<Int32>} pDays 
     * @returns {HRESULT} 
     */
    get_DaysOfMonth(pDays) {
        result := ComCall(20, this, "int*", pDays, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     */
    put_DaysOfMonth(days) {
        result := ComCall(21, this, "int", days, "int")
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
        result := ComCall(22, this, "short*", pMonths, "int")
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
        result := ComCall(23, this, "short", months, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pLastDay 
     * @returns {HRESULT} 
     */
    get_RunOnLastDayOfMonth(pLastDay) {
        result := ComCall(24, this, "ptr", pLastDay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} lastDay 
     * @returns {HRESULT} 
     */
    put_RunOnLastDayOfMonth(lastDay) {
        result := ComCall(25, this, "short", lastDay, "int")
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
        result := ComCall(26, this, "ptr", pRandomDelay, "int")
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

        result := ComCall(27, this, "ptr", randomDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
