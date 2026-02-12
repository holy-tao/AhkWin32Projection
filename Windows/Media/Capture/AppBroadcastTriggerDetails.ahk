#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides details associated with a broadcast app background task.
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * Get an instance of this class by casting the [TriggerDetails](../windows.applicationmodel.background/ibackgroundtaskinstance_triggerdetails.md) property of the [IBackgroundTaskInstance](../windows.applicationmodel.background/ibackgroundtaskinstance.md) passed into your background task's [Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcasttriggerdetails
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object that provides an interface between the broadcasting UWP app and the system-hosted broadcast service.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcasttriggerdetails.backgroundservice
     * @type {AppBroadcastBackgroundService} 
     */
    BackgroundService {
        get => this.get_BackgroundService()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AppBroadcastBackgroundService} 
     */
    get_BackgroundService() {
        if (!this.HasProp("__IAppBroadcastTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastTriggerDetails := IAppBroadcastTriggerDetails(outPtr)
        }

        return this.__IAppBroadcastTriggerDetails.get_BackgroundService()
    }

;@endregion Instance Methods
}
