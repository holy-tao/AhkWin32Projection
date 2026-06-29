#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITrigger.ahk" { ITrigger }

/**
 * Represents a trigger that starts a task when the task is registered or updated.
 * @remarks
 * When creating your own XML for a task, a registration trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-registrationtrigger-triggergroup-element">RegistrationTrigger</a> element of the Task Scheduler schema.
 * 
 * If a task with a delayed registration trigger is registered, and the computer that the task is registered on is shutdown or restarted during  the delay, before the task runs, then the task will not run and the delay will be lost.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-iregistrationtrigger
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IRegistrationTrigger extends ITrigger {
    /**
     * The interface identifier for IRegistrationTrigger
     * @type {Guid}
     */
    static IID := Guid("{4c8fec3a-c218-4e0c-b23d-629024db91a2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRegistrationTrigger interfaces
    */
    struct Vtbl extends ITrigger.Vtbl {
        get_Delay : IntPtr
        put_Delay : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRegistrationTrigger.Vtbl()
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
     * Gets or sets the amount of time between when the task is registered and when the task is started. (Get)
     * @remarks
     * When reading or writing XML for a task, the boot delay is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-delay-registrationtriggertype-element">Delay</a> element of the Task Scheduler schema.
     * 
     * If a task with a delayed registration trigger is registered, and the computer that the task is registered on is shutdown or restarted during  the delay (before the task runs), then the task will not run and the delay will be lost.
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationtrigger-get_delay
     */
    get_Delay(pDelay) {
        result := ComCall(20, this, BSTR.Ptr, pDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets the amount of time between when the task is registered and when the task is started. (Put)
     * @remarks
     * When reading or writing XML for a task, the boot delay is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-delay-registrationtriggertype-element">Delay</a> element of the Task Scheduler schema.
     * 
     * If a task with a delayed registration trigger is registered, and the computer that the task is registered on is shutdown or restarted during  the delay (before the task runs), then the task will not run and the delay will be lost.
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iregistrationtrigger-put_delay
     */
    put_Delay(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(21, this, BSTR, delay, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRegistrationTrigger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Delay := CallbackCreate(GetMethod(implObj, "get_Delay"), flags, 2)
        this.vtbl.put_Delay := CallbackCreate(GetMethod(implObj, "put_Delay"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Delay)
        CallbackFree(this.vtbl.put_Delay)
    }
}
