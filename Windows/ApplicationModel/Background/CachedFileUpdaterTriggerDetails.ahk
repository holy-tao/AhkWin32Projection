#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICachedFileUpdaterTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides details about the cached file operation that invoked the trigger.
 * @remarks
 * > [!NOTE]
 * > Obtain an instance of this class from an object that implements [Windows.ApplicationModel.Background.IBackgroundTaskInstance.TriggerDetails](ibackgroundtaskinstance_triggerdetails.md)
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.cachedfileupdatertriggerdetails
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class CachedFileUpdaterTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICachedFileUpdaterTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICachedFileUpdaterTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [CachedFileTarget](../windows.storage.provider/cachedfiletarget.md) object associated with cached file update that indicates whether the local or remote file should be updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.cachedfileupdatertriggerdetails.updatetarget
     * @type {Integer} 
     */
    UpdateTarget {
        get => this.get_UpdateTarget()
    }

    /**
     * Gets the [FileUpdateRequest](../windows.storage.provider/fileupdaterequest.md) object associated with the cached file update.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.cachedfileupdatertriggerdetails.updaterequest
     * @type {FileUpdateRequest} 
     */
    UpdateRequest {
        get => this.get_UpdateRequest()
    }

    /**
     * Gets whether the system can display UI allowing the user to launch provider app in response to the cached file updater trigger.
     * @remarks
     * The Cached File Updater pattern allows the provider app to specify that user input is needed to complete the cached file update by setting the [Status](../windows.storage.provider/fileupdaterequest_status.md) property of the associated [FileUpdateRequest](../windows.storage.provider/fileupdaterequest.md) to [UserInputNeeded](../windows.storage.provider/fileupdaterequest_userinputneededmessage.md). It is possible that the system may not be able to show UI to the user during the background task, if the app that updated the file is not currently running in the foreground, for example. In this case, CanRequestUserInput will be false. So, you should check this value before requesting for the system to show UI. Setting the [FileUpdateRequest](../windows.storage.provider/fileupdaterequest.md) status to [UserInputNeeded](../windows.storage.provider/fileupdaterequest_userinputneededmessage.md) will throw an exception if CanRequestUserInput is false.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.cachedfileupdatertriggerdetails.canrequestuserinput
     * @type {Boolean} 
     */
    CanRequestUserInput {
        get => this.get_CanRequestUserInput()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UpdateTarget() {
        if (!this.HasProp("__ICachedFileUpdaterTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterTriggerDetails := ICachedFileUpdaterTriggerDetails(outPtr)
        }

        return this.__ICachedFileUpdaterTriggerDetails.get_UpdateTarget()
    }

    /**
     * 
     * @returns {FileUpdateRequest} 
     */
    get_UpdateRequest() {
        if (!this.HasProp("__ICachedFileUpdaterTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterTriggerDetails := ICachedFileUpdaterTriggerDetails(outPtr)
        }

        return this.__ICachedFileUpdaterTriggerDetails.get_UpdateRequest()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRequestUserInput() {
        if (!this.HasProp("__ICachedFileUpdaterTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterTriggerDetails := ICachedFileUpdaterTriggerDetails(outPtr)
        }

        return this.__ICachedFileUpdaterTriggerDetails.get_CanRequestUserInput()
    }

;@endregion Instance Methods
}
