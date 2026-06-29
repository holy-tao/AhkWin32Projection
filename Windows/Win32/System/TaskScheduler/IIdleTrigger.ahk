#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITrigger.ahk" { ITrigger }

/**
 * Represents a trigger that starts a task when the computer goes into an idle state.
 * @remarks
 * An idle trigger will only trigger a task action if the computer goes into an idle state after the start boundary of the trigger.
 * 
 * 
 * When creating your own XML for a task, an idle trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-idletrigger-triggergroup-element">IdleTrigger</a> element of the Task Scheduler schema.
 * 
 * If a task is triggered by an idle trigger, then the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iidlesettings-get_waittimeout">WaitTimeout</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iidlesettings">IIdleSettings</a> interface is ignored.
 * 
 * If the initial instance of a task with an idle trigger is still running, then the task is only launched once with no repetitions, even if multiple repetition is defined in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_repetition">Repetition</a> property. This behavior does not occur if the task stops by itself.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-iidletrigger
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct IIdleTrigger extends ITrigger {
    /**
     * The interface identifier for IIdleTrigger
     * @type {Guid}
     */
    static IID := Guid("{d537d2b0-9fb3-4d34-9739-1ff5ce7b1ef3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIdleTrigger interfaces
    */
    struct Vtbl extends ITrigger.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIdleTrigger.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IIdleTrigger.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
