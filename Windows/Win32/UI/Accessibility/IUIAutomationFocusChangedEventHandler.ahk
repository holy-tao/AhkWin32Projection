#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Exposes a method to handle events that are raised when the keyboard focus moves to another UI Automation element.
 * @remarks
 * This interface is implemented by the application to handle events that were subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addfocuschangedeventhandler">AddFocusChangedEventHandler</a>
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationfocuschangedeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationFocusChangedEventHandler extends IUnknown {
    /**
     * The interface identifier for IUIAutomationFocusChangedEventHandler
     * @type {Guid}
     */
    static IID := Guid("{c270f6b5-5c69-4290-9745-7a7f97169468}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationFocusChangedEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandleFocusChangedEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationFocusChangedEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles the event raised when the keyboard focus moves to a different UI Automation element.
     * @remarks
     * This method is implemented by the application to handle events that were subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addfocuschangedeventhandler">AddFocusChangedEventHandler</a>
     * 
     * 
     * The UI Automation element represented by <i>sender</i> might not have any cached properties or control patterns, depending on whether the application subscribed to this event while a cache request was active.
     * 
     * Adjusting an event handler from within this method is not supported.
     * @param {IUIAutomationElement} sender Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element that has received the focus.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationfocuschangedeventhandler-handlefocuschangedevent
     */
    HandleFocusChangedEvent(sender) {
        result := ComCall(3, this, "ptr", sender, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationFocusChangedEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleFocusChangedEvent := CallbackCreate(GetMethod(implObj, "HandleFocusChangedEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleFocusChangedEvent)
    }
}
