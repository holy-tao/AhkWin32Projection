#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintAsyncNotifyRegistration.ahk" { IPrintAsyncNotifyRegistration }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAsyncGetSendNotificationCookie.ahk" { IAsyncGetSendNotificationCookie }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintUnidiAsyncNotifyRegistration extends IPrintAsyncNotifyRegistration {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintUnidiAsyncNotifyRegistration interfaces
    */
    struct Vtbl extends IPrintAsyncNotifyRegistration.Vtbl {
        AsyncGetNotification : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintUnidiAsyncNotifyRegistration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IAsyncGetSendNotificationCookie} param0 
     * @returns {HRESULT} 
     */
    AsyncGetNotification(param0) {
        result := ComCall(5, this, "ptr", param0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintUnidiAsyncNotifyRegistration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AsyncGetNotification := CallbackCreate(GetMethod(implObj, "AsyncGetNotification"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AsyncGetNotification)
    }
}
