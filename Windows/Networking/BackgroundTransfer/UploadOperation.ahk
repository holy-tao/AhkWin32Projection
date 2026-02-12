#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUploadOperation.ahk
#Include .\IBackgroundTransferOperation.ahk
#Include .\IBackgroundTransferOperationPriority.ahk
#Include .\IUploadOperation2.ahk
#Include .\IUploadOperation3.ahk
#Include .\IUploadOperation4.ahk
#Include ..\..\..\Guid.ahk

/**
 * Performs an asynchronous upload operation. For an overview of Background Transfer capabilities, see [Transferring data in the background](/previous-versions/windows/apps/hh452979(v=win.10)). Download the [Background transfer sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/BackgroundTransfer) for a code example.
 * @remarks
 * After app termination, an app should enumerate all existing UploadOperation instances at next start-up using [GetCurrentUploadsAsync](backgrounduploader_getcurrentuploadsasync_1938169689.md). When a UWP app using Background Transfer is terminated, incomplete uploads will persist in the background. If the app is restarted after termination and these incomplete operations are not enumerated and re-introduced to the current session, they will go stale and continue to occupy device resources.**Timeout considerations**
 * 
 * + 1.) When establishing a new connection for an upload over TCP/SSL, the connection attempt is aborted if not established within five minutes.
 * + 2.) After the connection has been established, an HTTP request message that has not received a response within two minutes is aborted.
 * Assuming there is Internet connectivity, Background Transfer will retry an upload up to three times. In the event Internet connectivity is not detected, additional attempts will not be made until it is.
 * 
 * **Debugging Guidance**
 * 
 * Stopping a debugging session in Microsoft Visual Studio is comparable to closing your app; PUT uploads are paused and POST uploads are aborted. Even while debugging, your app should enumerate and then pause, restart, or cancel any persisted uploads.
 * 
 * However, if Microsoft Visual Studio project updates, like changes to the app manifest, require that the app is uninstalled and re-deployed for debugging, [GetCurrentUploadsAsync](backgrounduploader_getcurrentuploadsasync_1938169689.md) cannot enumerate persisted operations created using the previous app deployment.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class UploadOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUploadOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUploadOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the [IStorageFile](../windows.storage/istoragefile.md) to upload.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.sourcefile
     * @type {IStorageFile} 
     */
    SourceFile {
        get => this.get_SourceFile()
    }

    /**
     * Gets the current progress of the upload operation.
     * @remarks
     * The value of the Progress property is updated in real time, which means that the value can change while a progress handler is executing. As a best practice, create a local copy of the Progress property at the beginning of your progress handler, and use only that copy in your progress handler, to maintain a consistent view of progress as your handler executes.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.progress
     * @type {BackgroundUploadProgress} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * This is a unique identifier for a specific upload operation. A [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) associated to a upload operation will not change for the duration of the upload.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.guid
     * @type {Guid} 
     */
    Guid {
        get => this.get_Guid()
    }

    /**
     * Gets the URI to upload from.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.requesteduri
     * @type {Uri} 
     */
    RequestedUri {
        get => this.get_RequestedUri()
    }

    /**
     * Gets the method to use for the upload.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.method
     * @type {HSTRING} 
     */
    Method {
        get => this.get_Method()
    }

    /**
     * > [!NOTE]
     * > Group may be altered or unavailable for releases after Windows 8.1. Instead, use [TransferGroup](uploadoperation_transfergroup.md).
     * 
     * Gets a string value indicating the group the upload belongs to.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.group
     * @type {HSTRING} 
     */
    Group {
        get => this.get_Group()
    }

    /**
     * Gets and sets the cost policy for the upload.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.costpolicy
     * @type {Integer} 
     */
    CostPolicy {
        get => this.get_CostPolicy()
        set => this.put_CostPolicy(value)
    }

    /**
     * Gets or sets the transfer priority of this upload operation when within a [BackgroundTransferGroup](backgroundtransfergroup.md). Possible values are defined by [BackgroundTransferPriority](backgroundtransferpriority.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.priority
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * Gets the group that this upload operation belongs to.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.transfergroup
     * @type {BackgroundTransferGroup} 
     */
    TransferGroup {
        get => this.get_TransferGroup()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IStorageFile} 
     */
    get_SourceFile() {
        if (!this.HasProp("__IUploadOperation")) {
            if ((queryResult := this.QueryInterface(IUploadOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUploadOperation := IUploadOperation(outPtr)
        }

        return this.__IUploadOperation.get_SourceFile()
    }

    /**
     * 
     * @returns {BackgroundUploadProgress} 
     */
    get_Progress() {
        if (!this.HasProp("__IUploadOperation")) {
            if ((queryResult := this.QueryInterface(IUploadOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUploadOperation := IUploadOperation(outPtr)
        }

        return this.__IUploadOperation.get_Progress()
    }

    /**
     * Starts an asynchronous upload operation.
     * @returns {IAsyncOperationWithProgress<UploadOperation, UploadOperation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.startasync
     */
    StartAsync() {
        if (!this.HasProp("__IUploadOperation")) {
            if ((queryResult := this.QueryInterface(IUploadOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUploadOperation := IUploadOperation(outPtr)
        }

        return this.__IUploadOperation.StartAsync()
    }

    /**
     * Returns an asynchronous operation that can be used to monitor progress and completion of the attached upload. Calling this method allows an app to attach upload operations that were started in a previous app instance.
     * @remarks
     * While this method can be called from multiple app instances, developers should not attach callbacks from the primary app instance in a background task. This will cause **BackgroundTransferHost.exe** to hang.
     * @returns {IAsyncOperationWithProgress<UploadOperation, UploadOperation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.attachasync
     */
    AttachAsync() {
        if (!this.HasProp("__IUploadOperation")) {
            if ((queryResult := this.QueryInterface(IUploadOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUploadOperation := IUploadOperation(outPtr)
        }

        return this.__IUploadOperation.AttachAsync()
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
     * Gets the partially uploaded response at the specified location.
     * @param {Integer} position The position at which to start reading.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.getresultstreamat
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
     * This method returns an object that contains information about the current server response. When calling this method multiple times, the object returned will be the same as long as there is no new server response information available. Sometimes however, one upload consists of multiple requests to a server. If a request gets aborted due to some non-fatal error (for example, machine lost internet connectivity, cost policy required upload to pause, application called Pause(), etc.), Background Transfer will invoke a new request and try to restart the upload. The response information from the server for this second request may be different than the one returned by the first request.
     * 
     * Returns **null** if any of the following conditions is true.
     * 
     * 
     * + The transfer associated with the UploadOperation is being made using a protocol other than HTTP (for example, FTP).
     * + The UploadOperation hasn't yet begun.
     * + There was a failure before any response from the server was received (for example, connection couldn't be established).
     * @returns {ResponseInformation} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.getresponseinformation
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
        if (!this.HasProp("__IUploadOperation2")) {
            if ((queryResult := this.QueryInterface(IUploadOperation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUploadOperation2 := IUploadOperation2(outPtr)
        }

        return this.__IUploadOperation2.get_TransferGroup()
    }

    /**
     * Prioritizes the upload transfer operation (and any transfers that follow it in the same transfer group). Calling this method on a transfer that doesn't belong to a transfer group has no effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.makecurrentintransfergroup
     */
    MakeCurrentInTransferGroup() {
        if (!this.HasProp("__IUploadOperation3")) {
            if ((queryResult := this.QueryInterface(IUploadOperation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUploadOperation3 := IUploadOperation3(outPtr)
        }

        return this.__IUploadOperation3.MakeCurrentInTransferGroup()
    }

    /**
     * Used to set an HTTP request header.
     * @remarks
     * This method allows the caller to set request headers. This method can be called multiple times for the same header. The values will then be concatenated.
     * @param {HSTRING} headerName The header name.
     * @param {HSTRING} headerValue The header value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.setrequestheader
     */
    SetRequestHeader(headerName, headerValue) {
        if (!this.HasProp("__IUploadOperation4")) {
            if ((queryResult := this.QueryInterface(IUploadOperation4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUploadOperation4 := IUploadOperation4(outPtr)
        }

        return this.__IUploadOperation4.SetRequestHeader(headerName, headerValue)
    }

    /**
     * Used to remove an HTTP request header.
     * @param {HSTRING} headerName The header name.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.uploadoperation.removerequestheader
     */
    RemoveRequestHeader(headerName) {
        if (!this.HasProp("__IUploadOperation4")) {
            if ((queryResult := this.QueryInterface(IUploadOperation4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUploadOperation4 := IUploadOperation4(outPtr)
        }

        return this.__IUploadOperation4.RemoveRequestHeader(headerName)
    }

;@endregion Instance Methods
}
