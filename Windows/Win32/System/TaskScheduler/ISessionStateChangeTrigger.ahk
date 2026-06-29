#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TASK_SESSION_STATE_CHANGE_TYPE.ahk" { TASK_SESSION_STATE_CHANGE_TYPE }
#Import ".\ITrigger.ahk" { ITrigger }

/**
 * Triggers tasks for console connect or disconnect, remote connect or disconnect, or workstation lock or unlock notifications.
 * @remarks
 * When reading or writing your own XML for a task, a session state change trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-sessionstatechangetrigger-triggergroup-element">SessionStateChangeTrigger</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-isessionstatechangetrigger
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ISessionStateChangeTrigger extends ITrigger {
    /**
     * The interface identifier for ISessionStateChangeTrigger
     * @type {Guid}
     */
    static IID := Guid("{754da71b-4385-4475-9dd9-598294fa3641}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISessionStateChangeTrigger interfaces
    */
    struct Vtbl extends ITrigger.Vtbl {
        get_Delay       : IntPtr
        put_Delay       : IntPtr
        get_UserId      : IntPtr
        put_UserId      : IntPtr
        get_StateChange : IntPtr
        put_StateChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISessionStateChangeTrigger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Delay {
        get => this.get_Delay()
        set => this.put_Delay(value)
    }

    /**
     * @type {BSTR} 
     */
    UserId {
        get => this.get_UserId()
        set => this.put_UserId(value)
    }

    /**
     * @type {TASK_SESSION_STATE_CHANGE_TYPE} 
     */
    StateChange {
        get => this.get_StateChange()
        set => this.put_StateChange(value)
    }

    /**
     * Gets or sets a value that indicates how long of a delay takes place before a task is started after a Terminal Server session state change is detected. (ISessionStateChangeTrigger.get_Delay)
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-isessionstatechangetrigger-get_delay
     */
    get_Delay(pDelay) {
        result := ComCall(20, this, BSTR.Ptr, pDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates how long of a delay takes place before a task is started after a Terminal Server session state change is detected. (ISessionStateChangeTrigger.put_Delay)
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-isessionstatechangetrigger-put_delay
     */
    put_Delay(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(21, this, BSTR, delay, "HRESULT")
        return result
    }

    /**
     * Gets or sets the user for the Terminal Server session. When a session state change is detected for this user, a task is started. (Get)
     * @param {Pointer<BSTR>} pUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-isessionstatechangetrigger-get_userid
     */
    get_UserId(pUser) {
        result := ComCall(22, this, BSTR.Ptr, pUser, "HRESULT")
        return result
    }

    /**
     * Gets or sets the user for the Terminal Server session. When a session state change is detected for this user, a task is started. (Put)
     * @param {BSTR} user 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-isessionstatechangetrigger-put_userid
     */
    put_UserId(user) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(23, this, BSTR, user, "HRESULT")
        return result
    }

    /**
     * Gets or sets the kind of Terminal Server session change that would trigger a task launch. (Get)
     * @param {Pointer<TASK_SESSION_STATE_CHANGE_TYPE>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-isessionstatechangetrigger-get_statechange
     */
    get_StateChange(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * Gets or sets the kind of Terminal Server session change that would trigger a task launch. (Put)
     * @param {TASK_SESSION_STATE_CHANGE_TYPE} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-isessionstatechangetrigger-put_statechange
     */
    put_StateChange(type) {
        result := ComCall(25, this, TASK_SESSION_STATE_CHANGE_TYPE, type, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISessionStateChangeTrigger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Delay := CallbackCreate(GetMethod(implObj, "get_Delay"), flags, 2)
        this.vtbl.put_Delay := CallbackCreate(GetMethod(implObj, "put_Delay"), flags, 2)
        this.vtbl.get_UserId := CallbackCreate(GetMethod(implObj, "get_UserId"), flags, 2)
        this.vtbl.put_UserId := CallbackCreate(GetMethod(implObj, "put_UserId"), flags, 2)
        this.vtbl.get_StateChange := CallbackCreate(GetMethod(implObj, "get_StateChange"), flags, 2)
        this.vtbl.put_StateChange := CallbackCreate(GetMethod(implObj, "put_StateChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Delay)
        CallbackFree(this.vtbl.put_Delay)
        CallbackFree(this.vtbl.get_UserId)
        CallbackFree(this.vtbl.put_UserId)
        CallbackFree(this.vtbl.get_StateChange)
        CallbackFree(this.vtbl.put_StateChange)
    }
}
