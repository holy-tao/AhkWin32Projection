#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Defines how often the task is run and how long the repetition pattern is repeated after the task is started.
 * @remarks
 * If you specify a repetition duration for a task, you must also specify the repetition interval.
 * 
 * If you register a task that contains a  trigger with a repetition interval equal to one minute and a repetition duration equal to four minutes, the task will be launched five times. The five repetitions can be defined by the following pattern.
 * 
 * <ol>
 * <li>A task  starts at the beginning of the first minute.</li>
 * <li>The next task starts at the end of the first minute.</li>
 * <li>The next task starts at the end of the second minute.</li>
 * <li>The next task starts at the end of the third minute.</li>
 * <li>The next task starts at the end of the fourth minute.</li>
 * </ol>
 * <b>Windows Server 2003, Windows XP and Windows 2000:  </b>If you register a task that contains a trigger with a repetition interval equal to one minute and a repetition duration equal to four minutes, the task will be launched four times.
 * 
 * When reading or writing  XML for a task, the repetition pattern is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-repetition-triggerbasetype-element">Repetition</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-irepetitionpattern
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IRepetitionPattern extends IDispatch {
    /**
     * The interface identifier for IRepetitionPattern
     * @type {Guid}
     */
    static IID := Guid("{7fb9acf1-26be-400e-85b5-294b9c75dfd6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRepetitionPattern interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Interval          : IntPtr
        put_Interval          : IntPtr
        get_Duration          : IntPtr
        put_Duration          : IntPtr
        get_StopAtDurationEnd : IntPtr
        put_StopAtDurationEnd : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRepetitionPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Interval {
        get => this.get_Interval()
        set => this.put_Interval(value)
    }

    /**
     * @type {BSTR} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    StopAtDurationEnd {
        get => this.get_StopAtDurationEnd()
        set => this.put_StopAtDurationEnd(value)
    }

    /**
     * Gets or sets the amount of time between each restart of the task. (Get)
     * @remarks
     * If you specify a repetition duration for a task, you must also specify the repetition interval.
     * 
     * When reading or writing XML for a task, the repetition interval is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-interval-repetitiontype-element">Interval</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pInterval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_interval
     */
    get_Interval(pInterval) {
        result := ComCall(7, this, BSTR.Ptr, pInterval, "HRESULT")
        return result
    }

    /**
     * Gets or sets the amount of time between each restart of the task. (Put)
     * @remarks
     * If you specify a repetition duration for a task, you must also specify the repetition interval.
     * 
     * When reading or writing XML for a task, the repetition interval is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-interval-repetitiontype-element">Interval</a> element of the Task Scheduler schema.
     * @param {BSTR} _interval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-put_interval
     */
    put_Interval(_interval) {
        _interval := _interval is String ? BSTR.Alloc(_interval).Value : _interval

        result := ComCall(8, this, BSTR, _interval, "HRESULT")
        return result
    }

    /**
     * Gets or sets how long the pattern is repeated. (Get)
     * @remarks
     * If you specify a repetition duration for a task, you must also specify the repetition interval.
     * 
     * When reading or writing XML for a task, the repetition duration is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-duration-repetitiontype-element">Duration</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_duration
     */
    get_Duration(pDuration) {
        result := ComCall(9, this, BSTR.Ptr, pDuration, "HRESULT")
        return result
    }

    /**
     * Gets or sets how long the pattern is repeated. (Put)
     * @remarks
     * If you specify a repetition duration for a task, you must also specify the repetition interval.
     * 
     * When reading or writing XML for a task, the repetition duration is specified in the  <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-duration-repetitiontype-element">Duration</a> element of the Task Scheduler schema.
     * @param {BSTR} duration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-put_duration
     */
    put_Duration(duration) {
        duration := duration is String ? BSTR.Alloc(duration).Value : duration

        result := ComCall(10, this, BSTR, duration, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates if a running instance of the task is stopped at the end of the repetition pattern duration. (Get)
     * @remarks
     * When reading or writing XML for a task, this information is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element">StopAtDurationEnd</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pStop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend
     */
    get_StopAtDurationEnd(pStop) {
        pStopMarshal := pStop is VarRef ? "short*" : "ptr"

        result := ComCall(11, this, pStopMarshal, pStop, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates if a running instance of the task is stopped at the end of the repetition pattern duration. (Put)
     * @remarks
     * When reading or writing XML for a task, this information is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element">StopAtDurationEnd</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} stop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-put_stopatdurationend
     */
    put_StopAtDurationEnd(stop) {
        result := ComCall(12, this, VARIANT_BOOL, stop, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRepetitionPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Interval := CallbackCreate(GetMethod(implObj, "get_Interval"), flags, 2)
        this.vtbl.put_Interval := CallbackCreate(GetMethod(implObj, "put_Interval"), flags, 2)
        this.vtbl.get_Duration := CallbackCreate(GetMethod(implObj, "get_Duration"), flags, 2)
        this.vtbl.put_Duration := CallbackCreate(GetMethod(implObj, "put_Duration"), flags, 2)
        this.vtbl.get_StopAtDurationEnd := CallbackCreate(GetMethod(implObj, "get_StopAtDurationEnd"), flags, 2)
        this.vtbl.put_StopAtDurationEnd := CallbackCreate(GetMethod(implObj, "put_StopAtDurationEnd"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Interval)
        CallbackFree(this.vtbl.put_Interval)
        CallbackFree(this.vtbl.get_Duration)
        CallbackFree(this.vtbl.put_Duration)
        CallbackFree(this.vtbl.get_StopAtDurationEnd)
        CallbackFree(this.vtbl.put_StopAtDurationEnd)
    }
}
