#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\StructureChangeType.ahk" { StructureChangeType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Exposes a method to handle events that occur when the Microsoft UI Automation tree structure is changed.
 * @remarks
 * This interface is implemented by the application to handle events that it has subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addstructurechangedeventhandler">AddStructureChangedEventHandler</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationstructurechangedeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationStructureChangedEventHandler extends IUnknown {
    /**
     * The interface identifier for IUIAutomationStructureChangedEventHandler
     * @type {Guid}
     */
    static IID := Guid("{e81d1b4e-11c5-42f8-9754-e7036c79f054}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationStructureChangedEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandleStructureChangedEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationStructureChangedEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles an event that is raised when the Microsoft UI Automation tree structure has changed.
     * @remarks
     * This method is implemented by the application to handle events that it has subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addstructurechangedeventhandler">AddStructureChangedEventHandler</a>
     * 
     * 
     * Adjusting an event handler from within this method is not supported.
     * @param {IUIAutomationElement} sender Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element that raised the event.
     * @param {StructureChangeType} _changeType 
     * @param {Pointer<SAFEARRAY>} runtimeId Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * Receives the runtime identifier of the element. This parameter is used only when <i>changeType</i> is <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-structurechangetype">StructureChangeType_ChildRemoved</a>; it is <b>NULL</b> for all other structure-change events.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationstructurechangedeventhandler-handlestructurechangedevent
     */
    HandleStructureChangedEvent(sender, _changeType, runtimeId) {
        result := ComCall(3, this, "ptr", sender, StructureChangeType, _changeType, SAFEARRAY.Ptr, runtimeId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationStructureChangedEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleStructureChangedEvent := CallbackCreate(GetMethod(implObj, "HandleStructureChangedEvent"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleStructureChangedEvent)
    }
}
