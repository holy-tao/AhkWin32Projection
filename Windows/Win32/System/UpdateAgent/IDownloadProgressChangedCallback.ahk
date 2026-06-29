#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDownloadJob.ahk" { IDownloadJob }
#Import ".\IDownloadProgressChangedCallbackArgs.ahk" { IDownloadProgressChangedCallbackArgs }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Handles the notification that indicates a change in the progress of an asynchronous download operation.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-idownloadprogresschangedcallback
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IDownloadProgressChangedCallback extends IUnknown {
    /**
     * The interface identifier for IDownloadProgressChangedCallback
     * @type {Guid}
     */
    static IID := Guid("{8c3f1cdd-6173-4591-aebd-a56a53ca77c1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDownloadProgressChangedCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Invoke : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDownloadProgressChangedCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles the notification of a change in the progress of an asynchronous download that was initiated by calling the IUpdateDownloader.BeginDownload method.
     * @param {IDownloadJob} downloadJob An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadjob">IDownloadJob</a> interface that contains download information.
     * @param {IDownloadProgressChangedCallbackArgs} callbackArgs An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadprogresschangedcallbackargs">IDownloadProgressChangedCallbackArgs</a> interface that contains download progress data.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns   a COM or Windows error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogresschangedcallback-invoke
     */
    Invoke(downloadJob, callbackArgs) {
        result := ComCall(3, this, "ptr", downloadJob, "ptr", callbackArgs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDownloadProgressChangedCallback.IID.Equals(iid)) {
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
