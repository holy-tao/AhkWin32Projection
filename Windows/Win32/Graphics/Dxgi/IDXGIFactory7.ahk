#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDXGIFactory6.ahk" { IDXGIFactory6 }

/**
 * This interface enables registration for notifications to detect adapter enumeration state changes.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/nn-dxgi1_6-idxgifactory7
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIFactory7 extends IDXGIFactory6 {
    /**
     * The interface identifier for IDXGIFactory7
     * @type {Guid}
     */
    static IID := Guid("{a4966eed-76db-44da-84c1-ee9a7afb20a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIFactory7 interfaces
    */
    struct Vtbl extends IDXGIFactory6.Vtbl {
        RegisterAdaptersChangedEvent   : IntPtr
        UnregisterAdaptersChangedEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIFactory7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers to receive notification of changes whenever the adapter enumeration state changes.
     * @param {HANDLE} hEvent A handle to the event object.
     * @returns {Integer} A key value for the registered event.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/nf-dxgi1_6-idxgifactory7-registeradapterschangedevent
     */
    RegisterAdaptersChangedEvent(hEvent) {
        result := ComCall(30, this, HANDLE, hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Unregisters an event to stop receiving notifications when the adapter enumeration state changes.
     * @param {Integer} dwCookie A key value for the event to unregister.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_6/nf-dxgi1_6-idxgifactory7-unregisteradapterschangedevent
     */
    UnregisterAdaptersChangedEvent(dwCookie) {
        result := ComCall(31, this, "uint", dwCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDXGIFactory7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterAdaptersChangedEvent := CallbackCreate(GetMethod(implObj, "RegisterAdaptersChangedEvent"), flags, 3)
        this.vtbl.UnregisterAdaptersChangedEvent := CallbackCreate(GetMethod(implObj, "UnregisterAdaptersChangedEvent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterAdaptersChangedEvent)
        CallbackFree(this.vtbl.UnregisterAdaptersChangedEvent)
    }
}
