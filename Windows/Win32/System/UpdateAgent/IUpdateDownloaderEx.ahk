#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDownloadResult.ahk" { IDownloadResult }
#Import ".\IDownloadJob.ahk" { IDownloadJob }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\DownloadType.ahk" { DownloadType }
#Import ".\IUpdateDownloader.ahk" { IUpdateDownloader }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateDownloaderEx extends IUpdateDownloader {
    /**
     * The interface identifier for IUpdateDownloaderEx
     * @type {Guid}
     */
    static IID := Guid("{94726306-f12a-482a-a774-fb4f870d98c0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateDownloaderEx interfaces
    */
    struct Vtbl extends IUpdateDownloader.Vtbl {
        BeginDownload2 : IntPtr
        Download2      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateDownloaderEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {DownloadType} _downloadType 
     * @param {IUnknown} onProgressChanged 
     * @param {IUnknown} onCompleted 
     * @param {VARIANT} state 
     * @returns {IDownloadJob} 
     */
    BeginDownload2(_downloadType, onProgressChanged, onCompleted, state) {
        result := ComCall(18, this, DownloadType, _downloadType, "ptr", onProgressChanged, "ptr", onCompleted, VARIANT, state, "ptr*", &retval := 0, "HRESULT")
        return IDownloadJob(retval)
    }

    /**
     * 
     * @param {DownloadType} _downloadType 
     * @returns {IDownloadResult} 
     */
    Download2(_downloadType) {
        result := ComCall(19, this, DownloadType, _downloadType, "ptr*", &retval := 0, "HRESULT")
        return IDownloadResult(retval)
    }

    Query(iid) {
        if (IUpdateDownloaderEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginDownload2 := CallbackCreate(GetMethod(implObj, "BeginDownload2"), flags, 6)
        this.vtbl.Download2 := CallbackCreate(GetMethod(implObj, "Download2"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginDownload2)
        CallbackFree(this.vtbl.Download2)
    }
}
