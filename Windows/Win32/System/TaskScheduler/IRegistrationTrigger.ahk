#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a task when the task is registered or updated.
 * @remarks
 * 
  * When creating your own XML for a task, a registration trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-registrationtrigger-triggergroup-element">RegistrationTrigger</a> element of the Task Scheduler schema.
  * 
  * If a task with a delayed registration trigger is registered, and the computer that the task is registered on is shutdown or restarted during  the delay, before the task runs, then the task will not run and the delay will be lost.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iregistrationtrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IRegistrationTrigger extends ITrigger{
    /**
     * The interface identifier for IRegistrationTrigger
     * @type {Guid}
     */
    static IID => Guid("{4c8fec3a-c218-4e0c-b23d-629024db91a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {Pointer<BSTR>} pDelay 
     * @returns {HRESULT} 
     */
    get_Delay(pDelay) {
        result := ComCall(20, this, "ptr", pDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} delay 
     * @returns {HRESULT} 
     */
    put_Delay(delay) {
        delay := delay is String ? BSTR.Alloc(delay).Value : delay

        result := ComCall(21, this, "ptr", delay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
