#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IUpdateCollection.ahk
#Include .\IDownloadProgress.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains properties and methods that are available to a download operation.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-idownloadjob
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IDownloadJob extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadJob
     * @type {Guid}
     */
    static IID => Guid("{c574de85-7358-43f6-aae8-8697e62d8ba7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AsyncState", "get_IsCompleted", "get_Updates", "CleanUp", "GetProgress", "RequestAbort"]

    /**
     * @type {VARIANT} 
     */
    AsyncState {
        get => this.get_AsyncState()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsCompleted {
        get => this.get_IsCompleted()
    }

    /**
     * @type {IUpdateCollection} 
     */
    Updates {
        get => this.get_Updates()
    }

    /**
     * Gets the caller-specific state object that is passed to the IUpdateDownloader.BeginDownload method.
     * @remarks
     * 
     * This state object can be used by the caller to identify a particular download. Or, this state object can be used by the caller to pass information from the caller to the implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadprogresschangedcallback">IDownloadProgressChangedCallback</a>  or <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadcompletedcallback">IDownloadCompletedCallback</a> interface.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadjob-get_asyncstate
     */
    get_AsyncState() {
        retval := VARIANT()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the setting that indicates whether the call to IUpdateDownloader.BeginDownload was processed completely.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadjob-get_iscompleted
     */
    get_IsCompleted() {
        result := ComCall(8, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets an interface that contains a read-only collection of the updates that are specified in a download.
     * @returns {IUpdateCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadjob-get_updates
     */
    get_Updates() {
        result := ComCall(9, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * Waits for an asynchronous operation to be completed and releases all callbacks.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadjob-cleanup
     */
    CleanUp() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Returns an IDownloadProgress interface that describes the current progress of a download.
     * @returns {IDownloadProgress} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadprogress">IDownloadProgress</a> interface that describes the current progress of a download.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadjob-getprogress
     */
    GetProgress() {
        result := ComCall(11, this, "ptr*", &retval := 0, "HRESULT")
        return IDownloadProgress(retval)
    }

    /**
     * Makes a request to end an asynchronous download.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-idownloadjob-requestabort
     */
    RequestAbort() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
