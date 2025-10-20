#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a task based on a daily schedule.
 * @remarks
 * 
  * The time of day that the task is started is set by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary">StartBoundary</a> property.
  * 
  * An interval of 1 produces a daily schedule. An interval of 2 produces an every other day schedule and so on.
  * 
  * When reading or writing your own XML for a task, a daily trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-schedulebyday-calendartriggertype-element">ScheduleByDay</a> element of the Task Scheduler schema.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-idailytrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IDailyTrigger extends ITrigger{
    /**
     * The interface identifier for IDailyTrigger
     * @type {Guid}
     */
    static IID => Guid("{126c5cd8-b288-41d5-8dbf-e491446adc5c}")

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
    get_DaysInterval(pDays) {
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
    put_DaysInterval(days) {
        result := ComCall(21, this, "short", days, "int")
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
        result := ComCall(22, this, "ptr", pRandomDelay, "int")
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

        result := ComCall(23, this, "ptr", randomDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
