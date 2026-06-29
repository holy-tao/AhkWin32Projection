#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDownloadProgress.ahk" { IDownloadProgress }

/**
 * Contains information about the change in the progress of an asynchronous download operation.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-idownloadprogresschangedcallbackargs
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IDownloadProgressChangedCallbackArgs extends IDispatch {
    /**
     * The interface identifier for IDownloadProgressChangedCallbackArgs
     * @type {Guid}
     */
    static IID := Guid("{324ff2c6-4981-4b04-9412-57481745ab24}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDownloadProgressChangedCallbackArgs interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Progress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDownloadProgressChangedCallbackArgs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDownloadProgress} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * Gets an interface that contains the progress of the asynchronous download at the time that the callback was made.
     * @returns {IDownloadProgress} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogresschangedcallbackargs-get_progress
     */
    get_Progress() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IDownloadProgress(retval)
    }

    Query(iid) {
        if (IDownloadProgressChangedCallbackArgs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Progress := CallbackCreate(GetMethod(implObj, "get_Progress"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Progress)
    }
}
