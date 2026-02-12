#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileRemovedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about a [FileRemoved](fileopenpickerui_fileremoved.md) event.
 * @remarks
 * > [!NOTE]
 * > The FileRemoved event is deprecated and should not be used.
 * 
 * This object is passed to the event handler for [FileRemoved](fileopenpickerui_fileremoved.md) events.
 * 
 * If your app participates in the File Open Picker contract and a [FileRemoved](fileopenpickerui_fileremoved.md) event fires, you should respond by updating its file picker app page to reflect the change in the list of chosen files.
 * 
 * Register for this event by adding an event listener to the [FileOpenPickerUI](fileopenpickerui.md) and assigning a handler function for the event. You can access information about the event from the fileRemovedEventArgs object that is passed to your event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.fileremovedeventargs
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class FileRemovedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileRemovedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileRemovedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier of the file that the user removed from the list of chosen files in the file picker. This identifier was set by the providing app when it added the files to the list of chosen files.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.fileremovedeventargs.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
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
    get_Id() {
        if (!this.HasProp("__IFileRemovedEventArgs")) {
            if ((queryResult := this.QueryInterface(IFileRemovedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileRemovedEventArgs := IFileRemovedEventArgs(outPtr)
        }

        return this.__IFileRemovedEventArgs.get_Id()
    }

;@endregion Instance Methods
}
