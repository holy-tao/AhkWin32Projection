#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileUpdateRequest.ahk
#Include .\IFileUpdateRequest2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about a requested file update so that the app can complete the request.
 * @remarks
 * If your app participates in the Cached File Updater contract, use this class to respond when Windows fires [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) events to request file updates. You can access this class from your event handler using the [FileUpdateRequestedEventArgs](fileupdaterequestedeventargs.md).[Request](fileupdaterequestedeventargs_request.md) property. As a part of your response to a [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) event, you must set the [Status](fileupdaterequest_status.md) property of this class to indicate the status of the update.
 * 
 * Learn more about responding to update requests in [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) and [FileUpdateRequestedEventArgs](fileupdaterequestedeventargs.md).
 * 
 * If your app can't complete the update before returning from its [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) event handler, you can use the [GetDeferral](fileupdaterequest_getdeferral_254836512.md) property to finish the update asynchronously.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.fileupdaterequest
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class FileUpdateRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileUpdateRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileUpdateRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier used to associate the local version of a file with the corresponding remote version.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.fileupdaterequest.contentid
     * @type {HSTRING} 
     */
    ContentId {
        get => this.get_ContentId()
    }

    /**
     * Gets a [StorageFile](../windows.storage/storagefile.md) object that represents the locally cached copy of the file to update.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.fileupdaterequest.file
     * @type {StorageFile} 
     */
    File {
        get => this.get_File()
    }

    /**
     * Gets or sets the status of the update. This property is set in response to a [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.fileupdaterequest.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * Gets or sets a message to the user indicating that user input is needed to complete the [FileUpdateRequest](fileupdaterequest.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.fileupdaterequest.userinputneededmessage
     * @type {HSTRING} 
     */
    UserInputNeededMessage {
        get => this.get_UserInputNeededMessage()
        set => this.put_UserInputNeededMessage(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentId() {
        if (!this.HasProp("__IFileUpdateRequest")) {
            if ((queryResult := this.QueryInterface(IFileUpdateRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileUpdateRequest := IFileUpdateRequest(outPtr)
        }

        return this.__IFileUpdateRequest.get_ContentId()
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_File() {
        if (!this.HasProp("__IFileUpdateRequest")) {
            if ((queryResult := this.QueryInterface(IFileUpdateRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileUpdateRequest := IFileUpdateRequest(outPtr)
        }

        return this.__IFileUpdateRequest.get_File()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IFileUpdateRequest")) {
            if ((queryResult := this.QueryInterface(IFileUpdateRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileUpdateRequest := IFileUpdateRequest(outPtr)
        }

        return this.__IFileUpdateRequest.get_Status()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IFileUpdateRequest")) {
            if ((queryResult := this.QueryInterface(IFileUpdateRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileUpdateRequest := IFileUpdateRequest(outPtr)
        }

        return this.__IFileUpdateRequest.put_Status(value)
    }

    /**
     * Gets an object used to complete an update asynchronously.
     * @remarks
     * If you don't call this method, a request is considered complete as soon as the [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) event handler returns— regardless of outstanding asynchronous operations.
     * @returns {FileUpdateRequestDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.fileupdaterequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IFileUpdateRequest")) {
            if ((queryResult := this.QueryInterface(IFileUpdateRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileUpdateRequest := IFileUpdateRequest(outPtr)
        }

        return this.__IFileUpdateRequest.GetDeferral()
    }

    /**
     * Provide a new version of the local file to represent the remote file.
     * @remarks
     * Use this method to associate a new version of the local file with the existing [ContentId](fileupdaterequest_contentid.md). You need to use this method whenever you create a new version of the local file. For example, you would call this method if you used [ReplaceWithStreamedFileAsync](../windows.storage/storagefile_replacewithstreamedfileasync_1583738949.md) or [ReplaceWithStreamedFileFromUriAsync](../windows.storage/storagefile_replacewithstreamedfilefromuriasync_341848393.md) to download the latest version of the file, or if the remote version of the file was renamed.
     * @param {IStorageFile} value The new version of the local file that will represent remote file.
     * 
     * This file can be different from the original local file that was associated with the [FileUpdateRequest.ContentId](fileupdaterequest_contentid.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.fileupdaterequest.updatelocalfile
     */
    UpdateLocalFile(value) {
        if (!this.HasProp("__IFileUpdateRequest")) {
            if ((queryResult := this.QueryInterface(IFileUpdateRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileUpdateRequest := IFileUpdateRequest(outPtr)
        }

        return this.__IFileUpdateRequest.UpdateLocalFile(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserInputNeededMessage() {
        if (!this.HasProp("__IFileUpdateRequest2")) {
            if ((queryResult := this.QueryInterface(IFileUpdateRequest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileUpdateRequest2 := IFileUpdateRequest2(outPtr)
        }

        return this.__IFileUpdateRequest2.get_UserInputNeededMessage()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UserInputNeededMessage(value) {
        if (!this.HasProp("__IFileUpdateRequest2")) {
            if ((queryResult := this.QueryInterface(IFileUpdateRequest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileUpdateRequest2 := IFileUpdateRequest2(outPtr)
        }

        return this.__IFileUpdateRequest2.put_UserInputNeededMessage(value)
    }

;@endregion Instance Methods
}
