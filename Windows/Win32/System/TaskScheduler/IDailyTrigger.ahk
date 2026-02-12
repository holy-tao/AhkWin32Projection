#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a task based on a daily schedule.
 * @remarks
 * The time of day that the task is started is set by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary">StartBoundary</a> property.
 * 
 * An interval of 1 produces a daily schedule. An interval of 2 produces an every other day schedule and so on.
 * 
 * When reading or writing your own XML for a task, a daily trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-schedulebyday-calendartriggertype-element">ScheduleByDay</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nn-taskschd-idailytrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IDailyTrigger extends ITrigger{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DaysInterval", "put_DaysInterval", "get_RandomDelay", "put_RandomDelay"]

    /**
     */
    DaysInterval {
        get => this.get_DaysInterval()
        set => this.put_DaysInterval(value)
    }

    /**
     */
    RandomDelay {
        get => this.get_RandomDelay()
        set => this.put_RandomDelay(value)
    }

    /**
     * Gets or sets the interval between the days in the schedule. (Get)
     * @remarks
     * An interval of 1 produces a daily schedule. An interval of 2 produces an every-other day schedule.
     * 
     * When reading or writing your own XML for a task, the interval for a daily schedule is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-daysinterval-dailyscheduletype-element">DaysInterval</a> element of the Task Scheduler schema.
     * @param {Pointer<Integer>} pDays 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-idailytrigger-get_daysinterval
     */
    get_DaysInterval(pDays) {
        pDaysMarshal := pDays is VarRef ? "short*" : "ptr"

        result := ComCall(20, this, pDaysMarshal, pDays, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets the interval between the days in the schedule. (Put)
     * @remarks
     * An interval of 1 produces a daily schedule. An interval of 2 produces an every-other day schedule.
     * 
     * When reading or writing your own XML for a task, the interval for a daily schedule is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-daysinterval-dailyscheduletype-element">DaysInterval</a> element of the Task Scheduler schema.
     * @param {Integer} days 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-idailytrigger-put_daysinterval
     */
    put_DaysInterval(days) {
        result := ComCall(21, this, "short", days, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger. (IDailyTrigger.get_RandomDelay)
     * @remarks
     * The specified random delay time is the upper bound for the random interval. The trigger will fire at random during the period specified by the <i>randomDelay</i> parameter, which doesn't begin until the specified start time of the trigger. For example, if the task trigger is set to every seventh day, and the <i>randomDelay</i> parameter is set to P2DT5S (2 day, 5 second time span), then once the seventh day is reached, the trigger will fire once randomly during the next 2 days, 5 seconds.
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-idailytrigger-get_randomdelay
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(22, this, "ptr", pRandomDelay, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger. (IDailyTrigger.put_RandomDelay)
     * @remarks
     * The specified random delay time is the upper bound for the random interval. The trigger will fire at random during the period specified by the <i>randomDelay</i> parameter, which doesn't begin until the specified start time of the trigger. For example, if the task trigger is set to every seventh day, and the <i>randomDelay</i> parameter is set to P2DT5S (2 day, 5 second time span), then once the seventh day is reached, the trigger will fire once randomly during the next 2 days, 5 seconds.
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nf-taskschd-idailytrigger-put_randomdelay
     */
    put_RandomDelay(randomDelay) {
        if(randomDelay is String) {
            pin := BSTR.Alloc(randomDelay)
            randomDelay := pin.Value
        }

        result := ComCall(23, this, "ptr", randomDelay, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
