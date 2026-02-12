#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICachedFileUpdaterUI.ahk
#Include .\ICachedFileUpdaterUI2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CachedFileUpdaterUI.ahk
#Include .\FileUpdateRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Used to interact with the file picker if your app provides file updates through the Cached File Updater contract.
 * @remarks
 * Retrieve a CachedFileUpdaterUI object using the [CachedFileUpdaterActivatedEventArgs.CachedFileUpdaterUI](../windows.applicationmodel.activation/cachedfileupdateractivatedeventargs_cachedfileupdaterui.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.cachedfileupdaterui
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class CachedFileUpdaterUI extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICachedFileUpdaterUI

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICachedFileUpdaterUI.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the title to display in the top-left the file picker UI. The title identifies the location or context of the app's page (which is hosted in the file picker UI) for the user.
     * @remarks
     * You should update the title to indicate the current context of your app within the file picker. For example, you could set the title to "Login" if user login is required, or "Resolve conflict" if there is a file conflict.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.cachedfileupdaterui.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets a value that indicates which version of the file needs to be updated: the local version or the version in the app's repository.
     * @remarks
     * If your app participates in the Cached File Updater contract, you should use this property to respond to [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) events. If this property is [CachedFileTarget.Local](cachedfiletarget.md), your app should update the locally cached copy of the file to match the latest version of the file that is in your app's repository. Otherwise, if it's [CachedFileTarget.Remote](cachedfiletarget.md), your app should update the version of the file that is in your app's repository to match the latest, locally cached copy of the file.
     * 
     * The value of this property is applies to all of the [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) events that fire for a single [ActivationKind.CachedFileUpdater](../windows.applicationmodel.activation/activationkind.md) activation event.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.cachedfileupdaterui.updatetarget
     * @type {Integer} 
     */
    UpdateTarget {
        get => this.get_UpdateTarget()
    }

    /**
     * Gets an enum value that indicates the status of the file picker UI.
     * @remarks
     * When an app providing updates has responded to all [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) events, this property indicates [UIStatus.Complete](uistatus.md).
     * 
     * Check for the [UIStatus.Complete](uistatus.md) value to determine if your providing app has responded all [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) events. If the [UIStatus](uistatus.md) is [Complete](uistatus.md) your app should display page (which will be hosted in the file picker) to tell the user that the updates are complete.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.cachedfileupdaterui.uistatus
     * @type {Integer} 
     */
    UIStatus {
        get => this.get_UIStatus()
    }

    /**
     * Gets the file update request currently being processed by the cached file updater.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.cachedfileupdaterui.updaterequest
     * @type {FileUpdateRequest} 
     */
    UpdateRequest {
        get => this.get_UpdateRequest()
    }

    /**
     * Fires when the Windows requests a file update. This event fires once for each requested update.
     * @remarks
     * If your app participates in the Cached File Updater contract, you must register for this event in your app's activated event handler where you check for [ActivationKind.CachedFileUpdater](../windows.applicationmodel.activation/activationkind.md). You must respond to this FileUpdateRequested event by updating the file and setting the [FileUpdateRequest.Status](fileupdaterequest_status.md) of the request. Use the [CachedFileUpdaterUI](cachedfileupdaterui.md).[UpdateTarget](cachedfileupdaterui_updatetarget.md) property to determine whether your app should update the version file in its repository or the locally cached copy of the file in response to the request.
     * 
     * You can access information about the requested update by using the [FileUpdateRequestedEventArgs.Request](fileupdaterequestedeventargs_request.md) property on the object that is passed to your FileUpdateRequested event handler. 
     * 
     * If you need user input to complete the update, set the [FileUpdateRequest.Status](fileupdaterequest_status.md) to [FileUpdateStatus.UserInputNeeded](fileupdatestatus.md) and complete the request. If user interaction is available, another FileUpdateRequested will fire and your app can obtain user input and complete the request.
     * @type {TypedEventHandler<CachedFileUpdaterUI, FileUpdateRequestedEventArgs>}
    */
    OnFileUpdateRequested {
        get {
            if(!this.HasProp("__OnFileUpdateRequested")){
                this.__OnFileUpdateRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ed56ab72-ebd3-52c8-b0ac-987d30090351}"),
                    CachedFileUpdaterUI,
                    FileUpdateRequestedEventArgs
                )
                this.__OnFileUpdateRequestedToken := this.add_FileUpdateRequested(this.__OnFileUpdateRequested.iface)
            }
            return this.__OnFileUpdateRequested
        }
    }

    /**
     * Fires when the calling app needs to display the file picker letterbox UI that is represented by the [CachedFileUpdaterUI](cachedfileupdaterui.md) object.
     * 
     * A server may defer its UI initialization until it receives this event.
     * @remarks
     * The app can register to be notified when this event fires by adding an event listener to the [CachedFileUpdaterUI](cachedfileupdaterui.md) object and declaring a handler function. If the app has registered an event handler for this event, it must respond when the event fires by initializing its UI.
     * @type {TypedEventHandler<CachedFileUpdaterUI, IInspectable>}
    */
    OnUIRequested {
        get {
            if(!this.HasProp("__OnUIRequested")){
                this.__OnUIRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{45fdd443-c0b9-57b0-a84f-7d876edc3149}"),
                    CachedFileUpdaterUI,
                    IInspectable
                )
                this.__OnUIRequestedToken := this.add_UIRequested(this.__OnUIRequested.iface)
            }
            return this.__OnUIRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnFileUpdateRequestedToken")) {
            this.remove_FileUpdateRequested(this.__OnFileUpdateRequestedToken)
            this.__OnFileUpdateRequested.iface.Dispose()
        }

        if(this.HasProp("__OnUIRequestedToken")) {
            this.remove_UIRequested(this.__OnUIRequestedToken)
            this.__OnUIRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__ICachedFileUpdaterUI")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterUI := ICachedFileUpdaterUI(outPtr)
        }

        return this.__ICachedFileUpdaterUI.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__ICachedFileUpdaterUI")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterUI := ICachedFileUpdaterUI(outPtr)
        }

        return this.__ICachedFileUpdaterUI.put_Title(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UpdateTarget() {
        if (!this.HasProp("__ICachedFileUpdaterUI")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterUI := ICachedFileUpdaterUI(outPtr)
        }

        return this.__ICachedFileUpdaterUI.get_UpdateTarget()
    }

    /**
     * 
     * @param {TypedEventHandler<CachedFileUpdaterUI, FileUpdateRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FileUpdateRequested(handler) {
        if (!this.HasProp("__ICachedFileUpdaterUI")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterUI := ICachedFileUpdaterUI(outPtr)
        }

        return this.__ICachedFileUpdaterUI.add_FileUpdateRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FileUpdateRequested(token) {
        if (!this.HasProp("__ICachedFileUpdaterUI")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterUI := ICachedFileUpdaterUI(outPtr)
        }

        return this.__ICachedFileUpdaterUI.remove_FileUpdateRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<CachedFileUpdaterUI, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UIRequested(handler) {
        if (!this.HasProp("__ICachedFileUpdaterUI")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterUI := ICachedFileUpdaterUI(outPtr)
        }

        return this.__ICachedFileUpdaterUI.add_UIRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UIRequested(token) {
        if (!this.HasProp("__ICachedFileUpdaterUI")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterUI := ICachedFileUpdaterUI(outPtr)
        }

        return this.__ICachedFileUpdaterUI.remove_UIRequested(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UIStatus() {
        if (!this.HasProp("__ICachedFileUpdaterUI")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterUI := ICachedFileUpdaterUI(outPtr)
        }

        return this.__ICachedFileUpdaterUI.get_UIStatus()
    }

    /**
     * 
     * @returns {FileUpdateRequest} 
     */
    get_UpdateRequest() {
        if (!this.HasProp("__ICachedFileUpdaterUI2")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterUI2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterUI2 := ICachedFileUpdaterUI2(outPtr)
        }

        return this.__ICachedFileUpdaterUI2.get_UpdateRequest()
    }

    /**
     * Gets an object used to complete a file update request asynchronously.
     * @returns {FileUpdateRequestDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.cachedfileupdaterui.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ICachedFileUpdaterUI2")) {
            if ((queryResult := this.QueryInterface(ICachedFileUpdaterUI2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICachedFileUpdaterUI2 := ICachedFileUpdaterUI2(outPtr)
        }

        return this.__ICachedFileUpdaterUI2.GetDeferral()
    }

;@endregion Instance Methods
}
