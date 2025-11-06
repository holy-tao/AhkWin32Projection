#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDownloadProgress.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains information about the change in the progress of an asynchronous download operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-idownloadprogresschangedcallbackargs
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IDownloadProgressChangedCallbackArgs extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadProgressChangedCallbackArgs
     * @type {Guid}
     */
    static IID => Guid("{324ff2c6-4981-4b04-9412-57481745ab24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Progress"]

    /**
     * 
     * @returns {IDownloadProgress} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-idownloadprogresschangedcallbackargs-get_progress
     */
    get_Progress() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IDownloadProgress(retval)
    }
}
