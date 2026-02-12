#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundDownloader.ahk
#Include .\IBackgroundTransferBase.ahk
#Include .\IBackgroundDownloader2.ahk
#Include .\IBackgroundDownloader3.ahk
#Include .\IBackgroundDownloaderStaticMethods.ahk
#Include .\IBackgroundDownloaderStaticMethods2.ahk
#Include .\IBackgroundDownloaderFactory.ahk
#Include .\IBackgroundDownloaderUserConsent.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to configure downloads prior to the actual creation of the download operation using [CreateDownload](backgrounddownloader_createdownload_1461958690.md). For an overview of Background Transfer capabilities, see [Transferring data in the background](/previous-versions/windows/apps/hh452979(v=win.10)). Download the [Background transfer sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/BackgroundTransfer) for a code example.
  * 
  * > [!NOTE]
  * > Background Transfer is primarily designed for long-term transfer operations for resources like video, music, and large images. For short-term operations involving transfers of smaller resources (i.e. a couple KB), use the [Windows.Web.Http](../windows.web.http/windows_web_http.md) namespace.
 * @remarks
 * After app termination, an app should enumerate all existing [DownloadOperation](downloadoperation.md) instances at next start-up using [GetCurrentDownloadsAsync](backgrounddownloader_getcurrentdownloadsasync_1101292265.md). When a UWP app using Background Transfer is terminated, incomplete downloads will persist in the background. If the app is restarted after termination and operations from the previous session are not enumerated and re-attached to the current session, they will remain incomplete and continue to occupy resources.
 * 
 * > [!NOTE]
 * > When an app is uninstalled any current or persisted Background Transfer operations associated with it are cleaned up.
 * 
 * Background transfer doesn't support concurrent downloads of the same [Uri](../windows.foundation/uri.md). So an app can download *`http://example.com/myfile.wmv`* once, or download it again after a previous download completed. An app shouldn't start two downloads of the same [Uri](../windows.foundation/uri.md) concurrently, since this may result in truncated files.
 * 
 * When implementing a library for Background Transfer operations, and this same library is used by other apps or components, specify a unique*group* name string (for example, a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid)) when creating downloads. An download with a group name string can only be enumerated by providing the matching string to [GetCurrentDownloadsAsync(String)](backgrounddownloader_getcurrentdownloadsasync_405117897.md), and will not appear in [GetCurrentDownloadsAsync](backgrounddownloader_getcurrentdownloadsasync_1101292265.md) calls without. This will ensure that other apps implementing that same library for downloads will not see your downloads.
 * 
 * Download operations via FTP are supported. However, for FTP operations, authentication credentials must be provided within the specified URI. For example, **ftp://user:password@server/file.txt**.
 * 
 * Security concerns can exist when download operations require a username and password for authentication. If the authentication model to be used is supported by **WinINet**, use the [ServerCredential](backgrounddownloader_servercredential.md) or [ProxyCredential](backgrounddownloader_proxycredential.md) properties. These values will be securely saved in **WinVault**. For information on supported authentication methods, see [Handling Authentication](/windows/desktop/WinInet/handling-authentication).
 * 
 * If the authentication model is not supported by **WinINet**, use [HttpClient](../windows.web.http/httpclient.md) to implement custom authentication and obtain a download-specific secure token (cookie). Set the appropriate header to have the secure token value used for background transfer. The service should limit the validity of the secure token only to the file that is being downloaded. 
 * 
 * > [!NOTE]
 * > The secure token will be stored in clear text within the application's folder.
 * 
 * Upload services that require the username and password be set in clear text in a custom header for each download file are insecure. Background transfer will cache the headers in clear text for the duration of the operation within the app's folder.
 * 
 * **Toast notifications**
 * 
 * The BackgroundDownloader class in Windows 8.1 and Windows Server 2012 R2 supports options for the user to receive tile and toast notifications when a transfer is completed successfully or fails to complete.
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
 * **Handling exceptions**
 * 
 * A number of errors can cause exceptions to occur during a download operation. You should write code to handle exceptions when you call methods on this class. Exceptions can result from parameter validation errors, name resolution failures, and network errors. Exceptions from network errors (loss of connectivity, connection failures, and other HTTP errors, for example) can happen at any time. These errors result in exceptions being thrown. If not handled by your app, an exception can cause your entire app to be terminated by the runtime.
 * 
 * An app can use the **HRESULT** from the exception to determine the error that caused the exception. An app can then decide how to handle the exception based on the error code. The [BackgroundTransferError.GetStatus](backgroundtransfererror_getstatus_1856274933.md) method can convert most **HRESULT** values returned to a [WebErrorStatus](../windows.web/weberrorstatus.md) enumeration value. Most of the [WebErrorStatus](../windows.web/weberrorstatus.md) enumeration values correspond to an error returned by the native HTTP or FTP client operation. An app can filter on specific [WebErrorStatus](../windows.web/weberrorstatus.md) enumeration values to modify app behavior depending on the cause of the exception.
 * 
 * For information on network exceptions, see [Handling exceptions in network apps](/previous-versions/windows/apps/dn263211(v=win.10)).
 * 
 * **Debugging Guidance**
 * 
 * Stopping a debugging session in Microsoft Visual Studio is comparable to closing your app. Even while debugging, your app should enumerate and then, resume, restart, or cancel any downloads persisted from the previous session. For example, you can have your app cancel enumerated persisted download operations at app startup if there is no interest in previous operations for the current debug session.
 * 
 * If there are Microsoft Visual Studio project updates, like changes to the app manifest, and the app is uninstalled and re-deployed, [GetCurrentUploadsAsync](backgrounduploader_getcurrentuploadsasync_1938169689.md) cannot enumerate operations created using the previous app deployment.
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
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundDownloader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundDownloader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundDownloader.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!NOTE]
     * > GetCurrentDownloadsAsync(group) may be altered or unavailable for releases after Windows 8.1. Instead, use [GetCurrentDownloadsForTransferGroupAsync](backgrounddownloader_getcurrentdownloadsfortransfergroupasync_1466993145.md).
     * 
     * Returns a collection of pending downloads for a specific [Group](backgrounddownloader_group.md).
     * @remarks
     * On Windows, this method will return the error code HRESULT: 0x80070005 (E_ACCESSDENIED) if the Internet capability is not declared in your app manifest. This capability is enabled by default in all Store app project templates.
     * @returns {IAsyncOperation<IVectorView<DownloadOperation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.getcurrentdownloadsasync
     */
    static GetCurrentDownloadsAsync() {
        if (!BackgroundDownloader.HasProp("__IBackgroundDownloaderStaticMethods")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundDownloader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundDownloaderStaticMethods.IID)
            BackgroundDownloader.__IBackgroundDownloaderStaticMethods := IBackgroundDownloaderStaticMethods(factoryPtr)
        }

        return BackgroundDownloader.__IBackgroundDownloaderStaticMethods.GetCurrentDownloadsAsync()
    }

    /**
     * Returns a collection of pending downloads that are not associated with a BackgroundTransferGroup.
     * @remarks
     * On Windows, this method will return the error code HRESULT: 0x80070005 (E_ACCESSDENIED) if the Internet capability is not declared in your app manifest. This capability is enabled by default in all Store app project templates.
     * @param {HSTRING} group 
     * @returns {IAsyncOperation<IVectorView<DownloadOperation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.getcurrentdownloadsasync
     */
    static GetCurrentDownloadsForGroupAsync(group) {
        if (!BackgroundDownloader.HasProp("__IBackgroundDownloaderStaticMethods")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundDownloader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundDownloaderStaticMethods.IID)
            BackgroundDownloader.__IBackgroundDownloaderStaticMethods := IBackgroundDownloaderStaticMethods(factoryPtr)
        }

        return BackgroundDownloader.__IBackgroundDownloaderStaticMethods.GetCurrentDownloadsForGroupAsync(group)
    }

    /**
     * Gets all downloads associated with the provided [BackgroundTransferGroup](backgroundtransfergroup.md).
     * @param {BackgroundTransferGroup} group Contains information used to identify a group of downloads.
     * @returns {IAsyncOperation<IVectorView<DownloadOperation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.getcurrentdownloadsfortransfergroupasync
     */
    static GetCurrentDownloadsForTransferGroupAsync(group) {
        if (!BackgroundDownloader.HasProp("__IBackgroundDownloaderStaticMethods2")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundDownloader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundDownloaderStaticMethods2.IID)
            BackgroundDownloader.__IBackgroundDownloaderStaticMethods2 := IBackgroundDownloaderStaticMethods2(factoryPtr)
        }

        return BackgroundDownloader.__IBackgroundDownloaderStaticMethods2.GetCurrentDownloadsForTransferGroupAsync(group)
    }

    /**
     * Creates a new [BackgroundDownloader](backgrounddownloader.md) object with a [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md).
     * @remarks
     * This constructor will associate all downloads created with the [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) passed in the *completionGroup* parameter. Once the [Enable](backgroundtransfercompletiongroup_enable_366433390.md) method is called on the [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md), no more additional downloads can be created using this [BackgroundDownloader](backgrounddownloader.md) object.
     * @param {BackgroundTransferCompletionGroup} completionGroup The completion group to associate with this [BackgroundDownloader](backgrounddownloader.md) object.
     * 
     * This parameter cannot be **NULL**.
     * @returns {BackgroundDownloader} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.#ctor
     */
    static CreateWithCompletionGroup(completionGroup) {
        if (!BackgroundDownloader.HasProp("__IBackgroundDownloaderFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundDownloader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundDownloaderFactory.IID)
            BackgroundDownloader.__IBackgroundDownloaderFactory := IBackgroundDownloaderFactory(factoryPtr)
        }

        return BackgroundDownloader.__IBackgroundDownloaderFactory.CreateWithCompletionGroup(completionGroup)
    }

    /**
     * > [!NOTE]
     * > RequestUnconstrainedDownloadsAsync may be altered or unavailable for releases after Windows 10, version 1607. Instead, use [CreateDownloadAsync](backgrounddownloader_createdownloadasync_282410561.md).
     * 
     * Used to request an unconstrained download operation. When this method is called the user is provided with a UI prompt that they can use to indicate their consent for an unconstrained operation.An unconstrained transfer operation will run without the resource restrictions normally associated with background network operations while a device is running on battery.
     * @param {IIterable<DownloadOperation>} operations The download operation to run unconstrained.
     * @returns {IAsyncOperation<UnconstrainedTransferRequestResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.requestunconstraineddownloadsasync
     */
    static RequestUnconstrainedDownloadsAsync(operations) {
        if (!BackgroundDownloader.HasProp("__IBackgroundDownloaderUserConsent")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundDownloader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundDownloaderUserConsent.IID)
            BackgroundDownloader.__IBackgroundDownloaderUserConsent := IBackgroundDownloaderUserConsent(factoryPtr)
        }

        return BackgroundDownloader.__IBackgroundDownloaderUserConsent.RequestUnconstrainedDownloadsAsync(operations)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the credentials to use to authenticate with the origin server.
     * 
     * > [!NOTE]
     * > For downloads via FTP, authentication credentials must be provided within the specified URI. For example, **ftp://user:password@server/file.txt**.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.servercredential
     * @type {PasswordCredential} 
     */
    ServerCredential {
        get => this.get_ServerCredential()
        set => this.put_ServerCredential(value)
    }

    /**
     * Gets or sets the proxy credentials for the background transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.proxycredential
     * @type {PasswordCredential} 
     */
    ProxyCredential {
        get => this.get_ProxyCredential()
        set => this.put_ProxyCredential(value)
    }

    /**
     * Gets or sets the HTTP method used for the background download. The default method used for download operations is GET.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.method
     * @type {HSTRING} 
     */
    Method {
        get => this.get_Method()
        set => this.put_Method(value)
    }

    /**
     * > [!NOTE]
     * > Group may be altered or unavailable for releases after Windows 8.1. Instead, use [TransferGroup](backgrounddownloader_transfergroup.md).
     * 
     * Gets or sets a string value (for example, a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid)) indicating the group the transfer will belong to. A download operation with a group ID will only appear in operation enumerations using [GetCurrentDownloadsAsync(String)](backgrounddownloader_getcurrentdownloadsasync_405117897.md) with the specific group string value.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.group
     * @type {HSTRING} 
     */
    Group {
        get => this.get_Group()
        set => this.put_Group(value)
    }

    /**
     * Gets or sets the cost policy for the background download operation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.costpolicy
     * @type {Integer} 
     */
    CostPolicy {
        get => this.get_CostPolicy()
        set => this.put_CostPolicy(value)
    }

    /**
     * Gets or sets the group that a download operation will belong to.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.transfergroup
     * @type {BackgroundTransferGroup} 
     */
    TransferGroup {
        get => this.get_TransferGroup()
        set => this.put_TransferGroup(value)
    }

    /**
     * Gets or sets the [ToastNotification](../windows.ui.notifications/toastnotification.md) that defines the content, associated metadata, and events used in a toast notification to indicate success of a download to the user.
     * @remarks
     * An app that uses [Windows.Networking.BackgroundTransfer](windows_networking_backgroundtransfer.md) to communicate through a toast notification must declare that it is **Toast capable** in the app manifest file. The **Toast capable** setting is located under the **Notifications** section of **Application** tab. Set the **Toast capable** option to "Yes" so the app can receive toast notifications.
     * 
     * If **Toast capable** is not enabled in the app manifest, then any toast settings in the [Windows.Networking.BackgroundTransfer](windows_networking_backgroundtransfer.md) namespace will be silently ignored and no toasts notifications will be received by the app.
     * 
     * > [!NOTE]
     * > A user can manually disable or enable toast notifications for your app at any time.
     * 
     * For more information on toast notifications, see [Sending toast notifications](/previous-versions/windows/apps/hh868266(v=win.10)) and [How to opt in for toast notifications](/previous-versions/windows/apps/hh868218(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.successtoastnotification
     * @type {ToastNotification} 
     */
    SuccessToastNotification {
        get => this.get_SuccessToastNotification()
        set => this.put_SuccessToastNotification(value)
    }

    /**
     * Gets or sets the [ToastNotification](../windows.ui.notifications/toastnotification.md) that defines the content, associated metadata, and events used in a toast notification to indicate failure of a download to the user.
     * @remarks
     * An app that uses [Windows.Networking.BackgroundTransfer](windows_networking_backgroundtransfer.md) to communicate through a toast notification must declare that it is **Toast capable** in the app manifest file. The **Toast capable** setting is located under the **Notifications** section of **Application** tab. Set the **Toast capable** option to "Yes" so the app can receive toast notifications.
     * 
     * If **Toast capable** is not enabled in the app manifest, then any toast settings in the [Windows.Networking.BackgroundTransfer](windows_networking_backgroundtransfer.md) namespace will be silently ignored and no toasts notifications will be received by the app.
     * 
     * > [!NOTE]
     * > A user can manually disable or enable toast notifications for your app at any time.
     * 
     * For more information on toast notifications, see [Sending toast notifications](/previous-versions/windows/apps/hh868266(v=win.10)) and [How to opt in for toast notifications](/previous-versions/windows/apps/hh868218(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.failuretoastnotification
     * @type {ToastNotification} 
     */
    FailureToastNotification {
        get => this.get_FailureToastNotification()
        set => this.put_FailureToastNotification(value)
    }

    /**
     * Gets or sets the [TileNotification](../windows.ui.notifications/tilenotification.md) used to define the visuals, identification tag, and expiration time of a tile notification used to update the app tile when indicating success of a download to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.successtilenotification
     * @type {TileNotification} 
     */
    SuccessTileNotification {
        get => this.get_SuccessTileNotification()
        set => this.put_SuccessTileNotification(value)
    }

    /**
     * Gets or sets the [TileNotification](../windows.ui.notifications/tilenotification.md) used to define the visuals, identification tag, and expiration time of a tile notification used to update the app tile when indicating failure of a download to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.failuretilenotification
     * @type {TileNotification} 
     */
    FailureTileNotification {
        get => this.get_FailureTileNotification()
        set => this.put_FailureTileNotification(value)
    }

    /**
     * Gets the [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) associated with the [BackgroundDownloader](backgrounddownloader.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.completiongroup
     * @type {BackgroundTransferCompletionGroup} 
     */
    CompletionGroup {
        get => this.get_CompletionGroup()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [BackgroundDownloader](backgrounddownloader.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundDownloader")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Initializes a [DownloadOperation](downloadoperation.md) object with the resource [Uri](../windows.foundation/uri.md), the file that the response is written to, and the request entity body.
     * @remarks
     * The resultant [DownloadOperation](downloadoperation.md) supports scenarios where a valid download request contains specific data required by the server. For example, a website requires a filled out form before the download can take place.
     * 
     * Background transfer doesn't support concurrent downloads of the same [Uri](../windows.foundation/uri.md). So an app can download *`http://example.com/myfile.wmv`* once, or download it again after a previous download completed. An app shouldn't start two downloads of the same [Uri](../windows.foundation/uri.md) concurrently, since this may result in truncated files.
     * 
     * > [!IMPORTANT]
     * > Creating a large number of transfers on the main UI thread with **CreateDownload** can result in degraded performance of your app's UI. If you are queuing up a large number of transfers, it is recommended that you call **CreateDownload** on a background worker thread as in the following example.
     * 
     * ```csharp
     * operation = await Task.Run(() => { return myDownloader.CreateDownload(uri, file); });
     * ```
     * 
     * > [!NOTE]
     * > Some file systems have file size limits. Background transfer has special logic to fast-fail transfers that exceed the destination drive's file size limits (for example, files that exceed 4GB in size for FAT32 file systems). If the server responds with a `Content-Length` header value greater than the file system's maximum file size, then the download operation immediately fails with HRESULT_FROM_WIN32(ERROR_FILE_SYSTEM_LIMITATION).
     * @param {Uri} uri_ The location of the resource.
     * @param {IStorageFile} resultFile The file that the response will be written to.
     * @returns {DownloadOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.createdownload
     */
    CreateDownload(uri_, resultFile) {
        if (!this.HasProp("__IBackgroundDownloader")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader := IBackgroundDownloader(outPtr)
        }

        return this.__IBackgroundDownloader.CreateDownload(uri_, resultFile)
    }

    /**
     * Initializes a [DownloadOperation](downloadoperation.md) object that contains the specified [Uri](../windows.foundation/uri.md) and the file that the response is written to.
     * @remarks
     * Background transfer doesn't support concurrent downloads of the same [Uri](../windows.foundation/uri.md). So an app can download *`http://example.com/myfile.wmv`* once, or download it again after a previous download completed. An app shouldn't start two downloads of the same [Uri](../windows.foundation/uri.md) concurrently, since this may result in truncated files.
     * 
     * > [!IMPORTANT]
     * > Creating a large number of transfers on the main UI thread with **CreateDownload** can result in degraded performance of your app's UI. If you are queuing up a large number of transfers, it is recommended that you call **CreateDownload** on a background worker thread as in the following example.
     * 
     * ```csharp
     * operation = await Task.Run(() => { return myDownloader.CreateDownload(uri, file); });
     * ```
     * 
     * > [!NOTE]
     * > Some file systems have file size limits. Background transfer has special logic to fast-fail transfers that exceed the destination drive's file size limits (for example, files that exceed 4GB in size for FAT32 file systems). If the server responds with a `Content-Length` header value greater than the file system's maximum file size, then the download operation immediately fails with HRESULT_FROM_WIN32(ERROR_FILE_SYSTEM_LIMITATION).
     * @param {Uri} uri_ The location of the resource.
     * @param {IStorageFile} resultFile The file that the response will be written to.
     * @param {IStorageFile} requestBodyFile 
     * @returns {DownloadOperation} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.createdownload
     */
    CreateDownloadFromFile(uri_, resultFile, requestBodyFile) {
        if (!this.HasProp("__IBackgroundDownloader")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader := IBackgroundDownloader(outPtr)
        }

        return this.__IBackgroundDownloader.CreateDownloadFromFile(uri_, resultFile, requestBodyFile)
    }

    /**
     * Creates an asynchronous download operation that includes a URI, the file that the response will be written to, and the [IInputStream](../windows.storage.streams/iinputstream.md) object from which the file contents are read.
     * @remarks
     * Background transfer doesn't support concurrent downloads of the same [Uri](../windows.foundation/uri.md). So an app can download *`http://example.com/myfile.wmv`* once, or download it again after a previous download completed. An app shouldn't start two downloads of the same [Uri](../windows.foundation/uri.md) concurrently, since this may result in truncated files.
     * 
     * > [!NOTE]
     * > Some file systems have file size limits. Background transfer has special logic to fast-fail transfers that exceed the destination drive's file size limits (for example, files that exceed 4GB in size for FAT32 file systems). If the server responds with a `Content-Length` header value greater than the file system's maximum file size, then the download operation immediately fails with HRESULT_FROM_WIN32(ERROR_FILE_SYSTEM_LIMITATION).
     * @param {Uri} uri_ The location of the resource.
     * @param {IStorageFile} resultFile Represents the file that the response will be written to.
     * @param {IInputStream} requestBodyStream A stream that represents the request entity body.
     * @returns {IAsyncOperation<DownloadOperation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.createdownloadasync
     */
    CreateDownloadAsync(uri_, resultFile, requestBodyStream) {
        if (!this.HasProp("__IBackgroundDownloader")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader := IBackgroundDownloader(outPtr)
        }

        return this.__IBackgroundDownloader.CreateDownloadAsync(uri_, resultFile, requestBodyStream)
    }

    /**
     * Used to set an HTTP request header.
     * @remarks
     * This method allows the caller to set request headers. This method can be called multiple times for the same header. The values will then be concatenated.
     * @param {HSTRING} headerName The header name.
     * @param {HSTRING} headerValue The header value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgrounddownloader.setrequestheader
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
        if (!this.HasProp("__IBackgroundDownloader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader2 := IBackgroundDownloader2(outPtr)
        }

        return this.__IBackgroundDownloader2.get_TransferGroup()
    }

    /**
     * 
     * @param {BackgroundTransferGroup} value 
     * @returns {HRESULT} 
     */
    put_TransferGroup(value) {
        if (!this.HasProp("__IBackgroundDownloader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader2 := IBackgroundDownloader2(outPtr)
        }

        return this.__IBackgroundDownloader2.put_TransferGroup(value)
    }

    /**
     * 
     * @returns {ToastNotification} 
     */
    get_SuccessToastNotification() {
        if (!this.HasProp("__IBackgroundDownloader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader2 := IBackgroundDownloader2(outPtr)
        }

        return this.__IBackgroundDownloader2.get_SuccessToastNotification()
    }

    /**
     * 
     * @param {ToastNotification} value 
     * @returns {HRESULT} 
     */
    put_SuccessToastNotification(value) {
        if (!this.HasProp("__IBackgroundDownloader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader2 := IBackgroundDownloader2(outPtr)
        }

        return this.__IBackgroundDownloader2.put_SuccessToastNotification(value)
    }

    /**
     * 
     * @returns {ToastNotification} 
     */
    get_FailureToastNotification() {
        if (!this.HasProp("__IBackgroundDownloader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader2 := IBackgroundDownloader2(outPtr)
        }

        return this.__IBackgroundDownloader2.get_FailureToastNotification()
    }

    /**
     * 
     * @param {ToastNotification} value 
     * @returns {HRESULT} 
     */
    put_FailureToastNotification(value) {
        if (!this.HasProp("__IBackgroundDownloader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader2 := IBackgroundDownloader2(outPtr)
        }

        return this.__IBackgroundDownloader2.put_FailureToastNotification(value)
    }

    /**
     * 
     * @returns {TileNotification} 
     */
    get_SuccessTileNotification() {
        if (!this.HasProp("__IBackgroundDownloader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader2 := IBackgroundDownloader2(outPtr)
        }

        return this.__IBackgroundDownloader2.get_SuccessTileNotification()
    }

    /**
     * 
     * @param {TileNotification} value 
     * @returns {HRESULT} 
     */
    put_SuccessTileNotification(value) {
        if (!this.HasProp("__IBackgroundDownloader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader2 := IBackgroundDownloader2(outPtr)
        }

        return this.__IBackgroundDownloader2.put_SuccessTileNotification(value)
    }

    /**
     * 
     * @returns {TileNotification} 
     */
    get_FailureTileNotification() {
        if (!this.HasProp("__IBackgroundDownloader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader2 := IBackgroundDownloader2(outPtr)
        }

        return this.__IBackgroundDownloader2.get_FailureTileNotification()
    }

    /**
     * 
     * @param {TileNotification} value 
     * @returns {HRESULT} 
     */
    put_FailureTileNotification(value) {
        if (!this.HasProp("__IBackgroundDownloader2")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader2 := IBackgroundDownloader2(outPtr)
        }

        return this.__IBackgroundDownloader2.put_FailureTileNotification(value)
    }

    /**
     * 
     * @returns {BackgroundTransferCompletionGroup} 
     */
    get_CompletionGroup() {
        if (!this.HasProp("__IBackgroundDownloader3")) {
            if ((queryResult := this.QueryInterface(IBackgroundDownloader3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundDownloader3 := IBackgroundDownloader3(outPtr)
        }

        return this.__IBackgroundDownloader3.get_CompletionGroup()
    }

;@endregion Instance Methods
}
