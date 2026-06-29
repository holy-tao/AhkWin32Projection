#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITrigger.ahk" { ITrigger }

/**
 * Represents a trigger that starts a task based on a daily schedule.
 * @remarks
 * The time of day that the task is started is set by the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary">StartBoundary</a> property.
 * 
 * An interval of 1 produces a daily schedule. An interval of 2 produces an every other day schedule and so on.
 * 
 * When reading or writing your own XML for a task, a daily trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-schedulebyday-calendartriggertype-element">ScheduleByDay</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-idailytrigger
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IDailyTrigger extends ITrigger {
    /**
     * The interface identifier for IDailyTrigger
     * @type {Guid}
     */
    static IID := Guid("{126c5cd8-b288-41d5-8dbf-e491446adc5c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDailyTrigger interfaces
    */
    struct Vtbl extends ITrigger.Vtbl {
        get_DaysInterval : IntPtr
        put_DaysInterval : IntPtr
        get_RandomDelay  : IntPtr
        put_RandomDelay  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDailyTrigger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    DaysInterval {
        get => this.get_DaysInterval()
        set => this.put_DaysInterval(value)
    }

    /**
     * @type {BSTR} 
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
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-idailytrigger-get_daysinterval
     */
    get_DaysInterval(pDays) {
        pDaysMarshal := pDays is VarRef ? "short*" : "ptr"

        result := ComCall(20, this, pDaysMarshal, pDays, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-idailytrigger-put_daysinterval
     */
    put_DaysInterval(days) {
        result := ComCall(21, this, "short", days, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger. (IDailyTrigger.get_RandomDelay)
     * @remarks
     * The specified random delay time is the upper bound for the random interval. The trigger will fire at random during the period specified by the <i>randomDelay</i> parameter, which doesn't begin until the specified start time of the trigger. For example, if the task trigger is set to every seventh day, and the <i>randomDelay</i> parameter is set to P2DT5S (2 day, 5 second time span), then once the seventh day is reached, the trigger will fire once randomly during the next 2 days, 5 seconds.
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-idailytrigger-get_randomdelay
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(22, this, BSTR.Ptr, pRandomDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger. (IDailyTrigger.put_RandomDelay)
     * @remarks
     * The specified random delay time is the upper bound for the random interval. The trigger will fire at random during the period specified by the <i>randomDelay</i> parameter, which doesn't begin until the specified start time of the trigger. For example, if the task trigger is set to every seventh day, and the <i>randomDelay</i> parameter is set to P2DT5S (2 day, 5 second time span), then once the seventh day is reached, the trigger will fire once randomly during the next 2 days, 5 seconds.
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-idailytrigger-put_randomdelay
     */
    put_RandomDelay(randomDelay) {
        randomDelay := randomDelay is String ? BSTR.Alloc(randomDelay).Value : randomDelay

        result := ComCall(23, this, BSTR, randomDelay, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDailyTrigger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DaysInterval := CallbackCreate(GetMethod(implObj, "get_DaysInterval"), flags, 2)
        this.vtbl.put_DaysInterval := CallbackCreate(GetMethod(implObj, "put_DaysInterval"), flags, 2)
        this.vtbl.get_RandomDelay := CallbackCreate(GetMethod(implObj, "get_RandomDelay"), flags, 2)
        this.vtbl.put_RandomDelay := CallbackCreate(GetMethod(implObj, "put_RandomDelay"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DaysInterval)
        CallbackFree(this.vtbl.put_DaysInterval)
        CallbackFree(this.vtbl.get_RandomDelay)
        CallbackFree(this.vtbl.put_RandomDelay)
    }
}
