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
    get_WeeksInterval(pWeeks) {
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
    put_WeeksInterval(weeks) {
        result := ComCall(23, this, "short", weeks, "int")
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
        result := ComCall(24, this, "ptr", pRandomDelay, "int")
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

        result := ComCall(25, this, "ptr", randomDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
