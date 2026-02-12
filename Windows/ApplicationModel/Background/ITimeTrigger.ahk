#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a trigger that starts a task at a specific date and time.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element">StartBoundary</a> element is a required element for time and calendar triggers (<a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-timetrigger-triggergroup-element">TimeTrigger</a> and <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-calendartrigger-triggergroup-element">CalendarTrigger</a>).
 * 
 * When reading or writing  XML for a task, an idle trigger is specified using the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskschedulerschema-timetrigger-triggergroup-element">TimeTrigger</a> element of the Task Scheduler schema.
 * @see https://learn.microsoft.com/windows/win32/api//content/taskschd/nn-taskschd-itimetrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ITimeTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimeTrigger
     * @type {Guid}
     */
    static IID => Guid("{656e5556-0b2a-4377-ba70-3b45a935547f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FreshnessTime", "get_OneShot"]

    /**
     * @type {Integer} 
     */
    FreshnessTime {
        get => this.get_FreshnessTime()
    }

    /**
     * @type {Boolean} 
     */
    OneShot {
        get => this.get_OneShot()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FreshnessTime() {
        result := ComCall(6, this, "uint*", &freshnessTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return freshnessTime
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OneShot() {
        result := ComCall(7, this, "int*", &oneShot := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return oneShot
    }
}
