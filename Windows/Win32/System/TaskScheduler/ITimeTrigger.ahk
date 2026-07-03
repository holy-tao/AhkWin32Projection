#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITrigger.ahk" { ITrigger }

/**
 * Represents a trigger that starts a task at a specific date and time.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element">StartBoundary</a> element is a required element for time and calendar triggers (<a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-timetrigger-triggergroup-element">TimeTrigger</a> and <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-calendartrigger-triggergroup-element">CalendarTrigger</a>).
 * 
 * When reading or writing  XML for a task, an idle trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-timetrigger-triggergroup-element">TimeTrigger</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-itimetrigger
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ITimeTrigger extends ITrigger {
    /**
     * The interface identifier for ITimeTrigger
     * @type {Guid}
     */
    static IID := Guid("{b45747e0-eba7-4276-9f29-85c5bb300006}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITimeTrigger interfaces
    */
    struct Vtbl extends ITrigger.Vtbl {
        get_RandomDelay : IntPtr
        put_RandomDelay : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITimeTrigger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    RandomDelay {
        get => this.get_RandomDelay()
        set => this.put_RandomDelay(value)
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger. (ITimeTrigger.get_RandomDelay)
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itimetrigger-get_randomdelay
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(20, this, BSTR.Ptr, pRandomDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a delay time that is randomly added to the start time of the trigger. (ITimeTrigger.put_RandomDelay)
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itimetrigger-put_randomdelay
     */
    put_RandomDelay(randomDelay) {
        randomDelay := randomDelay is String ? BSTR.Alloc(randomDelay).Value : randomDelay

        result := ComCall(21, this, BSTR, randomDelay, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITimeTrigger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RandomDelay := CallbackCreate(GetMethod(implObj, "get_RandomDelay"), flags, 2)
        this.vtbl.put_RandomDelay := CallbackCreate(GetMethod(implObj, "put_RandomDelay"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RandomDelay)
        CallbackFree(this.vtbl.put_RandomDelay)
    }
}
