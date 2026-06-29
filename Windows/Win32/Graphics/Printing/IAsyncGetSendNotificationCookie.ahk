#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintAsyncCookie.ahk" { IPrintAsyncCookie }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintAsyncNotifyDataObject.ahk" { IPrintAsyncNotifyDataObject }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IAsyncGetSendNotificationCookie extends IPrintAsyncCookie {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAsyncGetSendNotificationCookie interfaces
    */
    struct Vtbl extends IPrintAsyncCookie.Vtbl {
        FinishAsyncCallWithData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAsyncGetSendNotificationCookie.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IPrintAsyncNotifyDataObject} param0 
     * @param {BOOL} param1 
     * @returns {HRESULT} 
     */
    FinishAsyncCallWithData(param0, param1) {
        result := ComCall(5, this, "ptr", param0, BOOL, param1, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAsyncGetSendNotificationCookie.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FinishAsyncCallWithData := CallbackCreate(GetMethod(implObj, "FinishAsyncCallWithData"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FinishAsyncCallWithData)
    }
}
