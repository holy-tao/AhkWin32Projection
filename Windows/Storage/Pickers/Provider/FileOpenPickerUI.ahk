#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileOpenPickerUI.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\FileOpenPickerUI.ahk
#Include .\FileRemovedEventArgs.ahk
#Include .\PickerClosingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Used to interact with the file picker if your app provides files with the File Open Picker contract.
 * @remarks
 * If your app participates in the File Open Picker contract, you can retrieve this object using a FileOpenPickerUI property while you handle a [FileOpenPicker](../windows.applicationmodel.activation/activationkind.md) activated event.
 * 
 * Use the [Windows.ApplicationModel.Activation.FileOpenPickerActivatedEventArgs.FileOpenPickerUI](../windows.applicationmodel.activation/fileopenpickeractivatedeventargs_fileopenpickerui.md) property to access a FileOpenPickerUI.
 * 
 * Learn about creating a good experience for users when they access your files through the file picker by reading the UX guidelines for providing files in [Open files and folders with a picker](/windows/uwp/files/quickstart-using-file-and-folder-pickers).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.fileopenpickerui
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class FileOpenPickerUI extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileOpenPickerUI

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileOpenPickerUI.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of file types (extensions) that the user can choose.
     * @remarks
     * Because the app that called the file picker (the calling app) can limit the types of files that the user can choose, the app that is providing files (the providing app) can use this method to determine which file types are allowed. For example, if the calling app specifies that only picture file types can be chosen, a music file cannot be added to the file picker's list of chosen files.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.fileopenpickerui.allowedfiletypes
     * @type {IVectorView<HSTRING>} 
     */
    AllowedFileTypes {
        get => this.get_AllowedFileTypes()
    }

    /**
     * Gets an enumeration value that indicates whether the file picker currently limits selection to single files, or if multiple files can be selected.
     * @remarks
     * You can use this information to alter your app's file picker view according to the current [FileSelectionMode](fileselectionmode.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.fileopenpickerui.selectionmode
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
    }

    /**
     * Gets an identifier for the current context of the file picker.
     * @remarks
     * As a provider of files, your app can use this identifier to restore the state your app was in the last time it was used in this context.
     * 
     * The context depends on various factors including the calling app and file types being chosen.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.fileopenpickerui.settingsidentifier
     * @type {HSTRING} 
     */
    SettingsIdentifier {
        get => this.get_SettingsIdentifier()
    }

    /**
     * Gets or sets a title to display in the file picker UI that identifies the location that the file picker is displaying to the user.
     * @remarks
     * As a provider of files, you should consider updating the title if the user navigates to another location or if the [AllowedFileTypes](fileopenpickerui_allowedfiletypes.md) change.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.fileopenpickerui.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * > [!NOTE]
     * > The FileRemoved event is deprecated and should not be used.
     * 
     * Fires when the user removes a file from the list of files that the user has chosen if that file was added by the app that is providing files.
     * @remarks
     * If your app participates in the File Open Picker contract and your app uses the app page that is hosted in the file picker to visually indicate which items the user selects, you should respond to this event. When a FileRemoved event fires you should update your app's file picker page to reflect the change. Learn more about responding to this event in [FileRemovedEventArgs](fileremovedeventargs.md).
     * @type {TypedEventHandler<FileOpenPickerUI, FileRemovedEventArgs>}
    */
    OnFileRemoved {
        get {
            if(!this.HasProp("__OnFileRemoved")){
                this.__OnFileRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1fb2939-695b-5f56-841a-a52a7d148572}"),
                    FileOpenPickerUI,
                    FileRemovedEventArgs
                )
                this.__OnFileRemovedToken := this.add_FileRemoved(this.__OnFileRemoved.iface)
            }
            return this.__OnFileRemoved
        }
    }

    /**
     * Fires when the user closes the file picker.
     * @remarks
     * As a provider of files, you can register for this event so that your app can execute cleanup tasks before it is closed. For example, if the user cancels the file picker, you could respond by cleaning up temporary files that were added to the file picker when the user chose them.
     * 
     * Register for this event by adding an event listener to the [FileOpenPickerUI](fileopenpickerui.md) and assigning a handler function for the event. You can access information about the event from the [PickerClosingEventArgs](pickerclosingeventargs.md) object that is passed to your event handler.
     * @type {TypedEventHandler<FileOpenPickerUI, PickerClosingEventArgs>}
    */
    OnClosing {
        get {
            if(!this.HasProp("__OnClosing")){
                this.__OnClosing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2b06bdac-983b-5552-b5c9-b0990a2db3a1}"),
                    FileOpenPickerUI,
                    PickerClosingEventArgs
                )
                this.__OnClosingToken := this.add_Closing(this.__OnClosing.iface)
            }
            return this.__OnClosing
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnFileRemovedToken")) {
            this.remove_FileRemoved(this.__OnFileRemovedToken)
            this.__OnFileRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnClosingToken")) {
            this.remove_Closing(this.__OnClosingToken)
            this.__OnClosing.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Adds the specified file to the list of files that the user has chosen.
     * @param {HSTRING} id A unique identifier of the file to add.
     * @param {IStorageFile} file_ The file to add to the list of files that the user has chosen.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.fileopenpickerui.addfile
     */
    AddFile(id, file_) {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.AddFile(id, file_)
    }

    /**
     * Removes the specified file from the list of files the user has chosen.
     * @remarks
     * The specified *id* should be the same as the one provided when the file was added to the file picker UI.
     * 
     * When the user deselects a file in the app's file picker view, the app calls this method to remove the item from the file picker UI.
     * @param {HSTRING} id The identifier of the file to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.fileopenpickerui.removefile
     */
    RemoveFile(id) {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.RemoveFile(id)
    }

    /**
     * Determines whether the specified file is in the list of files that the user has chosen.
     * @remarks
     * An app hosted in the file picker can use this method to determine whether a file that the app previously added is still in the file picker UI. The user or the app might have removed the file, or the file might not have been added in the first place.
     * @param {HSTRING} id The identifier of the file.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.fileopenpickerui.containsfile
     */
    ContainsFile(id) {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.ContainsFile(id)
    }

    /**
     * Indicates whether the specified file can be added to the list of files the user has chosen.
     * @param {IStorageFile} file_ The file to test.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.fileopenpickerui.canaddfile
     */
    CanAddFile(file_) {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.CanAddFile(file_)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_AllowedFileTypes() {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.get_AllowedFileTypes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.get_SelectionMode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SettingsIdentifier() {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.get_SettingsIdentifier()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.put_Title(value)
    }

    /**
     * 
     * @param {TypedEventHandler<FileOpenPickerUI, FileRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FileRemoved(handler) {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.add_FileRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FileRemoved(token) {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.remove_FileRemoved(token)
    }

    /**
     * 
     * @param {TypedEventHandler<FileOpenPickerUI, PickerClosingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closing(handler) {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.add_Closing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closing(token) {
        if (!this.HasProp("__IFileOpenPickerUI")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerUI := IFileOpenPickerUI(outPtr)
        }

        return this.__IFileOpenPickerUI.remove_Closing(token)
    }

;@endregion Instance Methods
}
