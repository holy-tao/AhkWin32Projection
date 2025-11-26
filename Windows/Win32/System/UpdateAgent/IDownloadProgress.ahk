#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\DECIMAL.ahk
#Include .\IUpdateDownloadResult.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the progress of an asynchronous download operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-idownloadprogress
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IDownloadProgress extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadProgress
     * @type {Guid}
     */
    static IID => Guid("{d31a5bac-f719-4178-9dbb-5e2cb47fd18a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentUpdateBytesDownloaded", "get_CurrentUpdateBytesToDownload", "get_CurrentUpdateIndex", "get_PercentComplete", "get_TotalBytesDownloaded", "get_TotalBytesToDownload", "GetUpdateResult", "get_CurrentUpdateDownloadPhase", "get_CurrentUpdatePercentComplete"]

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
     * @type {Integer} 
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
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadprogress-get_currentupdatebytesdownloaded
     */
    get_CurrentUpdateBytesDownloaded() {
        retval := DECIMAL()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets a string that estimates how much data should be transferred for the content file or files of the update that is being downloaded, in bytes.
     * @returns {DECIMAL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadprogress-get_currentupdatebytestodownload
     */
    get_CurrentUpdateBytesToDownload() {
        retval := DECIMAL()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets a zero-based index value that specifies the update that is currently being downloaded when multiple updates have been selected.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadprogress-get_currentupdateindex
     */
    get_CurrentUpdateIndex() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an estimate of the percentage of all the updates that have been downloaded.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadprogress-get_percentcomplete
     */
    get_PercentComplete() {
        result := ComCall(10, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a string that specifies the total amount of data that has been downloaded, in bytes.
     * @returns {DECIMAL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadprogress-get_totalbytesdownloaded
     */
    get_TotalBytesDownloaded() {
        retval := DECIMAL()
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets a string that represents the estimate of the total amount of data that will be downloaded, in bytes.
     * @returns {DECIMAL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadprogress-get_totalbytestodownload
     */
    get_TotalBytesToDownload() {
        retval := DECIMAL()
        result := ComCall(12, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Returns the result of the download of a specified update.
     * @param {Integer} updateIndex A zero-based index value that specifies an update.
     * @returns {IUpdateDownloadResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatedownloadresult">IUpdateDownloadResult</a> interface that contains information about the specified update.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadprogress-getupdateresult
     */
    GetUpdateResult(updateIndex) {
        result := ComCall(13, this, "int", updateIndex, "ptr*", &retval := 0, "HRESULT")
        return IUpdateDownloadResult(retval)
    }

    /**
     * Gets a DownloadPhase enumeration value that specifies the phase of the download that is currently in progress.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadprogress-get_currentupdatedownloadphase
     */
    get_CurrentUpdateDownloadPhase() {
        result := ComCall(14, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an estimate of the percentage of the current update that has been downloaded.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadprogress-get_currentupdatepercentcomplete
     */
    get_CurrentUpdatePercentComplete() {
        result := ComCall(15, this, "int*", &retval := 0, "HRESULT")
        return retval
    }
}
