#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DownloadPhase.ahk" { DownloadPhase }
#Import ".\IUpdateDownloadResult.ahk" { IUpdateDownloadResult }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\DECIMAL.ahk" { DECIMAL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents the progress of an asynchronous download operation.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-idownloadprogress
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IDownloadProgress extends IDispatch {
    /**
     * The interface identifier for IDownloadProgress
     * @type {Guid}
     */
    static IID := Guid("{d31a5bac-f719-4178-9dbb-5e2cb47fd18a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDownloadProgress interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CurrentUpdateBytesDownloaded : IntPtr
        get_CurrentUpdateBytesToDownload : IntPtr
        get_CurrentUpdateIndex           : IntPtr
        get_PercentComplete              : IntPtr
        get_TotalBytesDownloaded         : IntPtr
        get_TotalBytesToDownload         : IntPtr
        GetUpdateResult                  : IntPtr
        get_CurrentUpdateDownloadPhase   : IntPtr
        get_CurrentUpdatePercentComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDownloadProgress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {DECIMAL} 
     */
    CurrentUpdateBytesDownloaded {
        get => this.get_CurrentUpdateBytesDownloaded()
    }

    /**
     * @type {DECIMAL} 
     */
    CurrentUpdateBytesToDownload {
        get => this.get_CurrentUpdateBytesToDownload()
    }

    /**
     * @type {Integer} 
     */
    CurrentUpdateIndex {
        get => this.get_CurrentUpdateIndex()
    }

    /**
     * @type {Integer} 
     */
    PercentComplete {
        get => this.get_PercentComplete()
    }

    /**
     * @type {DECIMAL} 
     */
    TotalBytesDownloaded {
        get => this.get_TotalBytesDownloaded()
    }

    /**
     * @type {DECIMAL} 
     */
    TotalBytesToDownload {
        get => this.get_TotalBytesToDownload()
    }

    /**
     * @type {DownloadPhase} 
     */
    CurrentUpdateDownloadPhase {
        get => this.get_CurrentUpdateDownloadPhase()
    }

    /**
     * @type {Integer} 
     */
    CurrentUpdatePercentComplete {
        get => this.get_CurrentUpdatePercentComplete()
    }

    /**
     * Gets a string that specifies how much data has been transferred for the content file or files of the update that is being downloaded, in bytes.
     * @returns {DECIMAL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_currentupdatebytesdownloaded
     */
    get_CurrentUpdateBytesDownloaded() {
        retval := DECIMAL()
        result := ComCall(7, this, DECIMAL.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a string that estimates how much data should be transferred for the content file or files of the update that is being downloaded, in bytes.
     * @returns {DECIMAL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_currentupdatebytestodownload
     */
    get_CurrentUpdateBytesToDownload() {
        retval := DECIMAL()
        result := ComCall(8, this, DECIMAL.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a zero-based index value that specifies the update that is currently being downloaded when multiple updates have been selected.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_currentupdateindex
     */
    get_CurrentUpdateIndex() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an estimate of the percentage of all the updates that have been downloaded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_percentcomplete
     */
    get_PercentComplete() {
        result := ComCall(10, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a string that specifies the total amount of data that has been downloaded, in bytes.
     * @returns {DECIMAL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_totalbytesdownloaded
     */
    get_TotalBytesDownloaded() {
        retval := DECIMAL()
        result := ComCall(11, this, DECIMAL.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets a string that represents the estimate of the total amount of data that will be downloaded, in bytes.
     * @returns {DECIMAL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_totalbytestodownload
     */
    get_TotalBytesToDownload() {
        retval := DECIMAL()
        result := ComCall(12, this, DECIMAL.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Returns the result of the download of a specified update.
     * @param {Integer} updateIndex A zero-based index value that specifies an update.
     * @returns {IUpdateDownloadResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatedownloadresult">IUpdateDownloadResult</a> interface that contains information about the specified update.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-getupdateresult
     */
    GetUpdateResult(updateIndex) {
        result := ComCall(13, this, "int", updateIndex, "ptr*", &retval := 0, "HRESULT")
        return IUpdateDownloadResult(retval)
    }

    /**
     * Gets a DownloadPhase enumeration value that specifies the phase of the download that is currently in progress.
     * @returns {DownloadPhase} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_currentupdatedownloadphase
     */
    get_CurrentUpdateDownloadPhase() {
        result := ComCall(14, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an estimate of the percentage of the current update that has been downloaded.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_currentupdatepercentcomplete
     */
    get_CurrentUpdatePercentComplete() {
        result := ComCall(15, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IDownloadProgress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentUpdateBytesDownloaded := CallbackCreate(GetMethod(implObj, "get_CurrentUpdateBytesDownloaded"), flags, 2)
        this.vtbl.get_CurrentUpdateBytesToDownload := CallbackCreate(GetMethod(implObj, "get_CurrentUpdateBytesToDownload"), flags, 2)
        this.vtbl.get_CurrentUpdateIndex := CallbackCreate(GetMethod(implObj, "get_CurrentUpdateIndex"), flags, 2)
        this.vtbl.get_PercentComplete := CallbackCreate(GetMethod(implObj, "get_PercentComplete"), flags, 2)
        this.vtbl.get_TotalBytesDownloaded := CallbackCreate(GetMethod(implObj, "get_TotalBytesDownloaded"), flags, 2)
        this.vtbl.get_TotalBytesToDownload := CallbackCreate(GetMethod(implObj, "get_TotalBytesToDownload"), flags, 2)
        this.vtbl.GetUpdateResult := CallbackCreate(GetMethod(implObj, "GetUpdateResult"), flags, 3)
        this.vtbl.get_CurrentUpdateDownloadPhase := CallbackCreate(GetMethod(implObj, "get_CurrentUpdateDownloadPhase"), flags, 2)
        this.vtbl.get_CurrentUpdatePercentComplete := CallbackCreate(GetMethod(implObj, "get_CurrentUpdatePercentComplete"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentUpdateBytesDownloaded)
        CallbackFree(this.vtbl.get_CurrentUpdateBytesToDownload)
        CallbackFree(this.vtbl.get_CurrentUpdateIndex)
        CallbackFree(this.vtbl.get_PercentComplete)
        CallbackFree(this.vtbl.get_TotalBytesDownloaded)
        CallbackFree(this.vtbl.get_TotalBytesToDownload)
        CallbackFree(this.vtbl.GetUpdateResult)
        CallbackFree(this.vtbl.get_CurrentUpdateDownloadPhase)
        CallbackFree(this.vtbl.get_CurrentUpdatePercentComplete)
    }
}
