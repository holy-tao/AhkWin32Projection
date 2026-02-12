#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileSavePickerUI.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\FileSavePickerUI.ahk
#Include .\TargetFileRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Used to interact with the file picker when your app provides a save location with the File Save Picker contract.
 * @remarks
 * If your app participates in the File Save Picker contract, you can access this object using a fileSavePickerUI property while you handle a [FileSavePicker](../windows.applicationmodel.activation/activationkind.md) activated event.
 * 
 * Use the [FileSavePickerActivatedEventArgs.FileSavePickerUI](../windows.applicationmodel.activation/filesavepickeractivatedeventargs_filesavepickerui.md) property to retrieve a fileSavePickerUI object.
 * 
 * To learn about creating a good experience for users when they use your app as a save location, see [Open files and folders with a picker](/windows/uwp/files/quickstart-using-file-and-folder-pickers).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.filesavepickerui
 * @namespace Windows.Storage.Pickers.Provider
 * @version WindowsRuntime 1.4
 */
class FileSavePickerUI extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileSavePickerUI

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileSavePickerUI.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a title to display in the file picker UI that identifies the location that the file picker is displaying to the user.
     * @remarks
     * As a provider of files, you should consider updating the title if the user navigates to another location or if the [AllowedFileTypes](fileopenpickerui_allowedfiletypes.md) change.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.filesavepickerui.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets a list of file types (extensions) that can be saved to the app that is providing the save location.
     * @remarks
     * As the app that provides the save location, you should use this information to filter the page your app displays and to constrain the extensions of the file names it generates.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.filesavepickerui.allowedfiletypes
     * @type {IVectorView<HSTRING>} 
     */
    AllowedFileTypes {
        get => this.get_AllowedFileTypes()
    }

    /**
     * Gets an identifier for the current context of the file picker.
     * @remarks
     * As the provider of a save location, your app can use this identifier to restore the state your app was in the last time it was used in this context.
     * 
     * The context depends on various factors including the calling app and file types being chosen.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.filesavepickerui.settingsidentifier
     * @type {HSTRING} 
     */
    SettingsIdentifier {
        get => this.get_SettingsIdentifier()
    }

    /**
     * Gets the full file name of the file to save, including the file type extension. The file name and extension are specified by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.filesavepickerui.filename
     * @type {HSTRING} 
     */
    FileName {
        get => this.get_FileName()
    }

    /**
     * Fired when the user changes the file name in the file name text box or changes the extension in the file type drop-down menu.
     * @remarks
     * In response to this event, your app should get the new file name from the [FileName](filesavepickerui_filename.md) property and check the [AllowedFileTypes](filesavepickerui_allowedfiletypes.md) as these also could have changed.
     * 
     * Register for this event by adding an event listener to the [FileSavePickerUI](filesavepickerui.md) object and assigning a handler function for the event.
     * @type {TypedEventHandler<FileSavePickerUI, IInspectable>}
    */
    OnFileNameChanged {
        get {
            if(!this.HasProp("__OnFileNameChanged")){
                this.__OnFileNameChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1e6a632-f97f-54d9-9e1b-a714edc3ff06}"),
                    FileSavePickerUI,
                    IInspectable
                )
                this.__OnFileNameChangedToken := this.add_FileNameChanged(this.__OnFileNameChanged.iface)
            }
            return this.__OnFileNameChanged
        }
    }

    /**
     * Fires when the user commits a file to be saved in the file picker.
     * @remarks
     * If your app participates in the File Save Picker contract and a TargetFileRequested event fires, your app should create a new [StorageFile](../windows.storage/storagefile.md) that represents the file the user wants to save. The name of the [StorageFile](../windows.storage/storagefile.md) you create must match the name of the file specified by the [FileName](filesavepickerui_filename.md) property. The [StorageFile](../windows.storage/storagefile.md) you create is returned to the app that called the file picker (the calling app) so that the calling app can write content to the file. Learn more about responding to this event in [targetFileRequestedEventArgs](targetfilerequestedeventargs.md).
     * 
     * > [!NOTE]
     * > File picker UI is disabled until the providing app has finished responding to this event.
     * @type {TypedEventHandler<FileSavePickerUI, TargetFileRequestedEventArgs>}
    */
    OnTargetFileRequested {
        get {
            if(!this.HasProp("__OnTargetFileRequested")){
                this.__OnTargetFileRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d3e1f8c7-45c5-5249-b336-a111bfaa985b}"),
                    FileSavePickerUI,
                    TargetFileRequestedEventArgs
                )
                this.__OnTargetFileRequestedToken := this.add_TargetFileRequested(this.__OnTargetFileRequested.iface)
            }
            return this.__OnTargetFileRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnFileNameChangedToken")) {
            this.remove_FileNameChanged(this.__OnFileNameChangedToken)
            this.__OnFileNameChanged.iface.Dispose()
        }

        if(this.HasProp("__OnTargetFileRequestedToken")) {
            this.remove_TargetFileRequested(this.__OnTargetFileRequestedToken)
            this.__OnTargetFileRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IFileSavePickerUI")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerUI := IFileSavePickerUI(outPtr)
        }

        return this.__IFileSavePickerUI.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IFileSavePickerUI")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerUI := IFileSavePickerUI(outPtr)
        }

        return this.__IFileSavePickerUI.put_Title(value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_AllowedFileTypes() {
        if (!this.HasProp("__IFileSavePickerUI")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerUI := IFileSavePickerUI(outPtr)
        }

        return this.__IFileSavePickerUI.get_AllowedFileTypes()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SettingsIdentifier() {
        if (!this.HasProp("__IFileSavePickerUI")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerUI := IFileSavePickerUI(outPtr)
        }

        return this.__IFileSavePickerUI.get_SettingsIdentifier()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FileName() {
        if (!this.HasProp("__IFileSavePickerUI")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerUI := IFileSavePickerUI(outPtr)
        }

        return this.__IFileSavePickerUI.get_FileName()
    }

    /**
     * Tries to set the file name and extension in the file picker UI.
     * @remarks
     * As the provider of a save location, your app should call this method when the user selects a file that is displayed on your app page (which is hosted in the file picker).
     * 
     * This method fails if:
     * 
     * + The extension specified for the file in *value* isn't one of the [AllowedFileTypes](filesavepickerui_allowedfiletypes.md).
     * + The file picker UI isn't visible to the user.
     * + The user is interacting with the file name text box in the file picker UI.
     * @param {HSTRING} value The file name and extension that are used to update the file name text box and file type drop-down menu in the file picker UI.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.provider.filesavepickerui.trysetfilename
     */
    TrySetFileName(value) {
        if (!this.HasProp("__IFileSavePickerUI")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerUI := IFileSavePickerUI(outPtr)
        }

        return this.__IFileSavePickerUI.TrySetFileName(value)
    }

    /**
     * 
     * @param {TypedEventHandler<FileSavePickerUI, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FileNameChanged(handler) {
        if (!this.HasProp("__IFileSavePickerUI")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerUI := IFileSavePickerUI(outPtr)
        }

        return this.__IFileSavePickerUI.add_FileNameChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FileNameChanged(token) {
        if (!this.HasProp("__IFileSavePickerUI")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerUI := IFileSavePickerUI(outPtr)
        }

        return this.__IFileSavePickerUI.remove_FileNameChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<FileSavePickerUI, TargetFileRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TargetFileRequested(handler) {
        if (!this.HasProp("__IFileSavePickerUI")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerUI := IFileSavePickerUI(outPtr)
        }

        return this.__IFileSavePickerUI.add_TargetFileRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TargetFileRequested(token) {
        if (!this.HasProp("__IFileSavePickerUI")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerUI := IFileSavePickerUI(outPtr)
        }

        return this.__IFileSavePickerUI.remove_TargetFileRequested(token)
    }

;@endregion Instance Methods
}
