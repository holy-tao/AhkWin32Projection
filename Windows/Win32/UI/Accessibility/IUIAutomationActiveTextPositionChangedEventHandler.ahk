#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationTextRange.ahk" { IUIAutomationTextRange }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Exposes a method to handle Microsoft UI Automation events that occur when the active text position changes.
 * @remarks
 * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationactivetextpositionchangedeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationActiveTextPositionChangedEventHandler extends IUnknown {
    /**
     * The interface identifier for IUIAutomationActiveTextPositionChangedEventHandler
     * @type {Guid}
     */
    static IID := Guid("{f97933b0-8dae-4496-8997-5ba015fe0d82}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationActiveTextPositionChangedEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandleActiveTextPositionChangedEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationActiveTextPositionChangedEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles a Microsoft UI Automation active text position change event.
     * @remarks
     * Before implementing an event handler, you should be familiar with the threading issues described in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-threading">Understanding Threading Issues</a>.
     * @param {IUIAutomationElement} sender A pointer to the UI Automation element that raised the event.
     * @param {IUIAutomationTextRange} range A span of continuous text in a container that supports the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern">IUIAutomationTextPattern</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationactivetextpositionchangedeventhandler-handleactivetextpositionchangedevent
     */
    HandleActiveTextPositionChangedEvent(sender, range) {
        result := ComCall(3, this, "ptr", sender, "ptr", range, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationActiveTextPositionChangedEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleActiveTextPositionChangedEvent := CallbackCreate(GetMethod(implObj, "HandleActiveTextPositionChangedEvent"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleActiveTextPositionChangedEvent)
    }
}
