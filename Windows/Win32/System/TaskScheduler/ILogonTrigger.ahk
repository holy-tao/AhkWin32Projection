#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITrigger.ahk" { ITrigger }

/**
 * Represents a trigger that starts a task when a user logs on.
 * @remarks
 * If you want a task to be triggered when any member of a group logs on to the computer rather than when  a specific user logs on, then do not assign a value to the  <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-ilogontrigger-get_userid">UserId</a> property.  Instead, create a logon trigger with an empty <b>UserId</b> property and assign a value to the principal for the task using the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_groupid">GroupId</a> property.
 * 
 * When reading or writing XML for a task, a logon trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-logontrigger-triggergroup-element">LogonTrigger</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-ilogontrigger
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ILogonTrigger extends ITrigger {
    /**
     * The interface identifier for ILogonTrigger
     * @type {Guid}
     */
    static IID := Guid("{72dade38-fae4-4b3e-baf4-5d009af02b1c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILogonTrigger interfaces
    */
    struct Vtbl extends ITrigger.Vtbl {
        get_Delay  : IntPtr
        put_Delay  : IntPtr
        get_UserId : IntPtr
        put_UserId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILogonTrigger.Vtbl()
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
     * Gets or sets a value that indicates the amount of time between when the user logs on and when the task is started. (Get)
     * @remarks
     * When reading or writing XML for a task, the logon trigger delay is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-delay-logontriggertype-element">Delay</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ilogontrigger-get_delay
     */
    get_Delay(pDelay) {
        result := ComCall(20, this, BSTR.Ptr, pDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates the amount of time between when the user logs on and when the task is started. (Put)
     * @remarks
     * When reading or writing XML for a task, the logon trigger delay is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-delay-logontriggertype-element">Delay</a> element of the Task Scheduler schema.
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ilogontrigger-put_delay
     */
    put_Delay(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(21, this, BSTR, delay, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier of the user. (Get)
     * @remarks
     * If you want a task to be triggered when any member of a group logs on to the computer rather than when  a specific user logs on, then do not assign a value to the  <b>UserId</b> property.  Instead, create a logon trigger with an empty <b>UserId</b> property and assign a value to the principal for the task using the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_groupid">GroupId</a> property.
     * 
     * When reading or writing XML for a task, the logon user identifier is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-userid-logontriggertype-element">UserId</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ilogontrigger-get_userid
     */
    get_UserId(pUser) {
        result := ComCall(22, this, BSTR.Ptr, pUser, "HRESULT")
        return result
    }

    /**
     * Gets or sets the identifier of the user. (Put)
     * @remarks
     * If you want a task to be triggered when any member of a group logs on to the computer rather than when  a specific user logs on, then do not assign a value to the  <b>UserId</b> property.  Instead, create a logon trigger with an empty <b>UserId</b> property and assign a value to the principal for the task using the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iprincipal-get_groupid">GroupId</a> property.
     * 
     * When reading or writing XML for a task, the logon user identifier is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-userid-logontriggertype-element">UserId</a> element of the Task Scheduler schema.
     * @param {BSTR} user 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-ilogontrigger-put_userid
     */
    put_UserId(user) {
        user := user is String ? BSTR.Alloc(user).Value : user

        result := ComCall(23, this, BSTR, user, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILogonTrigger.IID.Equals(iid)) {
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
    }
}
