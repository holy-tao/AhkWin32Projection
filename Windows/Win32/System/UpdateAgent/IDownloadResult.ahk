#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateDownloadResult.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the result of a download operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-idownloadresult
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IDownloadResult extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadResult
     * @type {Guid}
     */
    static IID => Guid("{daa4fdd0-4727-4dbe-a1e7-745dca317144}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HResult", "get_ResultCode", "GetUpdateResult"]

    /**
     * @type {Integer} 
     */
    HResult {
        get => this.get_HResult()
    }

    /**
     * @type {Integer} 
     */
    ResultCode {
        get => this.get_ResultCode()
    }

    /**
     * Gets the exception code number if an exception code number is raised during the download.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadresult-get_hresult
     */
    get_HResult() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an OperationResultCodeenumeration that specifies the result of the download.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadresult-get_resultcode
     */
    get_ResultCode() {
        result := ComCall(8, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Returns an IUpdateDownloadResult interface that contains the download information for a specified update.
     * @param {Integer} updateIndex The index of the update.
     * @returns {IUpdateDownloadResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatedownloadresult">IUpdateDownloadResult</a> interface that contains the results for the specified update.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadresult-getupdateresult
     */
    GetUpdateResult(updateIndex) {
        result := ComCall(9, this, "int", updateIndex, "ptr*", &retval := 0, "HRESULT")
        return IUpdateDownloadResult(retval)
    }
}
