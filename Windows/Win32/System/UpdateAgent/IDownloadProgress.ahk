#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<DECIMAL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_currentupdatebytesdownloaded
     */
    get_CurrentUpdateBytesDownloaded(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DECIMAL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_currentupdatebytestodownload
     */
    get_CurrentUpdateBytesToDownload(retval) {
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_currentupdateindex
     */
    get_CurrentUpdateIndex(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_percentcomplete
     */
    get_PercentComplete(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DECIMAL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_totalbytesdownloaded
     */
    get_TotalBytesDownloaded(retval) {
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DECIMAL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_totalbytestodownload
     */
    get_TotalBytesToDownload(retval) {
        result := ComCall(12, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} updateIndex 
     * @param {Pointer<IUpdateDownloadResult>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-getupdateresult
     */
    GetUpdateResult(updateIndex, retval) {
        result := ComCall(13, this, "int", updateIndex, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_currentupdatedownloadphase
     */
    get_CurrentUpdateDownloadPhase(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogress-get_currentupdatepercentcomplete
     */
    get_CurrentUpdatePercentComplete(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, retvalMarshal, retval, "HRESULT")
        return result
    }
}
