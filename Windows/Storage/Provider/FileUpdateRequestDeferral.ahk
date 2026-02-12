#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileUpdateRequestDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Use to complete an update asynchronously.
 * @remarks
 * If your app participates in the Cached File Updater contract, and you can't finish responding to the update before returning from your [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) event handler, call the [FileUpdaterRequestDeferral.Complete](fileupdaterequestdeferral_complete_1807836922.md) method to complete the update asynchronously.
 * 
 * > [!NOTE]
 * > The file picker UI is disabled until the app has finished responding to all [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) events that were fired.
 * 
 * To learn about responding to a [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) event, see [FileUpdateRequestedEventArgs](fileupdaterequestedeventargs.md).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.fileupdaterequestdeferral
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class FileUpdateRequestDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileUpdateRequestDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileUpdateRequestDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Signals that the response to a [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) event is finished.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.fileupdaterequestdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IFileUpdateRequestDeferral")) {
            if ((queryResult := this.QueryInterface(IFileUpdateRequestDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileUpdateRequestDeferral := IFileUpdateRequestDeferral(outPtr)
        }

        return this.__IFileUpdateRequestDeferral.Complete()
    }

;@endregion Instance Methods
}
