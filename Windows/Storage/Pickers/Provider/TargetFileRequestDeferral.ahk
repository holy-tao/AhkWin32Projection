#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetFileRequestDeferral.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Used by an app that provides a save location to indicate asynchronously that the app is finished responding to a [TargetFileRequested](filesavepickerui_targetfilerequested.md) event.
 * @remarks
 * If your app participates in the File Save Picker contract and a [TargetFileRequested](filesavepickerui_targetfilerequested.md) event fires, your app should create a new [StorageFile](../windows.storage/storagefile.md) that represents the file the user wants to save. The name of the [StorageFile](../windows.storage/storagefile.md) you create must match the name of the file specified by the [FileName](filesavepickerui_filename.md) property. The [StorageFile](../windows.storage/storagefile.md) you create is returned to the app that called the file picker (the calling app) so that the calling app can write content to the file. Learn more about responding to this event in [targetFileRequestedEventArgs](targetfilerequestedeventargs.md).
 * 
 * Your app, as the provider of a save location, can signal that it has finished its asynchronous response to a [TargetFileRequested](filesavepickerui_targetfilerequested.md) event by calling [targetFileRequestDeferral.complete](targetfilerequestdeferral_complete_1807836922.md). Learn more about responding asynchronously to a [TargetFileRequested](filesavepickerui_targetfilerequested.md) event in [TargetFileRequestedEventArgs](targetfilerequestedeventargs.md).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.targetfilerequestdeferral
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class TargetFileRequestDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetFileRequestDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetFileRequestDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Signals that the app providing the save location finished responding to a [TargetFileRequested](filesavepickerui_targetfilerequested.md) event.
     * @remarks
     * Learn about responding asynchronously to a [TargetFileRequested](filesavepickerui_targetfilerequested.md) event in [TargetFileRequestedEventArgs](targetfilerequestedeventargs.md).
     * 
     * Calling this method will complete the request even if [GetDeferral](targetfilerequest_getdeferral_254836512.md) has been called multiple times.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.targetfilerequestdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__ITargetFileRequestDeferral")) {
            if ((queryResult := this.QueryInterface(ITargetFileRequestDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetFileRequestDeferral := ITargetFileRequestDeferral(outPtr)
        }

        return this.__ITargetFileRequestDeferral.Complete()
    }

;@endregion Instance Methods
}
