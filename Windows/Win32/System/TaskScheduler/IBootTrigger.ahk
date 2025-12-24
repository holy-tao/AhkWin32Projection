#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a task when the system is started.
 * @remarks
 * 
 * The Task Scheduler service is started when the operating system is booted, and boot trigger tasks are set to start when the Task Scheduler service starts.
 * 
 * Only a member of the Administrators group can create a task with a boot trigger.
 * 
 * When creating your own XML for a task, a boot trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-boottrigger-triggergroup-element">BootTrigger</a> element of the Task Scheduler schema.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iboottrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IBootTrigger extends ITrigger{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBootTrigger
     * @type {Guid}
     */
    static IID => Guid("{2a9c35da-d357-41f4-bbc1-207ac1b1f3cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Delay", "put_Delay"]

    /**
     */
    Delay {
        get => this.get_Delay()
        set => this.put_Delay(value)
    }

    /**
     * Gets or sets a value that indicates the amount of time between when the system is booted and when the task is started.
     * @remarks
     * 
     * When reading or writing your own XML for a task, the boot delay is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-delay-boottriggertype-element">Delay</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iboottrigger-get_delay
     */
    get_Delay(pDelay) {
        result := ComCall(20, this, "ptr", pDelay, "HRESULT")
        return result
    }

    /**
     * Gets or sets a value that indicates the amount of time between when the system is booted and when the task is started.
     * @remarks
     * 
     * When reading or writing your own XML for a task, the boot delay is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-delay-boottriggertype-element">Delay</a> element of the Task Scheduler schema.
     * 
     * 
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-iboottrigger-put_delay
     */
    put_Delay(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(21, this, "ptr", delay, "HRESULT")
        return result
    }
}
