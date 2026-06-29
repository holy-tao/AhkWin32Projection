#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }

/**
 * Contains information about the completion of a download. This interface acts as a parameter to the IDownloadCompletedCallback delegate. The download and installation of the update is asynchronous.
 * @remarks
 * The <b>IDownloadCompletedCallbackArgs</b> interface is reserved for future use. It has no properties or methods.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-idownloadcompletedcallbackargs
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IDownloadCompletedCallbackArgs extends IDispatch {
    /**
     * The interface identifier for IDownloadCompletedCallbackArgs
     * @type {Guid}
     */
    static IID := Guid("{fa565b23-498c-47a0-979d-e7d5b1813360}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDownloadCompletedCallbackArgs interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDownloadCompletedCallbackArgs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IDownloadCompletedCallbackArgs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
