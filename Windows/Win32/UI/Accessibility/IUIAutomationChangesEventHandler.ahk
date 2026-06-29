#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UiaChangeInfo.ahk" { UiaChangeInfo }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Exposes a method to handle one or more Microsoft UI Automation change events.
 * @remarks
 * This interface is implemented by the application to handle events that it has subscribed to by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation4-addchangeseventhandler">AddChangesEventHandler</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationchangeseventhandler
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationChangesEventHandler extends IUnknown {
    /**
     * The interface identifier for IUIAutomationChangesEventHandler
     * @type {Guid}
     */
    static IID := Guid("{58edca55-2c3e-4980-b1b9-56c17f27a2a0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationChangesEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandleChangesEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationChangesEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles one or more Microsoft UI Automation change events.
     * @remarks
     * This method is implemented by the application to handle events that it has subscribed to by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation4-addchangeseventhandler">AddChangesEventHandler</a>.
     * @param {IUIAutomationElement} sender A pointer to the element that raised the event.
     * @param {Pointer<UiaChangeInfo>} uiaChanges A collection of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiachangeinfo">UiaChangeInfo</a> structures.
     * @param {Integer} changesCount The number of changes that occurred. This is the number of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiachangeinfo">UiaChangeInfo</a> structures pointed to by the <i>uiaChanges</i> parameter.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationchangeseventhandler-handlechangesevent
     */
    HandleChangesEvent(sender, uiaChanges, changesCount) {
        result := ComCall(3, this, "ptr", sender, UiaChangeInfo.Ptr, uiaChanges, "int", changesCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationChangesEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleChangesEvent := CallbackCreate(GetMethod(implObj, "HandleChangesEvent"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleChangesEvent)
    }
}
