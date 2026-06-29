#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationCacheRequest.ahk" { IUIAutomationCacheRequest }
#Import ".\IUIAutomationChangesEventHandler.ahk" { IUIAutomationChangesEventHandler }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomation3.ahk" { IUIAutomation3 }
#Import ".\TreeScope.ahk" { TreeScope }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Extends the IUIAutomation3 interface to expose additional methods for controlling Microsoft UI Automation functionality.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomation4
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomation4 extends IUIAutomation3 {
    /**
     * The interface identifier for IUIAutomation4
     * @type {Guid}
     */
    static IID := Guid("{1189c02a-05f8-4319-8e21-e817e3db2860}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomation4 interfaces
    */
    struct Vtbl extends IUIAutomation3.Vtbl {
        AddChangesEventHandler    : IntPtr
        RemoveChangesEventHandler : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomation4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers a method that handles change events.Note  Before implementing an event handler, you should be familiar with the threading issues described in Understanding Threading Issues.
     * @remarks
     * A Microsoft UI Automation client should not use multiple threads to add or remove event handlers. Unexpected behavior can result if one event handler is being added or removed while another is being added or removed in the same client process.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element associated with the event handler.
     * @param {TreeScope} scope 
     * @param {Pointer<Integer>} changeTypes Type: <b>int*</b>
     * 
     * A pointer to a list of integers that indicate the change types the event represents.
     * @param {Integer} changesCount Type: <b>int</b>
     * 
     * The number of changes that occurred in this event.
     * @param {IUIAutomationCacheRequest} pCacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationChangesEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationchangeseventhandler">IUIAutomationChangesEventHandler</a>*</b>
     * 
     * A pointer to the object that handles the changes event.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation4-addchangeseventhandler
     */
    AddChangesEventHandler(element, scope, changeTypes, changesCount, pCacheRequest, handler) {
        changeTypesMarshal := changeTypes is VarRef ? "int*" : "ptr"

        result := ComCall(66, this, "ptr", element, TreeScope, scope, changeTypesMarshal, changeTypes, "int", changesCount, "ptr", pCacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Removes a changes event handler.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element from which to remove the handler.
     * @param {IUIAutomationChangesEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationchangeseventhandler">IUIAutomationChangesEventHandler</a>*</b>
     * 
     * A pointer to the  interface that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation4-addchangeseventhandler">AddChangesEventHandler</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation4-removechangeseventhandler
     */
    RemoveChangesEventHandler(element, handler) {
        result := ComCall(67, this, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomation4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddChangesEventHandler := CallbackCreate(GetMethod(implObj, "AddChangesEventHandler"), flags, 7)
        this.vtbl.RemoveChangesEventHandler := CallbackCreate(GetMethod(implObj, "RemoveChangesEventHandler"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddChangesEventHandler)
        CallbackFree(this.vtbl.RemoveChangesEventHandler)
    }
}
