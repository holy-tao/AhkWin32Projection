#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTransferCompletionGroupTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) that can be only accessed from the [Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method on the [IBackgroundTask](../windows.applicationmodel.background/ibackgroundtask.md).
 * @remarks
 * The [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) class allows an app to register to receive immediate notification after background transfer operations are complete even if the app is not in the foreground. The app registers a background task to receive notification that occurs if the background transfers completed successfully or if an error occurred. This allows the app to be immediately notified at the time of completion, instead of requiring that the app wait until the next time the app is restarted or moved to the foreground to query for completions.
 * 
 * The app must implement the [IBackgroundTask](../windows.applicationmodel.background/ibackgroundtask.md) to run that receives the completion notifications. The [IBackgroundTask](../windows.applicationmodel.background/ibackgroundtask.md) must be registered using the [BackgroundTaskBuilder](../windows.applicationmodel.background/backgroundtaskbuilder.md) class. The background task must be declared in the app manifest. The app does not require lock screen access to use a [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md).
 * 
 * A BackgroundTransferCompletionGroupTriggerDetails instance is created when the background task for a [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) has received a notification after background transfer operations are complete.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercompletiongrouptriggerdetails
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundTransferCompletionGroupTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTransferCompletionGroupTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTransferCompletionGroupTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of [DownloadOperation](downloadoperation.md) objects associated with the [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercompletiongrouptriggerdetails.downloads
     * @type {IVectorView<DownloadOperation>} 
     */
    Downloads {
        get => this.get_Downloads()
    }

    /**
     * Gets the list of [UploadOperation](uploadoperation.md) objects associated with the [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercompletiongrouptriggerdetails.uploads
     * @type {IVectorView<UploadOperation>} 
     */
    Uploads {
        get => this.get_Uploads()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<DownloadOperation>} 
     */
    get_Downloads() {
        if (!this.HasProp("__IBackgroundTransferCompletionGroupTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferCompletionGroupTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferCompletionGroupTriggerDetails := IBackgroundTransferCompletionGroupTriggerDetails(outPtr)
        }

        return this.__IBackgroundTransferCompletionGroupTriggerDetails.get_Downloads()
    }

    /**
     * 
     * @returns {IVectorView<UploadOperation>} 
     */
    get_Uploads() {
        if (!this.HasProp("__IBackgroundTransferCompletionGroupTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferCompletionGroupTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferCompletionGroupTriggerDetails := IBackgroundTransferCompletionGroupTriggerDetails(outPtr)
        }

        return this.__IBackgroundTransferCompletionGroupTriggerDetails.get_Uploads()
    }

;@endregion Instance Methods
}
