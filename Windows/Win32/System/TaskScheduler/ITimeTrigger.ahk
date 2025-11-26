#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITrigger.ahk

/**
 * Represents a trigger that starts a task at a specific date and time.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element">StartBoundary</a> element is a required element for time and calendar triggers (<a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-timetrigger-triggergroup-element">TimeTrigger</a> and <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-calendartrigger-triggergroup-element">CalendarTrigger</a>).
 * 
 * When reading or writing  XML for a task, an idle trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-timetrigger-triggergroup-element">TimeTrigger</a> element of the Task Scheduler schema.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itimetrigger
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITimeTrigger extends ITrigger{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimeTrigger
     * @type {Guid}
     */
    static IID => Guid("{b45747e0-eba7-4276-9f29-85c5bb300006}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RandomDelay", "put_RandomDelay"]

    /**
     */
    RandomDelay {
        get => this.get_RandomDelay()
        set => this.put_RandomDelay(value)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRandomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itimetrigger-get_randomdelay
     */
    get_RandomDelay(pRandomDelay) {
        result := ComCall(20, this, "ptr", pRandomDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} randomDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itimetrigger-put_randomdelay
     */
    put_RandomDelay(randomDelay) {
        randomDelay := randomDelay is String ? BSTR.Alloc(randomDelay).Value : randomDelay

        result := ComCall(21, this, "ptr", randomDelay, "HRESULT")
        return result
    }
}
