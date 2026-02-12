#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDownloadOperation.ahk
#Include .\IBackgroundTransferOperation.ahk
#Include .\IBackgroundTransferOperationPriority.ahk
#Include .\IDownloadOperation2.ahk
#Include .\IDownloadOperation3.ahk
#Include .\IDownloadOperation4.ahk
#Include .\IDownloadOperation5.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\DownloadOperation.ahk
#Include .\BackgroundTransferRangesDownloadedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Performs an asynchronous download operation. The [Background transfer sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/BackgroundTransfer) demonstrates this functionality. For an overview of Background Transfer capabilities, see [Transferring data in the background](/previous-versions/windows/apps/hh452979(v=win.10)).
 * @remarks
 * At next start-up after application termination, your application should enumerate all existing DownloadOperation instances using [GetCurrentDownloadsAsync](backgrounddownloader_getcurrentdownloadsasync_1101292265.md). When a UWP application using Background Transfer is terminated, incomplete downloads persist in the background. If your application is restarted after termination and these incomplete operations are not enumerated and re-introduced to the current session, then they will go stale and continue to occupy device resources.
 * 
 * Background transfer doesn't support concurrent downloads of the same [Uri](../windows.foundation/uri.md). So an app can download *`http://example.com/myfile.wmv`* once, or download it again after a previous download completed. An app shouldn't start two downloads of the same [Uri](../windows.foundation/uri.md) concurrently, since this may result in truncated files.
 * 
 * > [!NOTE]
 * > Paused or incomplete download operations can only be resumed if the server accepts range-requests.
 * 
 * **Timeout considerations**
 * 
 * 1) When establishing a new connection for a download over TCP/SSL, the connection attempt is aborted if not established within five minutes.
 * 2) After the connection has been established, an HTTP request message that has not received a response within two minutes is aborted.
 * Assuming there is Internet connectivity, Background Transfer will retry a download up to three times. In the event Internet connectivity is not detected, additional attempts will not be made until it is.
 * 
 * **Debugging Guidance**
 * 
 * Stopping a debugging session in Microsoft Visual Studio is comparable to closing your app; downloads are paused and POST uploads are terminated. Even while debugging, your app should enumerate and then pause, resume, restart, or cancel any persisted downloads.
 * 
 * However, if Microsoft Visual Studio project updates, like changes to the app manifest, require that the app is uninstalled and re-deployed for debugging, [GetCurrentDownloadsAsync](backgrounddownloader_getcurrentdownloadsasync_1101292265.md) cannot enumerate persisted operations created using the previous app deployment.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class DownloadOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDownloadOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDownloadOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the [IStorageFile](../windows.storage/istoragefile.md) object provided by the caller when creating the [DownloadOperation](downloadoperation.md) object using [CreateDownload](/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.createdownload).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.resultfile
     * @type {IStorageFile} 
     */
    ResultFile {
        get => this.get_ResultFile()
    }

    /**
     * Gets the current progress of the operation.
     * @remarks
     * The value of **Progress** is updated in real time, which means that the value can change while a progress handler is executing. As a best practice, create a local copy of the value of the **Progress** property at the beginning of your progress handler, and use only that copy in your progress handler, to maintain a consistent view of progress as your handler executes.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.progress
     * @type {BackgroundDownloadProgress} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * This is a unique identifier for a specific download operation. A [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) associated to a download operation will not change for the duration of the download.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.guid
     * @type {Guid} 
     */
    Guid {
        get => this.get_Guid()
    }

    /**
     * Gets the URI from which to download the file.
     * @remarks
     * The URI can be updated in for transfers that have hit a recoverable error (PausedRecoverableWebErrorStatus), or that have explicitly paused by the app (PausedByApplication). Once the URI has been updated, the app must call [DownloadOperation.Resume](downloadoperation_resume_406343050.md) to initiate a retry.
     * 
     * Due to OS limitations, downloads that don't opt into random access mode will always restart from scratch whenever their URL is updated. To opt into random access mode, set [DownloadOperation.IsRandomAccessRequired](downloadoperation_israndomaccessrequired.md) to true. Transfers configured that way have full support for resumable URL updates. If the timestamp or file size of the updated URL is different from that of the previous URL, the download will restart from scratch. Otherwise, the transfer will resume from the same position using the new URL.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.requesteduri
     * @type {Uri} 
     */
    RequestedUri {
        get => this.get_RequestedUri()
        set => this.put_RequestedUri(value)
    }

    /**
     * Gets the method to use for the download.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.method
     * @type {HSTRING} 
     */
    Method {
        get => this.get_Method()
    }

    /**
     * > [!NOTE]
     * > Group may be altered or unavailable for releases after Windows 8.1. Instead, use [TransferGroup](downloadoperation_transfergroup.md).
     * 
     * Gets a string value indicating the group the transfer belongs to.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.group
     * @type {HSTRING} 
     */
    Group {
        get => this.get_Group()
    }

    /**
     * Gets and sets the cost policy for the download.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.costpolicy
     * @type {Integer} 
     */
    CostPolicy {
        get => this.get_CostPolicy()
        set => this.put_CostPolicy(value)
    }

    /**
     * Gets or sets the transfer priority of this download operation when within a [BackgroundTransferGroup](backgroundtransfergroup.md). Possible values are defined by [BackgroundTransferPriority](backgroundtransferpriority.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.priority
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * Gets the group that this download operation belongs to.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.transfergroup
     * @type {BackgroundTransferGroup} 
     */
    TransferGroup {
        get => this.get_TransferGroup()
    }

    /**
     * A boolean property to enable random access. The property must be set to TRUE before calling StartAsync() on a [DownloadOperation](downloadoperation.md) object to use the random access feature. After calling StartAsync(), call [GetResultRandomAccessStreamReference](downloadoperation_getresultrandomaccessstreamreference_1794718843.md) to get a reference to the random access stream and read from it.
     * @remarks
     * The IsRandomAccessRequired setter will fail with E_ILLEGAL_METHOD_CALL and a custom error message if StartAsync() has already been called on the [DownloadOperation](downloadoperation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.israndomaccessrequired
     * @type {Boolean} 
     */
    IsRandomAccessRequired {
        get => this.get_IsRandomAccessRequired()
        set => this.put_IsRandomAccessRequired(value)
    }

    /**
     * A set of [WebErrorStatus](../windows.web/weberrorstatus.md) values that applications anticipate the download will hit, and that the applications know how to handle.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.recoverableweberrorstatuses
     * @type {IVector<Integer>} 
     */
    RecoverableWebErrorStatuses {
        get => this.get_RecoverableWebErrorStatuses()
    }

    /**
     * A transfer's [WebErrorStatus](../windows.web/weberrorstatus.md), which can be monitored during the lifetime of the [DownloadOperation](downloadoperation.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.currentweberrorstatus
     * @type {IReference<Integer>} 
     */
    CurrentWebErrorStatus {
        get => this.get_CurrentWebErrorStatus()
    }

    /**
     * Provides access to incremental download progress.
     * @remarks
     * |||
     * |-|-|
     * |Device family| Universal; SDK version 10.0.16299.0 (Windows 10, version 1709)|
     * |API contract|Windows.Foundation.UniversalApiContract (introduced v5)|
     * |[Capabilities](/windows/uwp/packaging/app-capability-declarations)|internetClientServer, privateNetworkClientServer, internetClient}
     * @type {TypedEventHandler<DownloadOperation, BackgroundTransferRangesDownloadedEventArgs>}
    */
    OnRangesDownloaded {
        get {
            if(!this.HasProp("__OnRangesDownloaded")){
                this.__OnRangesDownloaded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{93a20d85-bdfc-5195-90d9-8cb56cbcb3d8}"),
                    DownloadOperation,
                    BackgroundTransferRangesDownloadedEventArgs
                )
                this.__OnRangesDownloadedToken := this.add_RangesDownloaded(this.__OnRangesDownloaded.iface)
            }
            return this.__OnRangesDownloaded
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnRangesDownloadedToken")) {
            this.remove_RangesDownloaded(this.__OnRangesDownloadedToken)
            this.__OnRangesDownloaded.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IStorageFile} 
     */
    get_ResultFile() {
        if (!this.HasProp("__IDownloadOperation")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation := IDownloadOperation(outPtr)
        }

        return this.__IDownloadOperation.get_ResultFile()
    }

    /**
     * 
     * @returns {BackgroundDownloadProgress} 
     */
    get_Progress() {
        if (!this.HasProp("__IDownloadOperation")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation := IDownloadOperation(outPtr)
        }

        return this.__IDownloadOperation.get_Progress()
    }

    /**
     * Starts an asynchronous download operation.
     * @returns {IAsyncOperationWithProgress<DownloadOperation, DownloadOperation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.startasync
     */
    StartAsync() {
        if (!this.HasProp("__IDownloadOperation")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation := IDownloadOperation(outPtr)
        }

        return this.__IDownloadOperation.StartAsync()
    }

    /**
     * Returns an asynchronous operation that can be used to monitor progress and completion of the attached download. Calling this method allows an app to attach download operations that were started in a previous app instance.
     * @returns {IAsyncOperationWithProgress<DownloadOperation, DownloadOperation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.attachasync
     */
    AttachAsync() {
        if (!this.HasProp("__IDownloadOperation")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation := IDownloadOperation(outPtr)
        }

        return this.__IDownloadOperation.AttachAsync()
    }

    /**
     * Pauses a download operation.
     * @remarks
     * Calling this method aborts the HTTP request, but preserves state for the download and for the partially downloaded response. This method fails when called for an operation that either: hasn't been started yet; is already paused; or that uses a POST request. To detect when the operation is fully paused, get the value of the [Progress property](/uwp/api/windows.networking.backgroundtransfer.downloadoperation.progress), and then access the [Status field](/uwp/api/windows.networking.backgroundtransfer.backgrounddownloadprogress.status) of that value. When the operation is fully paused, the *Status* field's value will no longer be **Running**. This is important if you need to pause an operation and then change [RequestedUri](/uwp/api/windows.networking.backgroundtransfer.downloadoperation.requesteduri), because you can't make that change while the the *Status* field's value is **Running**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.pause
     */
    Pause() {
        if (!this.HasProp("__IDownloadOperation")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation := IDownloadOperation(outPtr)
        }

        return this.__IDownloadOperation.Pause()
    }

    /**
     * Resumes a paused download operation.
     * @remarks
     * This method can be called on a paused download operation to resume the download. The download operation will try to resume the download if possible. Only requests where the server accepts range-requests can resume. Otherwise the download is restarted.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.resume
     */
    Resume() {
        if (!this.HasProp("__IDownloadOperation")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation := IDownloadOperation(outPtr)
        }

        return this.__IDownloadOperation.Resume()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Guid() {
        if (!this.HasProp("__IBackgroundTransferOperation")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferOperation := IBackgroundTransferOperation(outPtr)
        }

        return this.__IBackgroundTransferOperation.get_Guid()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_RequestedUri() {
        if (!this.HasProp("__IBackgroundTransferOperation")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferOperation := IBackgroundTransferOperation(outPtr)
        }

        return this.__IBackgroundTransferOperation.get_RequestedUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Method() {
        if (!this.HasProp("__IBackgroundTransferOperation")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferOperation := IBackgroundTransferOperation(outPtr)
        }

        return this.__IBackgroundTransferOperation.get_Method()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Group() {
        if (!this.HasProp("__IBackgroundTransferOperation")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferOperation := IBackgroundTransferOperation(outPtr)
        }

        return this.__IBackgroundTransferOperation.get_Group()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CostPolicy() {
        if (!this.HasProp("__IBackgroundTransferOperation")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferOperation := IBackgroundTransferOperation(outPtr)
        }

        return this.__IBackgroundTransferOperation.get_CostPolicy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CostPolicy(value) {
        if (!this.HasProp("__IBackgroundTransferOperation")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferOperation := IBackgroundTransferOperation(outPtr)
        }

        return this.__IBackgroundTransferOperation.put_CostPolicy(value)
    }

    /**
     * Gets the partially downloaded response at the specified position.
     * @param {Integer} position The position at which to start reading.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.getresultstreamat
     */
    GetResultStreamAt(position) {
        if (!this.HasProp("__IBackgroundTransferOperation")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferOperation := IBackgroundTransferOperation(outPtr)
        }

        return this.__IBackgroundTransferOperation.GetResultStreamAt(position)
    }

    /**
     * Gets the response information.
     * @remarks
     * This method returns an object that contains information about the current server response. When calling this method multiple times, the object returned will be the same as long as there is no new server response information available. Sometimes however, one download consists of multiple requests to a server. If a request gets aborted due to some non-fatal error (for example, machine lost internet connectivity, cost policy required download to pause, application called Pause(), etc.), Download API will invoke a new request and try to resume/restart the download. The response information from the server for this second request may be different than the one returned by the first request.
     * 
     * Returns **null** if any of the following conditions is true.
     * 
     * 
     * + The transfer associated with the DownloadOperation is being made using a protocol other than HTTP (for example, FTP).
     * + The DownloadOperation hasn't yet begun.
     * + There was a failure before any response from the server was received (for example, connection couldn't be established).
     * @returns {ResponseInformation} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.getresponseinformation
     */
    GetResponseInformation() {
        if (!this.HasProp("__IBackgroundTransferOperation")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferOperation := IBackgroundTransferOperation(outPtr)
        }

        return this.__IBackgroundTransferOperation.GetResponseInformation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        if (!this.HasProp("__IBackgroundTransferOperationPriority")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferOperationPriority.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferOperationPriority := IBackgroundTransferOperationPriority(outPtr)
        }

        return this.__IBackgroundTransferOperationPriority.get_Priority()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Priority(value) {
        if (!this.HasProp("__IBackgroundTransferOperationPriority")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferOperationPriority.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferOperationPriority := IBackgroundTransferOperationPriority(outPtr)
        }

        return this.__IBackgroundTransferOperationPriority.put_Priority(value)
    }

    /**
     * 
     * @returns {BackgroundTransferGroup} 
     */
    get_TransferGroup() {
        if (!this.HasProp("__IDownloadOperation2")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation2 := IDownloadOperation2(outPtr)
        }

        return this.__IDownloadOperation2.get_TransferGroup()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRandomAccessRequired() {
        if (!this.HasProp("__IDownloadOperation3")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation3 := IDownloadOperation3(outPtr)
        }

        return this.__IDownloadOperation3.get_IsRandomAccessRequired()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRandomAccessRequired(value) {
        if (!this.HasProp("__IDownloadOperation3")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation3 := IDownloadOperation3(outPtr)
        }

        return this.__IDownloadOperation3.put_IsRandomAccessRequired(value)
    }

    /**
     * Gets a reference to the random access stream and reads from it. It's necessary to set [IsRandomAccessRequired](downloadoperation_israndomaccessrequired.md) to TRUE before calling GetResultRandomAccessStreamReference.
     * @returns {IRandomAccessStreamReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.getresultrandomaccessstreamreference
     */
    GetResultRandomAccessStreamReference() {
        if (!this.HasProp("__IDownloadOperation3")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation3 := IDownloadOperation3(outPtr)
        }

        return this.__IDownloadOperation3.GetResultRandomAccessStreamReference()
    }

    /**
     * Returns the full list of file ranges that have been downloaded so far.
     * @returns {IVector<BackgroundTransferFileRange>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.getdownloadedranges
     */
    GetDownloadedRanges() {
        if (!this.HasProp("__IDownloadOperation3")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation3 := IDownloadOperation3(outPtr)
        }

        return this.__IDownloadOperation3.GetDownloadedRanges()
    }

    /**
     * 
     * @param {TypedEventHandler<DownloadOperation, BackgroundTransferRangesDownloadedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_RangesDownloaded(eventHandler) {
        if (!this.HasProp("__IDownloadOperation3")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation3 := IDownloadOperation3(outPtr)
        }

        return this.__IDownloadOperation3.add_RangesDownloaded(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_RangesDownloaded(eventCookie) {
        if (!this.HasProp("__IDownloadOperation3")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation3 := IDownloadOperation3(outPtr)
        }

        return this.__IDownloadOperation3.remove_RangesDownloaded(eventCookie)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_RequestedUri(value) {
        if (!this.HasProp("__IDownloadOperation3")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation3 := IDownloadOperation3(outPtr)
        }

        return this.__IDownloadOperation3.put_RequestedUri(value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_RecoverableWebErrorStatuses() {
        if (!this.HasProp("__IDownloadOperation3")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation3 := IDownloadOperation3(outPtr)
        }

        return this.__IDownloadOperation3.get_RecoverableWebErrorStatuses()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_CurrentWebErrorStatus() {
        if (!this.HasProp("__IDownloadOperation3")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation3 := IDownloadOperation3(outPtr)
        }

        return this.__IDownloadOperation3.get_CurrentWebErrorStatus()
    }

    /**
     * Prioritizes the download transfer operation (and any transfers that follow it in the same transfer group). Calling this method on a transfer that doesn't belong to a transfer group has no effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.makecurrentintransfergroup
     */
    MakeCurrentInTransferGroup() {
        if (!this.HasProp("__IDownloadOperation4")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation4 := IDownloadOperation4(outPtr)
        }

        return this.__IDownloadOperation4.MakeCurrentInTransferGroup()
    }

    /**
     * Used to set an HTTP request header.
     * @remarks
     * This method allows the caller to set request headers. This method can be called multiple times for the same header. The values will then be concatenated.
     * @param {HSTRING} headerName The header name.
     * @param {HSTRING} headerValue The header value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.setrequestheader
     */
    SetRequestHeader(headerName, headerValue) {
        if (!this.HasProp("__IDownloadOperation5")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation5 := IDownloadOperation5(outPtr)
        }

        return this.__IDownloadOperation5.SetRequestHeader(headerName, headerValue)
    }

    /**
     * Used to remove an HTTP request header.
     * @param {HSTRING} headerName The header name.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.downloadoperation.removerequestheader
     */
    RemoveRequestHeader(headerName) {
        if (!this.HasProp("__IDownloadOperation5")) {
            if ((queryResult := this.QueryInterface(IDownloadOperation5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDownloadOperation5 := IDownloadOperation5(outPtr)
        }

        return this.__IDownloadOperation5.RemoveRequestHeader(headerName)
    }

;@endregion Instance Methods
}
