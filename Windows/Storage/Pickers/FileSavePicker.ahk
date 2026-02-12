#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileSavePicker2.ahk
#Include .\IFileSavePicker3.ahk
#Include .\IFileSavePicker.ahk
#Include .\IFileSavePicker4.ahk
#Include .\IFileSavePickerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a file picker that lets the user choose the file name, extension, and storage location for a file.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * > [!IMPORTANT]
 * > You must use the [FileTypeChoices property](filesavepicker_filetypechoices.md) property to specify one or more file types before you call the **PickSaveFileAsync** method, or the picker will thrown an exception. 
 * 
 * To learn how to save files through the file picker, see [How to save files through file pickers](/windows/uwp/files/quickstart-save-a-file-with-a-picker).
 * 
 * > [!NOTE]
 * > To use a file save picker in a WinUI app, see the [FileSavePicker class](/windows/windows-app-sdk/api/winrt/microsoft.windows.storage.pickers.filesavepicker) documentation for the Windows App SDK.
 * 
 * To get started accessing files and folders file picker, see [Files, folders, and libraries ](/windows/uwp/files/index).
 * 
 * > [!WARNING]
 * > If you try to show the file picker while your app is snapped, the file picker will not be shown and an exception will be thrown. You can avoid this by making sure your app is not snapped or by unsnapping it before you call the file picker. The following code examples and the [File picker sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/FilePicker) show you how.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class FileSavePicker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileSavePicker2

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileSavePicker2.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [FileSavePicker](filesavepicker.md) that is scoped to the personal directory of the specified user. Use this method for [multi-user applications](/windows/uwp/xbox-apps/multi-user-applications).
     * @param {User} user_ The user for which to create the [FileSavePicker](filesavepicker.md).
     * @returns {FileSavePicker} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.createforuser
     */
    static CreateForUser(user_) {
        if (!FileSavePicker.HasProp("__IFileSavePickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Pickers.FileSavePicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileSavePickerStatics.IID)
            FileSavePicker.__IFileSavePickerStatics := IFileSavePickerStatics(factoryPtr)
        }

        return FileSavePicker.__IFileSavePickerStatics.CreateForUser(user_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a set of values to be populated by the app before a [PickSaveFileAndContinue](filesavepicker_picksavefileandcontinue_516043855.md) operation that deactivates the app in order to provide context when the app is activated. (Windows Phone 8.x app)
     * @remarks
     * > Windows Phone 8.x app only. For more info, see [How to continue your Windows Phone app after calling a file picker](/previous-versions/windows/apps/dn614994(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.continuationdata
     * @type {ValueSet} 
     */
    ContinuationData {
        get => this.get_ContinuationData()
    }

    /**
     * Gets or sets an ID that specifies the enterprise that owns the file.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.enterpriseid
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
        set => this.put_EnterpriseId(value)
    }

    /**
     * Gets or sets the settings identifier associated with the current [FileSavePicker](filesavepicker.md) instance.
     * @remarks
     * If your application uses multiple instances of the file save picker, you can use this property to identify the individual instances.
     * 
     * To give the user a sense of consistency, the file save picker remembers the last location that the user navigated to and will generally start at that location. Normally, this remembered location is shared by all file save pickers used by the app. To remember a different location for different pickers, choose a different SettingsIdentifier for each picker.
     * 
     * For example, if you use one file save picker for picking flowers, and another for picking fruit, you can set the SettingsIdentifier for the first picker to "Flowers" and the SettingsIdentifier for the second picker to "Fruit". That way, each time the user picks flowers, they default to the last location they used for picking flowers; and each time the user picks fruit, they default to the last location they used for picking fruit.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.settingsidentifier
     * @type {HSTRING} 
     */
    SettingsIdentifier {
        get => this.get_SettingsIdentifier()
        set => this.put_SettingsIdentifier(value)
    }

    /**
     * Gets or sets the location that the file save picker suggests to the user as the location to save a file.
     * @remarks
     * The SuggestedStartLocation is not always used as the start location for the file picker. To give the user a sense of consistency, the file picker remembers the last location that the user navigated to and will generally start at that location.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.suggestedstartlocation
     * @type {Integer} 
     */
    SuggestedStartLocation {
        get => this.get_SuggestedStartLocation()
        set => this.put_SuggestedStartLocation(value)
    }

    /**
     * Gets or sets the label text of the commit button in the file picker UI.
     * @remarks
     * By default, the label text of the commit button is **Save**.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.commitbuttontext
     * @type {HSTRING} 
     */
    CommitButtonText {
        get => this.get_CommitButtonText()
        set => this.put_CommitButtonText(value)
    }

    /**
     * Gets the collection of valid file types that the user can choose to assign to a file.
     * @remarks
     * Some apps do not need to understand a file format in order to process it - such as a cloud storage provider. Therefore, using the file wildcard character - "*" - is supported for the [FileOpenPicker.FileTypeFilter](fileopenpicker_filetypefilter.md) collection. However, writing a file requires knowledge of its format. As a result, the wildcard is not supported for FileSavePicker.FileTypeChoices.
     * 
     * One display name as a classification of file types might have multiple file types that support it. For example, a display name of "HTML page" could be saved either with ".htm" or ".html" extension. That is why the value of each entry in a [FilePickerFileTypesOrderedMap](filepickerfiletypesorderedmap.md) is an ordered list (vector) of strings, displayed in the UI in the order that you place the extensions in the vector.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.filetypechoices
     * @type {IMap<HSTRING, IVector<HSTRING>>} 
     */
    FileTypeChoices {
        get => this.get_FileTypeChoices()
    }

    /**
     * > [!IMPORTANT]
     * > Do not use this property. Use the [FileTypeChoices property](filesavepicker_filetypechoices.md) instead. The default file extension is set by the first file type in the first file type group in **FileTypeChoices**.
     * 
     * Gets or sets the default file name extension that the [fileSavePicker](filesavepicker.md) gives to files to be saved.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.defaultfileextension
     * @type {HSTRING} 
     */
    DefaultFileExtension {
        get => this.get_DefaultFileExtension()
        set => this.put_DefaultFileExtension(value)
    }

    /**
     * Gets or sets the [storageFile](../windows.storage/storagefile.md) that the file picker suggests to the user for saving a file.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.suggestedsavefile
     * @type {StorageFile} 
     */
    SuggestedSaveFile {
        get => this.get_SuggestedSaveFile()
        set => this.put_SuggestedSaveFile(value)
    }

    /**
     * Gets or sets the file name that the file save picker suggests to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.suggestedfilename
     * @type {HSTRING} 
     */
    SuggestedFileName {
        get => this.get_SuggestedFileName()
        set => this.put_SuggestedFileName(value)
    }

    /**
     * Gets info about the user for which the [FileSavePicker](filesavepicker.md) was created. Use this property for [multi-user applications](/windows/uwp/xbox-apps/multi-user-applications).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of a [FileSavePicker](filesavepicker.md).
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Pickers.FileSavePicker")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_ContinuationData() {
        if (!this.HasProp("__IFileSavePicker2")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker2 := IFileSavePicker2(outPtr)
        }

        return this.__IFileSavePicker2.get_ContinuationData()
    }

    /**
     * **Obsolete as of Windows 10; use [PickSaveFileAsync](filesavepicker_picksavefileasync_1000266802.md) instead.** Shows the file picker so that the user can save a file, deactivating and the app and reactivating it when the operation is complete. (Windows Phone 8.x app)
     * @remarks
     * > Windows Phone 8.x app only. Use the [ContinuationData](filesavepicker_continuationdata.md) property to store context information that can be retrieved when the app is reactivated. For more info, see [How to continue your Windows Phone app after calling a file picker](/previous-versions/windows/apps/dn614994(v=win.10)).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.picksavefileandcontinue
     */
    PickSaveFileAndContinue() {
        if (!this.HasProp("__IFileSavePicker2")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker2 := IFileSavePicker2(outPtr)
        }

        return this.__IFileSavePicker2.PickSaveFileAndContinue()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        if (!this.HasProp("__IFileSavePicker3")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker3 := IFileSavePicker3(outPtr)
        }

        return this.__IFileSavePicker3.get_EnterpriseId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EnterpriseId(value) {
        if (!this.HasProp("__IFileSavePicker3")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker3 := IFileSavePicker3(outPtr)
        }

        return this.__IFileSavePicker3.put_EnterpriseId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SettingsIdentifier() {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.get_SettingsIdentifier()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SettingsIdentifier(value) {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.put_SettingsIdentifier(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SuggestedStartLocation() {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.get_SuggestedStartLocation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SuggestedStartLocation(value) {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.put_SuggestedStartLocation(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CommitButtonText() {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.get_CommitButtonText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CommitButtonText(value) {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.put_CommitButtonText(value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, IVector<HSTRING>>} 
     */
    get_FileTypeChoices() {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.get_FileTypeChoices()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DefaultFileExtension() {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.get_DefaultFileExtension()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DefaultFileExtension(value) {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.put_DefaultFileExtension(value)
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_SuggestedSaveFile() {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.get_SuggestedSaveFile()
    }

    /**
     * 
     * @param {StorageFile} value 
     * @returns {HRESULT} 
     */
    put_SuggestedSaveFile(value) {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.put_SuggestedSaveFile(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SuggestedFileName() {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.get_SuggestedFileName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SuggestedFileName(value) {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.put_SuggestedFileName(value)
    }

    /**
     * Shows the file picker so that the user can save a file and set the file name, extension, and location of the file to be saved. (UWP app)
     * @remarks
     * > [!WARNING]
     * > You must use the [FileTypeChoices property](filesavepicker_filetypechoices.md)  to set one or more valid file extensions before calling this method, or it will thrown an exception. 
     * 
     * 
     * > [!WARNING]
     * > If you try to show the file picker while your app is snapped the file picker will not be shown and an exception will be thrown. You can avoid this by making sure your app is not snapped or by unsnapping it before you call the file picker. The code examples in [FileSavePicker](filesavepicker.md) and the [File picker sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/FilePicker) show you how.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.filesavepicker.picksavefileasync
     */
    PickSaveFileAsync() {
        if (!this.HasProp("__IFileSavePicker")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker := IFileSavePicker(outPtr)
        }

        return this.__IFileSavePicker.PickSaveFileAsync()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IFileSavePicker4")) {
            if ((queryResult := this.QueryInterface(IFileSavePicker4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePicker4 := IFileSavePicker4(outPtr)
        }

        return this.__IFileSavePicker4.get_User()
    }

;@endregion Instance Methods
}
