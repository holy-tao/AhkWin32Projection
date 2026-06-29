#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDownloadJob.ahk" { IDownloadJob }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDownloadCompletedCallbackArgs.ahk" { IDownloadCompletedCallbackArgs }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides the callback that is used when an asynchronous download is completed.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-idownloadcompletedcallback
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IDownloadCompletedCallback extends IUnknown {
    /**
     * The interface identifier for IDownloadCompletedCallback
     * @type {Guid}
     */
    static IID := Guid("{77254866-9f5b-4c8e-b9e2-c77a8530d64b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDownloadCompletedCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Invoke : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDownloadCompletedCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the caller that the download is complete.
     * @param {IDownloadJob} downloadJob An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadjob">IDownloadJob</a> interface that contains download information.
     * @param {IDownloadCompletedCallbackArgs} callbackArgs This parameter is reserved for future use and can be ignored.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadcompletedcallback-invoke
     */
    Invoke(downloadJob, callbackArgs) {
        result := ComCall(3, this, "ptr", downloadJob, "ptr", callbackArgs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDownloadCompletedCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Invoke)
    }
}
