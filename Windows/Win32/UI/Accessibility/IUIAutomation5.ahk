#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationCacheRequest.ahk" { IUIAutomationCacheRequest }
#Import ".\IUIAutomationNotificationEventHandler.ahk" { IUIAutomationNotificationEventHandler }
#Import ".\IUIAutomation4.ahk" { IUIAutomation4 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TreeScope.ahk" { TreeScope }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Extends the IUIAutomation4 interface to expose additional methods for controlling Microsoft UI Automation functionality.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomation5
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomation5 extends IUIAutomation4 {
    /**
     * The interface identifier for IUIAutomation5
     * @type {Guid}
     */
    static IID := Guid("{25f700c8-d816-4057-a9dc-3cbdee77e256}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomation5 interfaces
    */
    struct Vtbl extends IUIAutomation4.Vtbl {
        AddNotificationEventHandler    : IntPtr
        RemoveNotificationEventHandler : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomation5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers a method that handles notification events.Note  Before implementing an event handler, you should be familiar with the threading issues described in Understanding Threading Issues.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element associated with the event handler.
     * @param {TreeScope} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationNotificationEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationnotificationeventhandler">IUIAutomationNotificationEventHandler</a>*</b>
     * 
     * A pointer to the object that handles the notification event.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation5-addnotificationeventhandler
     */
    AddNotificationEventHandler(element, scope, cacheRequest, handler) {
        result := ComCall(68, this, "ptr", element, TreeScope, scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Removes a notification event handler.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element from which to remove the handler.
     * @param {IUIAutomationNotificationEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationnotificationeventhandler">IUIAutomationNotificationEventHandler</a>*</b>
     * 
     * A pointer to the  interface that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation5-addnotificationeventhandler">AddNotificationEventHandler</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation5-removenotificationeventhandler
     */
    RemoveNotificationEventHandler(element, handler) {
        result := ComCall(69, this, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomation5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddNotificationEventHandler := CallbackCreate(GetMethod(implObj, "AddNotificationEventHandler"), flags, 5)
        this.vtbl.RemoveNotificationEventHandler := CallbackCreate(GetMethod(implObj, "RemoveNotificationEventHandler"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddNotificationEventHandler)
        CallbackFree(this.vtbl.RemoveNotificationEventHandler)
    }
}
