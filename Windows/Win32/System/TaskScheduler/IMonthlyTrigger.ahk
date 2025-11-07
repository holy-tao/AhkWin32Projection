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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DaysOfMonth", "put_DaysOfMonth", "get_MonthsOfYear", "put_MonthsOfYear", "get_RunOnLastDayOfMonth", "put_RunOnLastDayOfMonth", "get_RandomDelay", "put_RandomDelay"]

    /**
     * 
     * @param {Pointer<Integer>} pDays 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-get_daysofmonth
     */
    get_DaysOfMonth(pDays) {
        pDaysMarshal := pDays is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pDaysMarshal, pDays, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-put_daysofmonth
     */
    put_DaysOfMonth(days) {
        result := ComCall(21, this, "int", days, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMonths 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-get_monthsofyear
     */
    get_MonthsOfYear(pMonths) {
        pMonthsMarshal := pMonths is VarRef ? "short*" : "ptr"

        result := ComCall(22, this, pMonthsMarshal, pMonths, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} months 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-put_monthsofyear
     */
    put_MonthsOfYear(months) {
        result := ComCall(23, this, "short", months, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pLastDay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-get_runonlastdayofmonth
     */
    get_RunOnLastDayOfMonth(pLastDay) {
        pLastDayMarshal := pLastDay is VarRef ? "short*" : "ptr"

        result := ComCall(24, this, pLastDayMarshal, pLastDay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} lastDay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-put_runonlastdayofmonth
     */
    put_RunOnLastDayOfMonth(lastDay) {
        result := ComCall(25, this, "short", lastDay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-get_randomdelay
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(26, this, "ptr", pRandomDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-imonthlytrigger-put_randomdelay
     */
    put_RandomDelay(randomDelay) {
        randomDelay := randomDelay is String ? BSTR.Alloc(randomDelay).Value : randomDelay

        result := ComCall(27, this, "ptr", randomDelay, "HRESULT")
        return result
    }
}
