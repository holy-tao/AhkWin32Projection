#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetFileRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about a [TargetFileRequested](filesavepickerui_targetfilerequested.md) event.
 * @remarks
 * This object is passed to the event handler for [TargetFileRequested](filesavepickerui_targetfilerequested.md) events.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.targetfilerequestedeventargs
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class TargetFileRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetFileRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetFileRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [TargetFileRequest](targetfilerequest.md) object that is used to respond to a [TargetFileRequested](filesavepickerui_targetfilerequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.targetfilerequestedeventargs.request
     * @type {TargetFileRequest} 
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
     * @returns {TargetFileRequest} 
     */
    get_Request() {
        if (!this.HasProp("__ITargetFileRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITargetFileRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetFileRequestedEventArgs := ITargetFileRequestedEventArgs(outPtr)
        }

        return this.__ITargetFileRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
