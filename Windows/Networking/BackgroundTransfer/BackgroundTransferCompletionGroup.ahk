#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTransferCompletionGroup.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a set of background transfer operations ([DownloadOperation](downloadoperation.md) or [UploadOperation](uploadoperation.md) objects) that trigger a background task once all the operations are done (if the operations completed successfully) or fail with an error.
 * @remarks
 * The BackgroundTransferCompletionGroup class allows an app to register to receive immediate notification after background transfer operations are complete even if the app is not in the foreground. The app registers a background task to receive notification that occurs if the background transfers completed successfully or if an error occurred. This allows the app to be immediately notified at the time of completion, instead of requiring that the app wait until the next time the app is restarted or moved to the foreground to query for completions.
 * 
 * The app must implement the [IBackgroundTask](../windows.applicationmodel.background/ibackgroundtask.md) to run that receives the completion notifications. The [IBackgroundTask](../windows.applicationmodel.background/ibackgroundtask.md) must be registered using the [BackgroundTaskBuilder](../windows.applicationmodel.background/backgroundtaskbuilder.md) class. When [BackgroundTransferCompletionGroup.Trigger](backgroundtransfercompletiongroup_trigger.md) is used to set up the task, the Broker Infrastructure will automatically unregister it as soon as it is triggered, so there is no need to have any explicit task unregistration code.
 * 
 * The background task must be declared in the app manifest. The app does not require lock screen access to use a BackgroundTransferCompletionGroup.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercompletiongroup
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class BackgroundTransferCompletionGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTransferCompletionGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTransferCompletionGroup.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [IBackgroundTrigger](../windows.applicationmodel.background/ibackgroundtrigger.md) used to set up the background task associated with the [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md).
     * @remarks
     * An [IBackgroundTrigger](../windows.applicationmodel.background/ibackgroundtrigger.md) must be used to set up the [IBackgroundTask](../windows.applicationmodel.background/ibackgroundtask.md) associated with a [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md). This trigger is configured to be used only once, so the Broker Infrastructure will automatically unregister the task as soon as it is triggered. Thus, there is no need to have any explicit task unregistration code.
     * 
     * An [IBackgroundTrigger](../windows.applicationmodel.background/ibackgroundtrigger.md) can be associated only with one [IBackgroundTask](../windows.applicationmodel.background/ibackgroundtask.md).
     * 
     * This property never is **NULL**.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercompletiongroup.trigger
     * @type {IBackgroundTrigger} 
     */
    Trigger {
        get => this.get_Trigger()
    }

    /**
     * Gets a value that indicates if [Enable](backgroundtransfercompletiongroup_enable_366433390.md) method on a [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) has already been called.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercompletiongroup.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.BackgroundTransferCompletionGroup")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBackgroundTrigger} 
     */
    get_Trigger() {
        if (!this.HasProp("__IBackgroundTransferCompletionGroup")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferCompletionGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferCompletionGroup := IBackgroundTransferCompletionGroup(outPtr)
        }

        return this.__IBackgroundTransferCompletionGroup.get_Trigger()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IBackgroundTransferCompletionGroup")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferCompletionGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferCompletionGroup := IBackgroundTransferCompletionGroup(outPtr)
        }

        return this.__IBackgroundTransferCompletionGroup.get_IsEnabled()
    }

    /**
     * Indicates that the [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) is complete and no more background transfer operations ([DownloadOperation](downloadoperation.md) or [UploadOperation](uploadoperation.md) objects) will be added t the completion group.
     * @remarks
     * The Enable method must be called on the [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) to enable the completion group, otherwise the background task associated with the [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) will never be called.
     * 
     * Any attempt to add a [DownloadOperation](downloadoperation.md) or [UploadOperation](uploadoperation.md) to the [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) after calling the Enable method will result in an exception.
     * 
     * The Enable method on a [BackgroundTransferCompletionGroup](backgroundtransfercompletiongroup.md) can only be called once. An attempt to call the Enable method more than once will result in an exception.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.backgroundtransfercompletiongroup.enable
     */
    Enable() {
        if (!this.HasProp("__IBackgroundTransferCompletionGroup")) {
            if ((queryResult := this.QueryInterface(IBackgroundTransferCompletionGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundTransferCompletionGroup := IBackgroundTransferCompletionGroup(outPtr)
        }

        return this.__IBackgroundTransferCompletionGroup.Enable()
    }

;@endregion Instance Methods
}
