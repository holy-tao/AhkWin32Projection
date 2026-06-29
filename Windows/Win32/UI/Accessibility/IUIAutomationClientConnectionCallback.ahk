#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationClientInfo.ahk" { IUIAutomationClientInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationClientConnectionCallback extends IUnknown {
    /**
     * The interface identifier for IUIAutomationClientConnectionCallback
     * @type {Guid}
     */
    static IID := Guid("{5b8e8f2a-9c7d-4f3e-a1b2-8d6e9f4c0a1b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationClientConnectionCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnConnected    : IntPtr
        OnDisconnected : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationClientConnectionCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUIAutomationClientInfo} clientInfo 
     * @returns {HRESULT} 
     */
    OnConnected(clientInfo) {
        result := ComCall(3, this, "ptr", clientInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationClientInfo} clientInfo 
     * @returns {HRESULT} 
     */
    OnDisconnected(clientInfo) {
        result := ComCall(4, this, "ptr", clientInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationClientConnectionCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnConnected := CallbackCreate(GetMethod(implObj, "OnConnected"), flags, 2)
        this.vtbl.OnDisconnected := CallbackCreate(GetMethod(implObj, "OnDisconnected"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnConnected)
        CallbackFree(this.vtbl.OnDisconnected)
    }
}
