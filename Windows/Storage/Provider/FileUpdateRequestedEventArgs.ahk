#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileUpdateRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about a [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) event.
 * @remarks
 * If your app participates in the Cached File Updater contract, a FileUpdateRequestedEventArgs is passed to your app's [FileUpdateRequested](cachedfileupdaterui_fileupdaterequested.md) event handler when the event fires. Use the [FileUpdateRequestedEventArgs.Request](fileupdaterequestedeventargs_request.md) property to get details about the requested update.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.fileupdaterequestedeventargs
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class FileUpdateRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileUpdateRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileUpdateRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the details of the requested file update.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.fileupdaterequestedeventargs.request
     * @type {FileUpdateRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {FileUpdateRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IFileUpdateRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IFileUpdateRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileUpdateRequestedEventArgs := IFileUpdateRequestedEventArgs(outPtr)
        }

        return this.__IFileUpdateRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
