#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundUploader.ahk
#Include .\IBackgroundTransferBase.ahk
#Include .\IBackgroundUploader2.ahk
#Include .\IBackgroundUploader3.ahk
#Include .\IBackgroundUploaderStaticMethods.ahk
#Include .\IBackgroundUploaderUserConsent.ahk
#Include .\IBackgroundUploaderStaticMethods2.ahk
#Include .\IBackgroundUploaderFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to configure upload prior to the actual creation of the upload operation using [CreateUpload](backgrounduploader_createupload_1442890857.md). For an overview of Background Transfer capabilities, see [Transferring data in the background](/previous-versions/windows/apps/hh452979(v=win.10)). Download the [Background transfer sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/BackgroundTransfer) for a code example.
  * 
  * > [!NOTE]
  * > Background Transfer is primarily designed for long-term transfer operations for resources like video, music, and large images. For short-term operations involving transfers of smaller resources (i.e. a couple KB), use the [Windows.Web.Http](../windows.web.http/windows_web_http.md) namespace.
 * @remarks
 * After app termination, an app should enumerate all existing [UploadOperation](uploadoperation.md) instances at next start-up using [GetCurrentUploadsAsync](backgrounduploader_getcurrentuploadsasync_1938169689.md). When a UWP app using Background Transfer is terminated, incomplete uploads will persist in the background. If the app is restarted after termination and operations from the previous session are not enumerated and re-attached to the current session, they will remain incomplete and continue to occupy resources. Once enumerated, PUT upload operations are automatically restarted, and POST upload operations are terminated.
 * 
 * > [!NOTE]
 * > When an app is uninstalled any current or persisted Background Transfer operations associated with it are cleaned up.
 * 
 * When implementing a library for Background Transfer operations, and this same library is used by other apps or components, specify a unique*group* name string (for example, a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid)) when creating uploads. An upload with a group name string can only be enumerated by providing the matching string to [GetCurrentDownloadsAsync(String)](backgrounddownloader_getcurrentdownloadsasync_405117897.md), and will not appear in [GetCurrentDownloadsAsync](backgrounddownloader_getcurrentdownloadsasync_1101292265.md) calls without. This will ensure that other apps implementing that same library for uploads will not see your uploads
 * 
 * Upload operations via FTP are not supported.
 * 
 * Security concerns can exist when upload operations require a username and password for authentication. If the authentication model to be used is supported by **WinINet**, use the [ServerCredential](backgrounduploader_servercredential.md) or [ProxyCredential](backgrounduploader_proxycredential.md) properties. These values will be securely saved in **WinVault**. For information on supported authentication methods, see [Handling Authentication](/windows/desktop/WinInet/handling-authentication).
 * 
 * If the authentication model is not supported by **WinINet**, use [HttpClient](../windows.web.http/httpclient.md) to implement custom authentication and obtain an upload-specific secure token (cookie). Set the appropriate header to have the secure token value used for background transfer. The service should limit the validity of the secure token only to the file that is being uploaded. 
 * 
 * > [!NOTE]
 * > The secure token will be stored in clear text within the application's folder.
 * 
 * Upload services that require the username and password be set in clear text in a custom header for each upload file are insecure. Background transfer will cache the headers in clear text for the duration of the operation within the app's folder.
 * 
 * **Toast notifications**
 * 
 * The BackgroundUploader class in Windows 8.1 and Windows Server 2012 R2 supports options for the user to receive tile and toast notifications when a transfer is completed successfully or fails to complete.
 * 
 * An app that uses [Windows.Networking.BackgroundTransfer](windows_networking_backgroundtransfer.md) to communicate through a toast notification must declare that it is **Toast capable** in the app manifest file. The **Toast capable** setting is located under the **Notifications** section of **Application** tab. Set the **Toast capable** option to "Yes" so the app can receive toast notifications.
 * 
 * If **Toast capable** is not enabled in the app manifest, then any toast settings in the [Windows.Networking.BackgroundTransfer](windows_networking_backgroundtransfer.md) namespace will be silently ignored and no toasts notifications will be received by the app.
 * 
 * > [!NOTE]
 * > A user can manually disable or enable toast notifications for your app at any time.
 * 
 * For more information on toast notifications, see [Sending toast notifications](/previous-versions/windows/apps/hh868266(v=win.10)) and [How to opt in for toast notifications](/previous-versions/windows/apps/hh868218(v=win.10)).
 * 
 * **Handling Exceptions**
 * 
 * A number of errors can cause exceptions to occur during an upload operation. You should write code to handle exceptions when you call methods on this class. Exceptions can result from parameter validation errors, name resolution failures, and network errors. Exceptions from network errors (loss of connectivity, connection failures, and other HTTP errors, for example) can happen at any time. These errors result in exceptions being thrown. If not handled by your app, an exception can cause your entire app to be terminated by the runtime.
 * 
 * An app can use the **HRESULT** from the exception to determine the error that caused the exception. An app can then decide how to handle the exception based on the error code. The [BackgroundTransferError.GetStatus](backgroundtransfererror_getstatus_1856274933.md) method can convert most **HRESULT** values returned to a [WebErrorStatus](../windows.web/weberrorstatus.md) enumeration value. Most of the [WebErrorStatus](../windows.web/weberrorstatus.md) enumeration values correspond to an error returned by the native HTTP or FTP client operation. An app can filter on specific [WebErrorStatus](../windows.web/weberrorstatus.md) enumeration values to modify app behavior depending on the cause of the exception.
 * 
 * Some **HRESULT** values cannot be converted to a [WebErrorStatus](../windows.web/weberrorstatus.md) enumeration value. When a background POST operation is canceled, an exception is thrown. The operation is not restarted. For more information, see [UploadOperation.StartAsync](uploadoperation_startasync_1931900819.md)
 * 
 * For information on network exceptions, see [Handling exceptions in network apps](/previous-versions/windows/apps/dn263211(v=win.10)).
 * 
 * **Debugging Guidance**
 * 
 * Stopping a debugging session in Microsoft Visual Studio is comparable to closing your app; PUT uploads are paused and POST uploads are terminated. Even while debugging, your app should enumerate and then restart or cancel any persisted uploads. For example, you can have your app cancel enumerated persisted upload operations at app startup if there is no interest in previous operations for that debug session.
 * 
 * While enumerating downloads/uploads on app startup during a debug session, you can have your app cancel them if there is no interest in previous operations for that debug session. Note that if there are Microsoft Visual Studio project updates, like changes to the app manifest, and the app is uninstalled and re-deployed, [GetCurrentUploadsAsync](backgrounduploader_getcurrentuploadsasync_1938169689.md) cannot enumerate operations created using the previous app deployment.
 * 
 * See [Debugging and testing UWP apps](/previous-versions/dd264943(v=vs.140)) for more information.
 * 
 * When using Background Transfer during development, you may get into a situation where the internal caches of active and completed transfer operations can get out of sync. This may result in the inability to start new transfer operations or interact with existing operations and [BackgroundTransferGroup](backgroundtransfergroup.md) objects. In some cases, attempting to interact with existing operations may trigger a crash. This result can occur if the [TransferBehavior](backgroundtransfergroup_transferbehavior.md) property is set to **Parallel**. This issue occurs only in certain scenarios during development and is not applicable to end users of your app.
 * 
 * Four scenarios using Microsoft Visual Studio can cause this issue.
 * 
 * + You create a new project with the same app name as an existing project, but a different language (from C++ to C#, for example).
 * + You change the target architecture (from x86 to x64, for example) in an existing project.
 * + You change the culture (from neutral to en-US, for example) in an existing project.
 * + You add or remove a capability in the package manifest (adding **Enterprise Authentication**, for example) in an existing project.
 *  Regular app servicing, including manifest updates which add or remove capabilities, do not trigger this issue on end user deployments of your app.
 * 
 * To work around this issue, completely uninstall all versions of the app and re-deploy with the new language, architecture, culture, or capability. This can be done via the **Start** screen or using PowerShell and the `Remove-AppxPackage` cmdlet.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundUploader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundUploader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundUploader.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!NOTE]
     * > GetCurrentUploadsAsync(group) may be altered or unavailable for releases after Windows 8.1. Instead, use [GetCurrentUploadsForTransferGroupAsync](backgrounduploader_getcurrentuploadsfortransfergroupasync_467871446.md).
     * 
     * Returns a collection of pending uploads for a specific [Group](backgrounddownloader_group.md).
     * @returns {IAsyncOperation<IVectorView<UploadOperation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.getcurrentuploadsasync
     */
    static GetCurrentUploadsAsync() {
        if (!BackgroundUploader.HasProp("__IBackgroundUploaderStaticMethods")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundUploader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundUploaderStaticMethods.IID)
            BackgroundUploader.__IBackgroundUploaderStaticMethods := IBackgroundUploaderStaticMethods(factoryPtr)
        }

        return BackgroundUploader.__IBackgroundUploaderStaticMethods.GetCurrentUploadsAsync()
    }

    /**
     * Returns a collection of pending uploads that are not associated with a group.
     * @param {HSTRING} group 
     * @returns {IAsyncOperation<IVectorView<UploadOperation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.getcurrentuploadsasync
     */
    static GetCurrentUploadsForGroupAsync(group) {
        if (!BackgroundUploader.HasProp("__IBackgroundUploaderStaticMethods")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundUploader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundUploaderStaticMethods.IID)
            BackgroundUploader.__IBackgroundUploaderStaticMethods := IBackgroundUploaderStaticMethods(factoryPtr)
        }

        return BackgroundUploader.__IBackgroundUploaderStaticMethods.GetCurrentUploadsForGroupAsync(group)
    }

    /**
     * > [!NOTE]
     * > RequestUnconstrainedUploadsAsync may be altered or unavailable for releases after Windows 10, version 1607. Instead, use [CreateUploadAsync](backgrounduploader_createuploadasync_844456383.md).
     * 
     * Used to request an unconstrained upload operation. When this method is called the user is provided with a UI prompt that they can use to indicate their consent for an unconstrained operation.An unconstrained transfer operation will run without the resource restrictions normally associated with background network operations while a device is running on battery.
     * @param {IIterable<UploadOperation>} operations The upload operation to run unconstrained.
     * @returns {IAsyncOperation<UnconstrainedTransferRequestResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.requestunconstraineduploadsasync
     */
    static RequestUnconstrainedUploadsAsync(operations) {
        if (!BackgroundUploader.HasProp("__IBackgroundUploaderUserConsent")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundUploader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundUploaderUserConsent.IID)
            BackgroundUploader.__IBackgroundUploaderUserConsent := IBackgroundUploaderUserConsent(factoryPtr)
        }

        return BackgroundUploader.__IBackgroundUploaderUserConsent.RequestUnconstrainedUploadsAsync(operations)
    }

    /**
     * Gets all uploads associated with the provided [BackgroundTransferGroup](backgroundtransfergroup.md).
     * @param {BackgroundTransferGroup} group Contains information used to identify a group of uploads.
     * @returns {IAsyncOperation<IVectorView<UploadOperation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.getcurrentuploadsfortransfergroupasync
     */
    static GetCurrentUploadsForTransferGroupAsync(group) {
        if (!BackgroundUploader.HasProp("__IBackgroundUploaderStaticMethods2")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundUploader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundUploaderStaticMethods2.IID)
            BackgroundUploader.__IBackgroundUploaderStaticMethods2 := IBackgroundUploaderStaticMethods2(factoryPtr)
        }

        return BackgroundUploader.__IBackgroundUploaderStaticMethods2.GetCurrentUploadsForTransferGroupAsync(group)
    }

    /**
     * Instantiates a new [BackgroundUploader](backgrounduploader.md) object as a member of a completion group.
     * @param {BackgroundTransferCompletionGroup} completionGroup The completion group that the created BackgroundUploader instance is to be a member of.
     * @returns {BackgroundUploader} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.#ctor
     */
    static CreateWithCompletionGroup(completionGroup) {
        if (!BackgroundUploader.HasProp("__IBackgroundUploaderFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundUploader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundUploaderFactory.IID)
            BackgroundUploader.__IBackgroundUploaderFactory := IBackgroundUploaderFactory(factoryPtr)
        }

        return BackgroundUploader.__IBackgroundUploaderFactory.CreateWithCompletionGroup(completionGroup)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the credentials to use to authenticate with the origin server.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.servercredential
     * @type {PasswordCredential} 
     */
    ServerCredential {
        get => this.get_ServerCredential()
        set => this.put_ServerCredential(value)
    }

    /**
     * Gets or sets the proxy credentials for the upload.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.proxycredential
     * @type {PasswordCredential} 
     */
    ProxyCredential {
        get => this.get_ProxyCredential()
        set => this.put_ProxyCredential(value)
    }

    /**
     * Gets or sets the HTTP method used for the upload. The default method used for upload operations is POST.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.method
     * @type {HSTRING} 
     */
    Method {
        get => this.get_Method()
        set => this.put_Method(value)
    }

    /**
     * > [!NOTE]
     * > Group may be altered or unavailable for releases after Windows 8.1. Instead, use [TransferGroup](backgrounduploader_transfergroup.md).
     * 
     * Gets or sets a string value (for example, a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid)) indicating the group the upload will belong to. An upload operation with a group ID will only appear in operation enumerations using [GetCurrentDownloadsAsync(String)](backgrounddownloader_getcurrentdownloadsasync_405117897.md) with the specific group string value.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.group
     * @type {HSTRING} 
     */
    Group {
        get => this.get_Group()
        set => this.put_Group(value)
    }

    /**
     * Gets or sets the cost policy for the background upload operation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.costpolicy
     * @type {Integer} 
     */
    CostPolicy {
        get => this.get_CostPolicy()
        set => this.put_CostPolicy(value)
    }

    /**
     * Gets or sets the group that an upload operation will belong to.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.transfergroup
     * @type {BackgroundTransferGroup} 
     */
    TransferGroup {
        get => this.get_TransferGroup()
        set => this.put_TransferGroup(value)
    }

    /**
     * Gets or sets the [ToastNotification](../windows.ui.notifications/toastnotification.md) that defines the content, associated metadata, and events used in a toast notification to indicate success of an upload to the user.
     * @remarks
     * An app that uses [Windows.Networking.BackgroundTransfer](windows_networking_backgroundtransfer.md) to communicate through a toast notification must declare that it is **Toast capable** in the app manifest file. The **Toast capable** setting is located under the **Notifications** section of **Application** tab. Set the **Toast capable** option to "Yes" so the app can receive toast notifications.
     * 
     * If **Toast capable** is not enabled in the app manifest, then any toast settings in the [Windows.Networking.BackgroundTransfer](windows_networking_backgroundtransfer.md) namespace will be silently ignored and no toasts notifications will be received by the app.
     * 
     * > [!NOTE]
     * > A user can manually disable or enable toast notifications for your app at any time.
     * 
     * For more information on toast notifications, see [Sending toast notifications](/previous-versions/windows/apps/hh868266(v=win.10)) and [How to opt in for toast notifications](/previous-versions/windows/apps/hh868218(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.successtoastnotification
     * @type {ToastNotification} 
     */
    SuccessToastNotification {
        get => this.get_SuccessToastNotification()
        set => this.put_SuccessToastNotification(value)
    }

    /**
     * Gets or sets the [ToastNotification](../windows.ui.notifications/toastnotification.md) that defines the content, associated metadata, and events used in a toast notification to indicate failure of an upload to the user.
     * @remarks
     * An app that uses [Windows.Networking.BackgroundTransfer](windows_networking_backgroundtransfer.md) to communicate through a toast notification must declare that it is **Toast capable** in the app manifest file. The **Toast capable** setting is located under the **Notifications** section of **Application** tab. Set the **Toast capable** option to "Yes" so the app can receive toast notifications.
     * 
     * If **Toast capable** is not enabled in the app manifest, then any toast settings in the [Windows.Networking.BackgroundTransfer](windows_networking_backgroundtransfer.md) namespace will be silently ignored and no toasts notifications will be received by the app.
     * 
     * > [!NOTE]
     * > A user can manually disable or enable toast notifications for your app at any time.
     * 
     * For more information on toast notifications, see [Sending toast notifications](/previous-versions/windows/apps/hh868266(v=win.10)) and [How to opt in for toast notifications](/previous-versions/windows/apps/hh868218(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.failuretoastnotification
     * @type {ToastNotification} 
     */
    FailureToastNotification {
        get => this.get_FailureToastNotification()
        set => this.put_FailureToastNotification(value)
    }

    /**
     * Gets and sets the [TileNotification](../windows.ui.notifications/tilenotification.md) used to define the visuals, identification tag, and expiration time of a tile notification used to update the app tile when indicating success of an upload to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.successtilenotification
     * @type {TileNotification} 
     */
    SuccessTileNotification {
        get => this.get_SuccessTileNotification()
        set => this.put_SuccessTileNotification(value)
    }

    /**
     * Gets and sets the [TileNotification](../windows.ui.notifications/tilenotification.md) used to define the visuals, identification tag, and expiration time of a tile notification used to update the app tile when indicating failure of an upload to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.failuretilenotification
     * @type {TileNotification} 
     */
    FailureTileNotification {
        get => this.get_FailureTileNotification()
        set => this.put_FailureTileNotification(value)
    }

    /**
     * Gets the [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) associated with the [BackgroundUploader](backgrounduploader.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.completiongroup
     * @type {BackgroundTransferCompletionGroup} 
     */
    CompletionGroup {
        get => this.get_CompletionGroup()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Instantiates a new [BackgroundUploader](backgrounduploader.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundUploader")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Initializes an [UploadOperation](uploadoperation.md) that indicates the location for and file for upload.
     * @remarks
     * > [!IMPORTANT]
     * > Creating a large number of transfers on the main UI thread with **CreateUpload** can result in degraded performance of your app's UI. If you are queuing up a large number of transfers, it is recommended that you call **CreateUpload** on a background worker thread as in the following example.
     * 
     * ```csharp
     * operation = await Task.Run(() => { return myDownloader.CreateUpload(uri, file); });
     * 
     * ```
     * @param {Uri} uri_ The location for the upload.
     * @param {IStorageFile} sourceFile_ The file for upload.
     * @returns {UploadOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.createupload
     */
    CreateUpload(uri_, sourceFile_) {
        if (!this.HasProp("__IBackgroundUploader")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader := IBackgroundUploader(outPtr)
        }

        return this.__IBackgroundUploader.CreateUpload(uri_, sourceFile_)
    }

    /**
     * Returns an asynchronous operation that, on completion, returns an [UploadOperation](uploadoperation.md) with the specified URI and the source stream.
     * @param {Uri} uri_ The URI associated with the resource.
     * @param {IInputStream} sourceStream Represents the source stream.
     * @returns {IAsyncOperation<UploadOperation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.createuploadfromstreamasync
     */
    CreateUploadFromStreamAsync(uri_, sourceStream) {
        if (!this.HasProp("__IBackgroundUploader")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader := IBackgroundUploader(outPtr)
        }

        return this.__IBackgroundUploader.CreateUploadFromStreamAsync(uri_, sourceStream)
    }

    /**
     * Returns an asynchronous operation that, on completion, returns an [UploadOperation](uploadoperation.md) with the specified URI, one or more [BackgroundTransferContentPart](backgroundtransfercontentpart.md) objects, and the multipart subtype.
     * @param {Uri} uri_ The location for the upload.
     * @param {IIterable<BackgroundTransferContentPart>} parts One or more [BackgroundTransferContentPart](backgroundtransfercontentpart.md) objects.
     * @returns {IAsyncOperation<UploadOperation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.createuploadasync
     */
    CreateUploadWithFormDataAndAutoBoundaryAsync(uri_, parts) {
        if (!this.HasProp("__IBackgroundUploader")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader := IBackgroundUploader(outPtr)
        }

        return this.__IBackgroundUploader.CreateUploadWithFormDataAndAutoBoundaryAsync(uri_, parts)
    }

    /**
     * Returns an asynchronous operation that, on completion, returns an [UploadOperation](uploadoperation.md) with the specified URI, multipart subtype, one or more [BackgroundTransferContentPart](backgroundtransfercontentpart.md) objects, and the delimiter boundary value used to separate each part.
     * @param {Uri} uri_ The location for the upload.
     * @param {IIterable<BackgroundTransferContentPart>} parts One or more [BackgroundTransferContentPart](backgroundtransfercontentpart.md) objects.
     * @param {HSTRING} subType The multipart subtype. For example, "related" for content of type "multipart//*related** ".
     * @returns {IAsyncOperation<UploadOperation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.createuploadasync
     */
    CreateUploadWithSubTypeAsync(uri_, parts, subType) {
        if (!this.HasProp("__IBackgroundUploader")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader := IBackgroundUploader(outPtr)
        }

        return this.__IBackgroundUploader.CreateUploadWithSubTypeAsync(uri_, parts, subType)
    }

    /**
     * Returns an asynchronous operation that, on completion, returns an [UploadOperation](uploadoperation.md) with the specified URI and one or more [BackgroundTransferContentPart](backgroundtransfercontentpart.md) objects.
     * @param {Uri} uri_ The location for the upload.
     * @param {IIterable<BackgroundTransferContentPart>} parts One or more [BackgroundTransferContentPart](backgroundtransfercontentpart.md) objects.
     * @param {HSTRING} subType 
     * @param {HSTRING} boundary 
     * @returns {IAsyncOperation<UploadOperation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.createuploadasync
     */
    CreateUploadWithSubTypeAndBoundaryAsync(uri_, parts, subType, boundary) {
        if (!this.HasProp("__IBackgroundUploader")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader := IBackgroundUploader(outPtr)
        }

        return this.__IBackgroundUploader.CreateUploadWithSubTypeAndBoundaryAsync(uri_, parts, subType, boundary)
    }

    /**
     * Used to set an HTTP request header.
     * @param {HSTRING} headerName The header name.
     * @param {HSTRING} headerValue The header value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounduploader.setrequestheader
     */
    SetRequestHeader(headerName, headerValue) {
        if (!this.HasProp("__IBackgroundTransferBase")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferBase := IBackgroundTransferBase(outPtr)
        }

        return this.__IBackgroundTransferBase.SetRequestHeader(headerName, headerValue)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ServerCredential() {
        if (!this.HasProp("__IBackgroundTransferBase")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferBase := IBackgroundTransferBase(outPtr)
        }

        return this.__IBackgroundTransferBase.get_ServerCredential()
    }

    /**
     * 
     * @param {PasswordCredential} credential 
     * @returns {HRESULT} 
     */
    put_ServerCredential(credential) {
        if (!this.HasProp("__IBackgroundTransferBase")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferBase := IBackgroundTransferBase(outPtr)
        }

        return this.__IBackgroundTransferBase.put_ServerCredential(credential)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ProxyCredential() {
        if (!this.HasProp("__IBackgroundTransferBase")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferBase := IBackgroundTransferBase(outPtr)
        }

        return this.__IBackgroundTransferBase.get_ProxyCredential()
    }

    /**
     * 
     * @param {PasswordCredential} credential 
     * @returns {HRESULT} 
     */
    put_ProxyCredential(credential) {
        if (!this.HasProp("__IBackgroundTransferBase")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferBase := IBackgroundTransferBase(outPtr)
        }

        return this.__IBackgroundTransferBase.put_ProxyCredential(credential)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Method() {
        if (!this.HasProp("__IBackgroundTransferBase")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferBase := IBackgroundTransferBase(outPtr)
        }

        return this.__IBackgroundTransferBase.get_Method()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Method(value) {
        if (!this.HasProp("__IBackgroundTransferBase")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferBase := IBackgroundTransferBase(outPtr)
        }

        return this.__IBackgroundTransferBase.put_Method(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Group() {
        if (!this.HasProp("__IBackgroundTransferBase")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferBase := IBackgroundTransferBase(outPtr)
        }

        return this.__IBackgroundTransferBase.get_Group()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Group(value) {
        if (!this.HasProp("__IBackgroundTransferBase")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferBase := IBackgroundTransferBase(outPtr)
        }

        return this.__IBackgroundTransferBase.put_Group(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CostPolicy() {
        if (!this.HasProp("__IBackgroundTransferBase")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferBase := IBackgroundTransferBase(outPtr)
        }

        return this.__IBackgroundTransferBase.get_CostPolicy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CostPolicy(value) {
        if (!this.HasProp("__IBackgroundTransferBase")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferBase := IBackgroundTransferBase(outPtr)
        }

        return this.__IBackgroundTransferBase.put_CostPolicy(value)
    }

    /**
     * 
     * @returns {BackgroundTransferGroup} 
     */
    get_TransferGroup() {
        if (!this.HasProp("__IBackgroundUploader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader2 := IBackgroundUploader2(outPtr)
        }

        return this.__IBackgroundUploader2.get_TransferGroup()
    }

    /**
     * 
     * @param {BackgroundTransferGroup} value 
     * @returns {HRESULT} 
     */
    put_TransferGroup(value) {
        if (!this.HasProp("__IBackgroundUploader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader2 := IBackgroundUploader2(outPtr)
        }

        return this.__IBackgroundUploader2.put_TransferGroup(value)
    }

    /**
     * 
     * @returns {ToastNotification} 
     */
    get_SuccessToastNotification() {
        if (!this.HasProp("__IBackgroundUploader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader2 := IBackgroundUploader2(outPtr)
        }

        return this.__IBackgroundUploader2.get_SuccessToastNotification()
    }

    /**
     * 
     * @param {ToastNotification} value 
     * @returns {HRESULT} 
     */
    put_SuccessToastNotification(value) {
        if (!this.HasProp("__IBackgroundUploader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader2 := IBackgroundUploader2(outPtr)
        }

        return this.__IBackgroundUploader2.put_SuccessToastNotification(value)
    }

    /**
     * 
     * @returns {ToastNotification} 
     */
    get_FailureToastNotification() {
        if (!this.HasProp("__IBackgroundUploader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader2 := IBackgroundUploader2(outPtr)
        }

        return this.__IBackgroundUploader2.get_FailureToastNotification()
    }

    /**
     * 
     * @param {ToastNotification} value 
     * @returns {HRESULT} 
     */
    put_FailureToastNotification(value) {
        if (!this.HasProp("__IBackgroundUploader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader2 := IBackgroundUploader2(outPtr)
        }

        return this.__IBackgroundUploader2.put_FailureToastNotification(value)
    }

    /**
     * 
     * @returns {TileNotification} 
     */
    get_SuccessTileNotification() {
        if (!this.HasProp("__IBackgroundUploader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader2 := IBackgroundUploader2(outPtr)
        }

        return this.__IBackgroundUploader2.get_SuccessTileNotification()
    }

    /**
     * 
     * @param {TileNotification} value 
     * @returns {HRESULT} 
     */
    put_SuccessTileNotification(value) {
        if (!this.HasProp("__IBackgroundUploader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader2 := IBackgroundUploader2(outPtr)
        }

        return this.__IBackgroundUploader2.put_SuccessTileNotification(value)
    }

    /**
     * 
     * @returns {TileNotification} 
     */
    get_FailureTileNotification() {
        if (!this.HasProp("__IBackgroundUploader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader2 := IBackgroundUploader2(outPtr)
        }

        return this.__IBackgroundUploader2.get_FailureTileNotification()
    }

    /**
     * 
     * @param {TileNotification} value 
     * @returns {HRESULT} 
     */
    put_FailureTileNotification(value) {
        if (!this.HasProp("__IBackgroundUploader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader2 := IBackgroundUploader2(outPtr)
        }

        return this.__IBackgroundUploader2.put_FailureTileNotification(value)
    }

    /**
     * 
     * @returns {BackgroundTransferCompletionGroup} 
     */
    get_CompletionGroup() {
        if (!this.HasProp("__IBackgroundUploader3")) {
            if ((queryResult := this.QueryInterface(IBackgroundUploader3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundUploader3 := IBackgroundUploader3(outPtr)
        }

        return this.__IBackgroundUploader3.get_CompletionGroup()
    }

;@endregion Instance Methods
}
