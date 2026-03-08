#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IActiveIMMMessagePumpOwner extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveIMMMessagePumpOwner
     * @type {Guid}
     */
    static IID => Guid("{b5cf2cfa-8aeb-11d1-9364-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "End", "OnTranslateMessage", "Pause", "Resume"]

    /**
     * Specifies the date and time when the trigger is activated.
     * @remarks
     * The **&lt;StartBoundary&gt;** element is a required element for time and calendar triggers ([**&lt;TimeTrigger&gt;**](taskschedulerschema-timetrigger-triggergroup-element.md) and [**&lt;CalendarTrigger&gt;**](taskschedulerschema-calendartrigger-triggergroup-element.md)).
     * 
     * For scripting development, the end boundary is specified using the [**Trigger.StartBoundary**](trigger-startboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::StartBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary) property that is inherited by the all trigger interfaces.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Specifies the date and time when the trigger is deactivated. The trigger cannot start the task after it is deactivated.
     * @remarks
     * For scripting development, the end boundary is specified using the [**Trigger.EndBoundary**](trigger-endboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::EndBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_endboundary) property that is inherited by the all trigger interfaces.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-endboundary-triggerbasetype-element
     */
    End() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MSG>} pMsg 
     * @returns {HRESULT} 
     */
    OnTranslateMessage(pMsg) {
        result := ComCall(5, this, "ptr", pMsg, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(6, this, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @param {Integer} dwCookie 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume(dwCookie) {
        result := ComCall(7, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
