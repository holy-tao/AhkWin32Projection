#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationClientConnectionCallback.ahk" { IUIAutomationClientConnectionCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationClientInfoSource extends IUnknown {
    /**
     * The interface identifier for IUIAutomationClientInfoSource
     * @type {Guid}
     */
    static IID := Guid("{f4b8a2e1-9c3d-4a7e-8f6b-2d5e4c1a9b8f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationClientInfoSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterClientConnectionCallback   : IntPtr
        UnregisterClientConnectionCallback : IntPtr
        GetConnectedClients                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationClientInfoSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUIAutomationClientConnectionCallback} callback 
     * @returns {Integer} 
     */
    RegisterClientConnectionCallback(callback) {
        result := ComCall(3, this, "ptr", callback, "uint*", &_handle := 0, "HRESULT")
        return _handle
    }

    /**
     * 
     * @param {Integer} _handle 
     * @returns {HRESULT} 
     */
    UnregisterClientConnectionCallback(_handle) {
        result := ComCall(4, this, "uint", _handle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     */
    GetConnectedClients() {
        result := ComCall(5, this, "ptr*", &clients := 0, "HRESULT")
        return clients
    }

    Query(iid) {
        if (IUIAutomationClientInfoSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterClientConnectionCallback := CallbackCreate(GetMethod(implObj, "RegisterClientConnectionCallback"), flags, 3)
        this.vtbl.UnregisterClientConnectionCallback := CallbackCreate(GetMethod(implObj, "UnregisterClientConnectionCallback"), flags, 2)
        this.vtbl.GetConnectedClients := CallbackCreate(GetMethod(implObj, "GetConnectedClients"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterClientConnectionCallback)
        CallbackFree(this.vtbl.UnregisterClientConnectionCallback)
        CallbackFree(this.vtbl.GetConnectedClients)
    }
}
