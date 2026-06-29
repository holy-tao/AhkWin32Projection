#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintAsyncNotifyRegistration extends IUnknown {
    /**
     * The interface identifier for IPrintAsyncNotifyRegistration
     * @type {Guid}
     */
    static IID := Guid("{0f6f27b6-6f86-4591-9203-64c3bfadedfe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintAsyncNotifyRegistration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterForNotifications   : IntPtr
        UnregisterForNotifications : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintAsyncNotifyRegistration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RegisterForNotifications() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnregisterForNotifications() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintAsyncNotifyRegistration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterForNotifications := CallbackCreate(GetMethod(implObj, "RegisterForNotifications"), flags, 1)
        this.vtbl.UnregisterForNotifications := CallbackCreate(GetMethod(implObj, "UnregisterForNotifications"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterForNotifications)
        CallbackFree(this.vtbl.UnregisterForNotifications)
    }
}
