#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Specifies how the Task Scheduler performs tasks when the computer is in an idle condition.
 * @remarks
 * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-idlesettings-settingstype-element">IdleSettings</a> element of the Task Scheduler schema.
 * 
 * If a task is triggered by an idle trigger, then the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iidlesettings-get_waittimeout">WaitTimeout</a> property of the <b>IIdleSettings</b> interface is ignored.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-iidlesettings
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IIdleSettings extends IDispatch {
    /**
     * The interface identifier for IIdleSettings
     * @type {Guid}
     */
    static IID := Guid("{84594461-0053-4342-a8fd-088fabf11f32}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIdleSettings interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_IdleDuration  : IntPtr
        put_IdleDuration  : IntPtr
        get_WaitTimeout   : IntPtr
        put_WaitTimeout   : IntPtr
        get_StopOnIdleEnd : IntPtr
        put_StopOnIdleEnd : IntPtr
        get_RestartOnIdle : IntPtr
        put_RestartOnIdle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIdleSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    IdleDuration {
        get => this.get_IdleDuration()
        set => this.put_IdleDuration(value)
    }

    /**
     * @type {BSTR} 
     */
    WaitTimeout {
        get => this.get_WaitTimeout()
        set => this.put_WaitTimeout(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    StopOnIdleEnd {
        get => this.get_StopOnIdleEnd()
        set => this.put_StopOnIdleEnd(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    RestartOnIdle {
        get => this.get_RestartOnIdle()
        set => this.put_RestartOnIdle(value)
    }

    /**
     * Gets or sets a value that indicates the amount of time that the computer must be in an idle state before the task is run. (Get)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-duration-idlesettingstype-element">Duration</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-get_idleduration
     */
    get_IdleDuration(pDelay) {
        result := ComCall(7, this, BSTR.Ptr, pDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates the amount of time that the computer must be in an idle state before the task is run. (Put)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-duration-idlesettingstype-element">Duration</a> element of the Task Scheduler schema.
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-put_idleduration
     */
    put_IdleDuration(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(8, this, BSTR, delay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates the amount of time that the Task Scheduler will wait for an idle condition to occur. (Get)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-waittimeout-idlesettingstype-element">WaitTimeout</a> element of the Task Scheduler schema.
     * 
     * If a task is triggered by an idle trigger, then the <b>WaitTimeout</b> property of the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iidlesettings">IIdleSettings</a> interface is ignored.
     * @param {Pointer<BSTR>} pTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-get_waittimeout
     */
    get_WaitTimeout(pTimeout) {
        result := ComCall(9, this, BSTR.Ptr, pTimeout, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates the amount of time that the Task Scheduler will wait for an idle condition to occur. (Put)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-waittimeout-idlesettingstype-element">WaitTimeout</a> element of the Task Scheduler schema.
     * 
     * If a task is triggered by an idle trigger, then the <b>WaitTimeout</b> property of the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iidlesettings">IIdleSettings</a> interface is ignored.
     * @param {BSTR} timeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-put_waittimeout
     */
    put_WaitTimeout(timeout) {
        timeout := timeout is String ? BSTR.Alloc(timeout).Value : timeout

        result := ComCall(10, this, BSTR, timeout, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will terminate the task if the idle condition ends before the task is completed. The idle condition ends when the computer is no longer idle. (Get)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-terminateonidleend-idlesettingstype-element">TerminateOnIdleEnd</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pStop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-get_stoponidleend
     */
    get_StopOnIdleEnd(pStop) {
        pStopMarshal := pStop is VarRef ? "short*" : "ptr"

        result := ComCall(11, this, pStopMarshal, pStop, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates that the Task Scheduler will terminate the task if the idle condition ends before the task is completed. The idle condition ends when the computer is no longer idle. (Put)
     * @remarks
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-terminateonidleend-idlesettingstype-element">TerminateOnIdleEnd</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} stop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-put_stoponidleend
     */
    put_StopOnIdleEnd(stop) {
        result := ComCall(12, this, VARIANT_BOOL, stop, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates whether the task is restarted when the computer cycles into an idle condition more than once. (Get)
     * @remarks
     * This property is only used if the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iidlesettings-get_stoponidleend">StopOnIdleEnd</a> property is set to True.
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-restartonidle-idlesettingstype-element">RestartOnIdle</a> element of the Task Scheduler schema.
     * @param {Pointer<VARIANT_BOOL>} pRestart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-get_restartonidle
     */
    get_RestartOnIdle(pRestart) {
        pRestartMarshal := pRestart is VarRef ? "short*" : "ptr"

        result := ComCall(13, this, pRestartMarshal, pRestart, "HRESULT")
        return result
    }

    /**
     * Gets or sets a Boolean value that indicates whether the task is restarted when the computer cycles into an idle condition more than once. (Put)
     * @remarks
     * This property is only used if the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iidlesettings-get_stoponidleend">StopOnIdleEnd</a> property is set to True.
     * 
     * When reading or writing XML for a task, this setting is specified in the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-restartonidle-idlesettingstype-element">RestartOnIdle</a> element of the Task Scheduler schema.
     * @param {VARIANT_BOOL} restart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iidlesettings-put_restartonidle
     */
    put_RestartOnIdle(restart) {
        result := ComCall(14, this, VARIANT_BOOL, restart, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIdleSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IdleDuration := CallbackCreate(GetMethod(implObj, "get_IdleDuration"), flags, 2)
        this.vtbl.put_IdleDuration := CallbackCreate(GetMethod(implObj, "put_IdleDuration"), flags, 2)
        this.vtbl.get_WaitTimeout := CallbackCreate(GetMethod(implObj, "get_WaitTimeout"), flags, 2)
        this.vtbl.put_WaitTimeout := CallbackCreate(GetMethod(implObj, "put_WaitTimeout"), flags, 2)
        this.vtbl.get_StopOnIdleEnd := CallbackCreate(GetMethod(implObj, "get_StopOnIdleEnd"), flags, 2)
        this.vtbl.put_StopOnIdleEnd := CallbackCreate(GetMethod(implObj, "put_StopOnIdleEnd"), flags, 2)
        this.vtbl.get_RestartOnIdle := CallbackCreate(GetMethod(implObj, "get_RestartOnIdle"), flags, 2)
        this.vtbl.put_RestartOnIdle := CallbackCreate(GetMethod(implObj, "put_RestartOnIdle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IdleDuration)
        CallbackFree(this.vtbl.put_IdleDuration)
        CallbackFree(this.vtbl.get_WaitTimeout)
        CallbackFree(this.vtbl.put_WaitTimeout)
        CallbackFree(this.vtbl.get_StopOnIdleEnd)
        CallbackFree(this.vtbl.put_StopOnIdleEnd)
        CallbackFree(this.vtbl.get_RestartOnIdle)
        CallbackFree(this.vtbl.put_RestartOnIdle)
    }
}
