#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a task based on a weekly schedule.
 * @remarks
 * 
 * The time of day that the task is started is set by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary">StartBoundary</a> property.
 * 
 * When reading or writing your own XML for a task, a weekly trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-schedulebyweek-calendartriggertype-element">ScheduleByWeek</a> element of the Task Scheduler schema.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iweeklytrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IWeeklyTrigger extends ITrigger{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWeeklyTrigger
     * @type {Guid}
     */
    static IID => Guid("{5038fc98-82ff-436d-8728-a512a57c9dc1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DaysOfWeek", "put_DaysOfWeek", "get_WeeksInterval", "put_WeeksInterval", "get_RandomDelay", "put_RandomDelay"]

    /**
     * 
     * @param {Pointer<Integer>} pDays 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iweeklytrigger-get_daysofweek
     */
    get_DaysOfWeek(pDays) {
        pDaysMarshal := pDays is VarRef ? "short*" : "ptr"

        result := ComCall(20, this, pDaysMarshal, pDays, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} days 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iweeklytrigger-put_daysofweek
     */
    put_DaysOfWeek(days) {
        result := ComCall(21, this, "short", days, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pWeeks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iweeklytrigger-get_weeksinterval
     */
    get_WeeksInterval(pWeeks) {
        pWeeksMarshal := pWeeks is VarRef ? "short*" : "ptr"

        result := ComCall(22, this, pWeeksMarshal, pWeeks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} weeks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iweeklytrigger-put_weeksinterval
     */
    put_WeeksInterval(weeks) {
        result := ComCall(23, this, "short", weeks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iweeklytrigger-get_randomdelay
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(24, this, "ptr", pRandomDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iweeklytrigger-put_randomdelay
     */
    put_RandomDelay(randomDelay) {
        randomDelay := randomDelay is String ? BSTR.Alloc(randomDelay).Value : randomDelay

        result := ComCall(25, this, "ptr", randomDelay, "HRESULT")
        return result
    }
}
