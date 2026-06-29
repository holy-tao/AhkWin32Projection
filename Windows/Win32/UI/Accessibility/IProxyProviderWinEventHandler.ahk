#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IProxyProviderWinEventSink.ahk" { IProxyProviderWinEventSink }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that is implemented by proxy providers to handle WinEvents.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iproxyproviderwineventhandler
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IProxyProviderWinEventHandler extends IUnknown {
    /**
     * The interface identifier for IProxyProviderWinEventHandler
     * @type {Guid}
     */
    static IID := Guid("{89592ad4-f4e0-43d5-a3b6-bad7e111b435}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProxyProviderWinEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RespondToWinEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProxyProviderWinEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles a WinEvent.
     * @remarks
     * The provider should review the event data. If the provider needs to raise a UI Automation event in response, the data for that event should be added to the <i>pSink</i> event sink.
     * @param {Integer} idWinEvent Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The identifier of the incoming WinEvent. For a list of WinEvent IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/event-constants">Event Constants</a>.
     * @param {HWND} _hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The handle of the window for which the WinEvent was fired. This should also be the window for which the proxy was created.
     * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The object identifier (OBJID_*) of the accessible object associated with the event. For a list of object identifiers, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-identifiers">Object Identifiers</a>.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * The child identifier of the element associated with the event, or <b>CHILDID_SELF</b> if the element is not a child.
     * @param {IProxyProviderWinEventSink} pSink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iproxyproviderwineventsink">IProxyProviderWinEventSink</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iproxyproviderwineventsink">IProxyProviderWinEventSink</a> interface provided by the UI Automation core. Any event that the proxy needs to raise in response to the WinEvent being handled should be added to the sink.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iproxyproviderwineventhandler-respondtowinevent
     */
    RespondToWinEvent(idWinEvent, _hwnd, idObject, idChild, pSink) {
        result := ComCall(3, this, "uint", idWinEvent, HWND, _hwnd, "int", idObject, "int", idChild, "ptr", pSink, "HRESULT")
        return result
    }

    Query(iid) {
        if (IProxyProviderWinEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RespondToWinEvent := CallbackCreate(GetMethod(implObj, "RespondToWinEvent"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RespondToWinEvent)
    }
}
