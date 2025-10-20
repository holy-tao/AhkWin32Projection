#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a task when the computer goes into an idle state.
 * @remarks
 * 
  * An idle trigger will only trigger a task action if the computer goes into an idle state after the start boundary of the trigger.
  * 
  * 
  * When creating your own XML for a task, an idle trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-idletrigger-triggergroup-element">IdleTrigger</a> element of the Task Scheduler schema.
  * 
  * If a task is triggered by an idle trigger, then the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-iidlesettings-get_waittimeout">WaitTimeout</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-iidlesettings">IIdleSettings</a> interface is ignored.
  * 
  * If the initial instance of a task with an idle trigger is still running, then the task is only launched once with no repetitions, even if multiple repetition is defined in the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_repetition">Repetition</a> property. This behavior does not occur if the task stops by itself.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-iidletrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IIdleTrigger extends ITrigger{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIdleTrigger
     * @type {Guid}
     */
    static IID => Guid("{d537d2b0-9fb3-4d34-9739-1ff5ce7b1ef3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
