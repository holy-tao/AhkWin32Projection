#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\UIA_EVENT_ID.ahk" { UIA_EVENT_ID }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Exposes a method to handle Microsoft UI Automation events.
 * @remarks
 * This interface is implemented by the application to handle events that it has subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addautomationeventhandler">AddAutomationEventHandler</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationEventHandler extends IUnknown {
    /**
     * The interface identifier for IUIAutomationEventHandler
     * @type {Guid}
     */
    static IID := Guid("{146c3c17-f12e-4e22-8c27-f894b9b79c69}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandleAutomationEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles a Microsoft UI Automation event.
     * @remarks
     * This method is implemented by the application to handle events that it has subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addautomationeventhandler">AddAutomationEventHandler</a>.
     * 			
     * 
     * Adjusting an event handler from within this method is not supported.
     * @param {IUIAutomationElement} sender Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to  the element that raised the event.
     * @param {UIA_EVENT_ID} eventId Type: <b>EVENTID</b>
     * 
     * The event identifier. For a list of event identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationeventhandler-handleautomationevent
     */
    HandleAutomationEvent(sender, eventId) {
        result := ComCall(3, this, "ptr", sender, UIA_EVENT_ID, eventId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleAutomationEvent := CallbackCreate(GetMethod(implObj, "HandleAutomationEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleAutomationEvent)
    }
}
