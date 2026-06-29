#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintAsyncNotifyRegistration.ahk" { IPrintAsyncNotifyRegistration }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintAsyncNewChannelCookie.ahk" { IPrintAsyncNewChannelCookie }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintBidiAsyncNotifyRegistration extends IPrintAsyncNotifyRegistration {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintBidiAsyncNotifyRegistration interfaces
    */
    struct Vtbl extends IPrintAsyncNotifyRegistration.Vtbl {
        AsyncGetNewChannel : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintBidiAsyncNotifyRegistration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IPrintAsyncNewChannelCookie} param0 
     * @returns {HRESULT} 
     */
    AsyncGetNewChannel(param0) {
        result := ComCall(5, this, "ptr", param0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintBidiAsyncNotifyRegistration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AsyncGetNewChannel := CallbackCreate(GetMethod(implObj, "AsyncGetNewChannel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AsyncGetNewChannel)
    }
}
