#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetFileRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Lets an app that provides a save location specify the [StorageFile](../windows.storage/storagefile.md) that represents the file to save and get a deferral so the app can respond asynchronously to a [TargetFileRequested](filesavepickerui_targetfilerequested.md) event.
 * @remarks
 * If your app participates in the File Save Picker contract and a [Targetfilerequested](filesavepickerui_targetfilerequested.md) event fires, your app should create a new [StorageFile](../windows.storage/storagefile.md) that represents the file the user wants to save. The name of the [StorageFile](../windows.storage/storagefile.md) you create must match the name of the file specified by the [FileName](filesavepickerui_filename.md) property. The [StorageFile](../windows.storage/storagefile.md) you create is returned to the app that called the file picker (the calling app) so that the calling app can write content to the file. Learn more about responding to this event in [TargetFileRequestedEventArgs](targetfilerequestedeventargs.md).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.targetfilerequest
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class TargetFileRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetFileRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetFileRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the [IStorageFile](../windows.storage/istoragefile.md) object that is provided to represent the file to save by the app that is providing the save location.
     * @remarks
     * If your app (as the provider of the save location) can't provide an object for the file to save, set this property to **null**. Unless the user selects an existing file to save, your app should create a [StorageFile](../windows.storage/storagefile.md) object to represent the file sets this property to that object.
     * 
     * The file name and extension of the object that represents the file to save must match the file name and extension specified by the user (and accessible through the [FileName](filesavepickerui_filename.md) property) or the attempt to save the file will fail. If the attempt fails, the user can try to save the file again.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.targetfilerequest.targetfile
     * @type {IStorageFile} 
     */
    TargetFile {
        get => this.get_TargetFile()
        set => this.put_TargetFile(value)
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
    get_TargetFile() {
        if (!this.HasProp("__ITargetFileRequest")) {
            if ((queryResult := this.QueryInterface(ITargetFileRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetFileRequest := ITargetFileRequest(outPtr)
        }

        return this.__ITargetFileRequest.get_TargetFile()
    }

    /**
     * 
     * @param {IStorageFile} value 
     * @returns {HRESULT} 
     */
    put_TargetFile(value) {
        if (!this.HasProp("__ITargetFileRequest")) {
            if ((queryResult := this.QueryInterface(ITargetFileRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetFileRequest := ITargetFileRequest(outPtr)
        }

        return this.__ITargetFileRequest.put_TargetFile(value)
    }

    /**
     * Gets a [TargetFileRequestDeferral](targetfilerequestdeferral.md) that the app providing the save location can use to respond asynchronously to a [TargetFileRequested](filesavepickerui_targetfilerequested.md) event.
     * @remarks
     * Use this method to finish responding to a [TargetFileRequest](targetfilerequest.md) event asynchronously. If this method is not called, the request is considered complete after the [TargetFileRequested](filesavepickerui_targetfilerequested.md) event handler returns— regardless of outstanding asynchronous operations.
     * 
     * To signal that your app has finished its asynchronous response to the [TargetFileRequested](filesavepickerui_targetfilerequested.md) event, call the [TargetFileRequestDeferral.complete](targetfilerequestdeferral_complete_1807836922.md) method.
     * 
     * Learn more about responding asynchronously to a [TargetFileRequested](filesavepickerui_targetfilerequested.md) event in [TargetFileRequestedEventArgs](targetfilerequestedeventargs.md).
     * @returns {TargetFileRequestDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.targetfilerequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ITargetFileRequest")) {
            if ((queryResult := this.QueryInterface(ITargetFileRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetFileRequest := ITargetFileRequest(outPtr)
        }

        return this.__ITargetFileRequest.GetDeferral()
    }

;@endregion Instance Methods
}
