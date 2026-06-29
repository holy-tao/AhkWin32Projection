#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITrigger.ahk" { ITrigger }

/**
 * Represents a trigger that starts a task when the system is started.
 * @remarks
 * The Task Scheduler service is started when the operating system is booted, and boot trigger tasks are set to start when the Task Scheduler service starts.
 * 
 * Only a member of the Administrators group can create a task with a boot trigger.
 * 
 * When creating your own XML for a task, a boot trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-boottrigger-triggergroup-element">BootTrigger</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-iboottrigger
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IBootTrigger extends ITrigger {
    /**
     * The interface identifier for IBootTrigger
     * @type {Guid}
     */
    static IID := Guid("{2a9c35da-d357-41f4-bbc1-207ac1b1f3cb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBootTrigger interfaces
    */
    struct Vtbl extends ITrigger.Vtbl {
        get_Delay : IntPtr
        put_Delay : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBootTrigger.Vtbl()
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
     * Gets or sets a value that indicates the amount of time between when the system is booted and when the task is started. (Get)
     * @remarks
     * When reading or writing your own XML for a task, the boot delay is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-delay-boottriggertype-element">Delay</a> element of the Task Scheduler schema.
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iboottrigger-get_delay
     */
    get_Delay(pDelay) {
        result := ComCall(20, this, BSTR.Ptr, pDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates the amount of time between when the system is booted and when the task is started. (Put)
     * @remarks
     * When reading or writing your own XML for a task, the boot delay is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-delay-boottriggertype-element">Delay</a> element of the Task Scheduler schema.
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-iboottrigger-put_delay
     */
    put_Delay(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(21, this, BSTR, delay, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBootTrigger.IID.Equals(iid)) {
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
