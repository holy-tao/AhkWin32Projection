#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUpdateCollection.ahk
#Include .\IDownloadJob.ahk
#Include .\IDownloadResult.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Downloads updates from the server.
 * @remarks
 * 
 * You can create an instance of this interface by using the UpdateDownloader coclass. Use the Microsoft.Update.Downloader program identifier to create the object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatedownloader
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateDownloader extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateDownloader
     * @type {Guid}
     */
    static IID => Guid("{68f1c6f9-7ecc-4666-a464-247fe12496c3}")

    /**
     * The class identifier for UpdateDownloader
     * @type {Guid}
     */
    static CLSID => Guid("{5baf654a-5a07-4264-a255-9ff54c7151e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClientApplicationID", "put_ClientApplicationID", "get_IsForced", "put_IsForced", "get_Priority", "put_Priority", "get_Updates", "put_Updates", "BeginDownload", "Download", "EndDownload"]

    /**
     * @type {BSTR} 
     */
    ClientApplicationID {
        get => this.get_ClientApplicationID()
        set => this.put_ClientApplicationID(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsForced {
        get => this.get_IsForced()
        set => this.put_IsForced(value)
    }

    /**
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * @type {IUpdateCollection} 
     */
    Updates {
        get => this.get_Updates()
        set => this.put_Updates(value)
    }

    /**
     * Gets and sets the current client application.
     * @remarks
     * 
     * Returns the value Unknown if the client application has not set the property.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatedownloader-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the current client application.
     * @remarks
     * 
     * Returns the value Unknown if the client application has not set the property.
     * 
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatedownloader-put_clientapplicationid
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets a Boolean value that indicates whether the Windows Update Agent (WUA) forces the download of updates that are already installed or that cannot be installed.
     * @remarks
     * 
     * This method returns <b>WU_E_INVALID_OPERATION</b> if the object that is implementing the interface is locked down.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatedownloader-get_isforced
     */
    get_IsForced() {
        result := ComCall(9, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether the Windows Update Agent (WUA) forces the download of updates that are already installed or that cannot be installed.
     * @remarks
     * 
     * This method returns <b>WU_E_INVALID_OPERATION</b> if the object that is implementing the interface is locked down.
     * 
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatedownloader-put_isforced
     */
    put_IsForced(value) {
        result := ComCall(10, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets the priority level of the download.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatedownloader-get_priority
     */
    get_Priority() {
        result := ComCall(11, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the priority level of the download.
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatedownloader-put_priority
     */
    put_Priority(value) {
        result := ComCall(12, this, "int", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets an interface that contains a read-only collection of the updates that are specified for download.
     * @returns {IUpdateCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatedownloader-get_updates
     */
    get_Updates() {
        result := ComCall(13, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * Gets and sets an interface that contains a read-only collection of the updates that are specified for download.
     * @param {IUpdateCollection} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatedownloader-put_updates
     */
    put_Updates(value) {
        result := ComCall(14, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Starts an asynchronous download of the content files that are associated with the updates.
     * @param {IUnknown} onProgressChanged An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadprogresschangedcallback">IDownloadProgressChangedCallback</a> interface that is called periodically for download progress changes before download is complete.
     * @param {IUnknown} onCompleted An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadcompletedcallback">IDownloadCompletedCallback</a> interface (C++/COM) that is called when an asynchronous download operation is complete.
     * @param {VARIANT} state The caller-specific state that the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-idownloadjob-get_asyncstate">AsyncState</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadjob">IDownloadJob</a> interface returns. A caller may use this parameter to attach a value to the download job object. This  allows the caller to retrieve custom information about that download job object at a later time.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-idownloadjob-get_asyncstate">AsyncState</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadjob">IDownloadJob</a> interface can be retrieved, but it cannot be set. This does not prevent the caller from changing the contents of the object already set to the <b>AsyncState</b> property of the <b>IDownloadJob</b> interface. In other words, if the <b>AsyncState</b> property contains a number, the number cannot be changed. But, if the <b>AsyncState</b> property contains a safe array or an object, the contents of the safe array or the object can be changed at will. The value is released when the caller releases <b>IDownloadJob</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-enddownload">IUpdateDownloader::EndDownload</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {IDownloadJob} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadjob">IDownloadJob</a> interface that contains the properties and methods that are available to a download operation that has started.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatedownloader-begindownload
     */
    BeginDownload(onProgressChanged, onCompleted, state) {
        result := ComCall(15, this, "ptr", onProgressChanged, "ptr", onCompleted, "ptr", state, "ptr*", &retval := 0, "HRESULT")
        return IDownloadJob(retval)
    }

    /**
     * Starts a synchronous download of the content files that are associated with the updates.
     * @returns {IDownloadResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadresult">IDownloadResult</a> interface that contains result codes for the download.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatedownloader-download
     */
    Download() {
        result := ComCall(16, this, "ptr*", &retval := 0, "HRESULT")
        return IDownloadResult(retval)
    }

    /**
     * Completes an asynchronous download.
     * @param {IDownloadJob} value The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadjob">IDownloadJob</a> interface pointer that  <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-begindownload">BeginDownload</a> returns.
     * @returns {IDownloadResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadresult">IDownloadResult</a> interface that contains result codes for a download.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdatedownloader-enddownload
     */
    EndDownload(value) {
        result := ComCall(17, this, "ptr", value, "ptr*", &retval := 0, "HRESULT")
        return IDownloadResult(retval)
    }
}
