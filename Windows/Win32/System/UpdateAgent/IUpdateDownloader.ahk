#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDownloadResult.ahk" { IDownloadResult }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\DownloadPriority.ahk" { DownloadPriority }
#Import ".\IDownloadJob.ahk" { IDownloadJob }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateCollection.ahk" { IUpdateCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Downloads updates from the server.
 * @remarks
 * You can create an instance of this interface by using the UpdateDownloader coclass. Use the Microsoft.Update.Downloader program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatedownloader
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateDownloader extends IDispatch {
    /**
     * The interface identifier for IUpdateDownloader
     * @type {Guid}
     */
    static IID := Guid("{68f1c6f9-7ecc-4666-a464-247fe12496c3}")

    /**
     * The class identifier for UpdateDownloader
     * @type {Guid}
     */
    static CLSID := Guid("{5baf654a-5a07-4264-a255-9ff54c7151e7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateDownloader interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ClientApplicationID : IntPtr
        put_ClientApplicationID : IntPtr
        get_IsForced            : IntPtr
        put_IsForced            : IntPtr
        get_Priority            : IntPtr
        put_Priority            : IntPtr
        get_Updates             : IntPtr
        put_Updates             : IntPtr
        BeginDownload           : IntPtr
        Download                : IntPtr
        EndDownload             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateDownloader.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {DownloadPriority} 
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
     * Gets and sets the current client application. (IUpdateDownloader.get_ClientApplicationID)
     * @remarks
     * Returns the value Unknown if the client application has not set the property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the current client application. (IUpdateDownloader.put_ClientApplicationID)
     * @remarks
     * Returns the value Unknown if the client application has not set the property.
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-put_clientapplicationid
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Gets and sets a Boolean value that indicates whether the Windows Update Agent (WUA) forces the download of updates that are already installed or that cannot be installed. (Get)
     * @remarks
     * This method returns <b>WU_E_INVALID_OPERATION</b> if the object that is implementing the interface is locked down.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-get_isforced
     */
    get_IsForced() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether the Windows Update Agent (WUA) forces the download of updates that are already installed or that cannot be installed. (Put)
     * @remarks
     * This method returns <b>WU_E_INVALID_OPERATION</b> if the object that is implementing the interface is locked down.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-put_isforced
     */
    put_IsForced(value) {
        result := ComCall(10, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Gets and sets the priority level of the download. (Get)
     * @returns {DownloadPriority} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-get_priority
     */
    get_Priority() {
        result := ComCall(11, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the priority level of the download. (Put)
     * @param {DownloadPriority} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-put_priority
     */
    put_Priority(value) {
        result := ComCall(12, this, DownloadPriority, value, "HRESULT")
        return result
    }

    /**
     * Gets and sets an interface that contains a read-only collection of the updates that are specified for download. (Get)
     * @returns {IUpdateCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-get_updates
     */
    get_Updates() {
        result := ComCall(13, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateCollection(retval)
    }

    /**
     * Gets and sets an interface that contains a read-only collection of the updates that are specified for download. (Put)
     * @param {IUpdateCollection} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-put_updates
     */
    put_Updates(value) {
        result := ComCall(14, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Starts an asynchronous download of the content files that are associated with the updates.
     * @remarks
     * As an alternative to implementing the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadprogresschangedcallback">IDownloadProgressChangedCallback</a> interface, you can use a script to   implement a callback routine of any identifier with DISPID 0 on an automation object. The type of the  <i>onProgressChanged</i> parameter is <b>IUnknown*</b>.
     * 
     *   As an alternative to implementing the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadcompletedcallback">IDownloadCompletedCallback</a> interface, you can use a script to   implement a callback routine of any identifier with DISPID 0 on an automation object. The type of the  <i>onCompleted</i> parameter is <b>IUnknown*</b>.
     * 
     * This method returns <b>WU_E_INVALID_OPERATION</b> if the object that is implementing the interface is  locked down.
     * 
     * This method returns <b>WU_E_NO_UPDATE</b> if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-get_updates">Updates</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatedownloader">IUpdateDownloader</a> interface is not set. This method also returns WU_E_NO_UPDATE if the <b>Updates</b> property is set to an empty collection.
     * 
     * This method returns <b>SUS_E_NOT_INITIALIZED</b> if the download job contains no updates.
     * 
     * When you use any asynchronous WUA API in your app, you might need to implement a time-out mechanism. For more info about how to perform asynchronous WUA operations, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/guidelines-for-asynchronous-wua-operations">Guidelines for Asynchronous WUA Operations</a>.
     * @param {IUnknown} onProgressChanged An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadprogresschangedcallback">IDownloadProgressChangedCallback</a> interface that is called periodically for download progress changes before download is complete.
     * @param {IUnknown} onCompleted An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadcompletedcallback">IDownloadCompletedCallback</a> interface (C++/COM) that is called when an asynchronous download operation is complete.
     * @param {VARIANT} state The caller-specific state that the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-idownloadjob-get_asyncstate">AsyncState</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadjob">IDownloadJob</a> interface returns. A caller may use this parameter to attach a value to the download job object. This  allows the caller to retrieve custom information about that download job object at a later time.
     * 
     * <div class="alert"><b>Note</b>  <p class="note">The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-idownloadjob-get_asyncstate">AsyncState</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadjob">IDownloadJob</a> interface can be retrieved, but it cannot be set. This does not prevent the caller from changing the contents of the object already set to the <b>AsyncState</b> property of the <b>IDownloadJob</b> interface. In other words, if the <b>AsyncState</b> property contains a number, the number cannot be changed. But, if the <b>AsyncState</b> property contains a safe array or an object, the contents of the safe array or the object can be changed at will. The value is released when the caller releases <b>IDownloadJob</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-enddownload">IUpdateDownloader::EndDownload</a>.
     * 
     * </div>
     * <div> </div>
     * @returns {IDownloadJob} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadjob">IDownloadJob</a> interface that contains the properties and methods that are available to a download operation that has started.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-begindownload
     */
    BeginDownload(onProgressChanged, onCompleted, state) {
        result := ComCall(15, this, "ptr", onProgressChanged, "ptr", onCompleted, VARIANT, state, "ptr*", &retval := 0, "HRESULT")
        return IDownloadJob(retval)
    }

    /**
     * Starts a synchronous download of the content files that are associated with the updates.
     * @remarks
     * This method returns <b>WU_E_INVALID_OPERATION</b> if the object that is implementing the interface is locked down.
     * 
     * This method returns <b>WU_E_NO_UPDATE</b> if the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-get_updates">Updates</a> property of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatedownloader">IUpdateDownloader</a> interface is not set. This method also returns <b>WU_E_NO_UPDATE</b> if the <b>Updates</b> property is set to an empty collection.
     * 
     * This method returns <b>SUS_E_NOT_INITIALIZED</b> if the download job does not contain updates.
     * @returns {IDownloadResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadresult">IDownloadResult</a> interface that contains result codes for the download.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-download
     */
    Download() {
        result := ComCall(16, this, "ptr*", &retval := 0, "HRESULT")
        return IDownloadResult(retval)
    }

    /**
     * Completes an asynchronous download.
     * @remarks
     * This method returns <b>WU_E_INVALID_OPERATION</b> if the object that is implementing the interface is locked down.
     * 
     * When you use any asynchronous WUA API in your app, you might need to implement a time-out mechanism. For more info about how to perform asynchronous WUA operations, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/guidelines-for-asynchronous-wua-operations">Guidelines for Asynchronous WUA Operations</a>.
     * @param {IDownloadJob} value The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadjob">IDownloadJob</a> interface pointer that  <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-begindownload">BeginDownload</a> returns.
     * @returns {IDownloadResult} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-idownloadresult">IDownloadResult</a> interface that contains result codes for a download.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloader-enddownload
     */
    EndDownload(value) {
        result := ComCall(17, this, "ptr", value, "ptr*", &retval := 0, "HRESULT")
        return IDownloadResult(retval)
    }

    Query(iid) {
        if (IUpdateDownloader.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ClientApplicationID := CallbackCreate(GetMethod(implObj, "get_ClientApplicationID"), flags, 2)
        this.vtbl.put_ClientApplicationID := CallbackCreate(GetMethod(implObj, "put_ClientApplicationID"), flags, 2)
        this.vtbl.get_IsForced := CallbackCreate(GetMethod(implObj, "get_IsForced"), flags, 2)
        this.vtbl.put_IsForced := CallbackCreate(GetMethod(implObj, "put_IsForced"), flags, 2)
        this.vtbl.get_Priority := CallbackCreate(GetMethod(implObj, "get_Priority"), flags, 2)
        this.vtbl.put_Priority := CallbackCreate(GetMethod(implObj, "put_Priority"), flags, 2)
        this.vtbl.get_Updates := CallbackCreate(GetMethod(implObj, "get_Updates"), flags, 2)
        this.vtbl.put_Updates := CallbackCreate(GetMethod(implObj, "put_Updates"), flags, 2)
        this.vtbl.BeginDownload := CallbackCreate(GetMethod(implObj, "BeginDownload"), flags, 5)
        this.vtbl.Download := CallbackCreate(GetMethod(implObj, "Download"), flags, 2)
        this.vtbl.EndDownload := CallbackCreate(GetMethod(implObj, "EndDownload"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ClientApplicationID)
        CallbackFree(this.vtbl.put_ClientApplicationID)
        CallbackFree(this.vtbl.get_IsForced)
        CallbackFree(this.vtbl.put_IsForced)
        CallbackFree(this.vtbl.get_Priority)
        CallbackFree(this.vtbl.put_Priority)
        CallbackFree(this.vtbl.get_Updates)
        CallbackFree(this.vtbl.put_Updates)
        CallbackFree(this.vtbl.BeginDownload)
        CallbackFree(this.vtbl.Download)
        CallbackFree(this.vtbl.EndDownload)
    }
}
