#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileOpenPicker2.ahk
#Include .\IFileOpenPickerWithOperationId.ahk
#Include .\IFileOpenPicker.ahk
#Include .\IFileOpenPicker3.ahk
#Include .\IFileOpenPickerStatics2.ahk
#Include .\IFileOpenPickerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a UI element that lets the user choose and open files.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * To get started accessing files and folders file picker, see [Quickstart: Accessing files with File Pickers](/windows/uwp/files/quickstart-using-file-and-folder-pickers).
 * 
 * > [!NOTE]
 * > To use a file open picker in a WinUI app (or other desktop app), see the [FileOpenPicker class](/windows/windows-app-sdk/api/winrt/microsoft.windows.storage.pickers.fileopenpicker) documentation for the Windows App SDK.
 * 
 * For information about how to use this API outside of UWP apps, see [Call interop APIs from a .NET app](/windows/apps/desktop/modernize/winrt-com-interop-csharp).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class FileOpenPicker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileOpenPicker2

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileOpenPicker2.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [FileOpenPicker](fileopenpicker.md) that is scoped to the personal directory of the specified user. Use this method for [multi-user applications](/windows/uwp/xbox-apps/multi-user-applications).
     * @param {User} user_ The user for which to create the [FileOpenPicker](fileopenpicker.md).
     * @returns {FileOpenPicker} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.createforuser
     */
    static CreateForUser(user_) {
        if (!FileOpenPicker.HasProp("__IFileOpenPickerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Pickers.FileOpenPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileOpenPickerStatics2.IID)
            FileOpenPicker.__IFileOpenPickerStatics2 := IFileOpenPickerStatics2(factoryPtr)
        }

        return FileOpenPicker.__IFileOpenPickerStatics2.CreateForUser(user_)
    }

    /**
     * Resumes the picking operation to retrieve the user-selected file if the user navigates away from the app after the picker operation has completed and the app is suspended.
     * @remarks
     * Do not use.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.resumepicksinglefileasync
     */
    static ResumePickSingleFileAsync() {
        if (!FileOpenPicker.HasProp("__IFileOpenPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Pickers.FileOpenPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileOpenPickerStatics.IID)
            FileOpenPicker.__IFileOpenPickerStatics := IFileOpenPickerStatics(factoryPtr)
        }

        return FileOpenPicker.__IFileOpenPickerStatics.ResumePickSingleFileAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a set of values to be populated by the app before [PickSingleFileAndContinue](fileopenpicker_picksinglefileandcontinue_1567473542.md) or [PickMultipleFilesAndContinue](fileopenpicker_pickmultiplefilesandcontinue_984499149.md) operation that deactivates the app in order to provide context when the app is activated. (Windows Phone 8.x app)
     * @remarks
     * > Windows Phone 8.x app only. For more info, see [How to continue your Windows Phone app after calling a file picker](/previous-versions/windows/apps/dn614994(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.continuationdata
     * @type {ValueSet} 
     */
    ContinuationData {
        get => this.get_ContinuationData()
    }

    /**
     * Gets or sets the view mode that the file open picker uses to display items.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.viewmode
     * @type {Integer} 
     */
    ViewMode {
        get => this.get_ViewMode()
        set => this.put_ViewMode(value)
    }

    /**
     * Gets or sets the settings identifier associated with the state of the file open picker.
     * @remarks
     * If your application uses multiple instances of the file open picker, you can use this property to identify the individual instances.
     * 
     * To give the user a sense of consistency, the file open picker remembers the last location that the user navigated to and will generally start at that location. Normally, this remembered location is shared by all file open pickers used by the app. To remember a different location for different pickers, choose a different SettingsIdentifier for each picker.
     * 
     * For example, if you use one file open picker for picking flowers, and another for picking fruit, you can set the SettingsIdentifier for the first picker to "Flowers" and the SettingsIdentifier for the second picker to "Fruit". That way, each time the user picks flowers, they default to the last location they used for picking flowers; and each time the user picks fruit, they default to the last location they used for picking fruit.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.settingsidentifier
     * @type {HSTRING} 
     */
    SettingsIdentifier {
        get => this.get_SettingsIdentifier()
        set => this.put_SettingsIdentifier(value)
    }

    /**
     * Gets or sets the initial location where the file open picker looks for files to present to the user.
     * @remarks
     * The SuggestedStartLocation is not always used as the start location for the file picker. To give the user a sense of consistency, the file picker remembers the last location that the user navigated to and will generally start at that location.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.suggestedstartlocation
     * @type {Integer} 
     */
    SuggestedStartLocation {
        get => this.get_SuggestedStartLocation()
        set => this.put_SuggestedStartLocation(value)
    }

    /**
     * Gets or sets the label text of the file open picker's commit button.
     * @remarks
     * By default, the label text of the commit button is **Open**.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.commitbuttontext
     * @type {HSTRING} 
     */
    CommitButtonText {
        get => this.get_CommitButtonText()
        set => this.put_CommitButtonText(value)
    }

    /**
     * Gets the collection of file types that the file open picker displays.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.filetypefilter
     * @type {IVector<HSTRING>} 
     */
    FileTypeFilter {
        get => this.get_FileTypeFilter()
    }

    /**
     * Gets info about the user for which the [FileOpenPicker](fileopenpicker.md) was created. Use this property for [multi-user applications](/windows/uwp/xbox-apps/multi-user-applications).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of a [FileOpenPicker](fileopenpicker.md).
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Pickers.FileOpenPicker")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_ContinuationData() {
        if (!this.HasProp("__IFileOpenPicker2")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker2 := IFileOpenPicker2(outPtr)
        }

        return this.__IFileOpenPicker2.get_ContinuationData()
    }

    /**
     * Shows the file picker so that the user can pick one file, potentially deactivating the app and reactivating it when the operation is complete. (Windows Phone 8.x app)
     * @remarks
     * > Windows Phone 8.x app only. Use the [ContinuationData](fileopenpicker_continuationdata.md) property to store context information that can be retrieved when the app is reactivated. For more info, see [How to continue your Windows Phone app after calling a file picker](/previous-versions/windows/apps/dn614994(v=win.10)).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.picksinglefileandcontinue
     */
    PickSingleFileAndContinue() {
        if (!this.HasProp("__IFileOpenPicker2")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker2 := IFileOpenPicker2(outPtr)
        }

        return this.__IFileOpenPicker2.PickSingleFileAndContinue()
    }

    /**
     * **Obsolete as of Windows 10; use PickSingleFolderAsync instead.** Shows the file picker so that the user can pick multiple files, deactivating and the app and reactivating it when the operation is complete. (Windows Phone 8.x app)
     * @remarks
     * > Windows Phone 8.x app only. Use the [ContinuationData](fileopenpicker_continuationdata.md) property to store context information that can be retrieved when the app is reactivated. For more info, see [How to continue your Windows Phone app after calling a file picker](/previous-versions/windows/apps/dn614994(v=win.10)).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.pickmultiplefilesandcontinue
     */
    PickMultipleFilesAndContinue() {
        if (!this.HasProp("__IFileOpenPicker2")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker2 := IFileOpenPicker2(outPtr)
        }

        return this.__IFileOpenPicker2.PickMultipleFilesAndContinue()
    }

    /**
     * Shows the file picker so that the user can pick one file.
     * @remarks
     * > This API isn't supported for Windows Phone for either Windows Runtime or Microsoft Silverlight. Use [PickSingleFileAndContinue](fileopenpicker_picksinglefileandcontinue_1567473542.md) instead.
     * @param {HSTRING} pickerOperationId 
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.picksinglefileasync
     */
    PickSingleFileAsync(pickerOperationId) {
        if (!this.HasProp("__IFileOpenPickerWithOperationId")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerWithOperationId.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerWithOperationId := IFileOpenPickerWithOperationId(outPtr)
        }

        return this.__IFileOpenPickerWithOperationId.PickSingleFileAsync(pickerOperationId)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewMode() {
        if (!this.HasProp("__IFileOpenPicker")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker := IFileOpenPicker(outPtr)
        }

        return this.__IFileOpenPicker.get_ViewMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ViewMode(value) {
        if (!this.HasProp("__IFileOpenPicker")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker := IFileOpenPicker(outPtr)
        }

        return this.__IFileOpenPicker.put_ViewMode(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SettingsIdentifier() {
        if (!this.HasProp("__IFileOpenPicker")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker := IFileOpenPicker(outPtr)
        }

        return this.__IFileOpenPicker.get_SettingsIdentifier()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SettingsIdentifier(value) {
        if (!this.HasProp("__IFileOpenPicker")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker := IFileOpenPicker(outPtr)
        }

        return this.__IFileOpenPicker.put_SettingsIdentifier(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SuggestedStartLocation() {
        if (!this.HasProp("__IFileOpenPicker")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker := IFileOpenPicker(outPtr)
        }

        return this.__IFileOpenPicker.get_SuggestedStartLocation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SuggestedStartLocation(value) {
        if (!this.HasProp("__IFileOpenPicker")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker := IFileOpenPicker(outPtr)
        }

        return this.__IFileOpenPicker.put_SuggestedStartLocation(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CommitButtonText() {
        if (!this.HasProp("__IFileOpenPicker")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker := IFileOpenPicker(outPtr)
        }

        return this.__IFileOpenPicker.get_CommitButtonText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CommitButtonText(value) {
        if (!this.HasProp("__IFileOpenPicker")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker := IFileOpenPicker(outPtr)
        }

        return this.__IFileOpenPicker.put_CommitButtonText(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_FileTypeFilter() {
        if (!this.HasProp("__IFileOpenPicker")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker := IFileOpenPicker(outPtr)
        }

        return this.__IFileOpenPicker.get_FileTypeFilter()
    }

    /**
     * Shows the file picker so that the user can pick one file.
     * @remarks
     * > UWP app only. This signature isn't supported. Use [PickSingleFileAsync](fileopenpicker_picksinglefileasync_1320627792.md) instead.
     * 
     * > Windows Phone 8.x app only. This signature isn't supported. Use [PickSingleFileAndContinue](fileopenpicker_picksinglefileandcontinue_1567473542.md) instead.
     * @returns {IAsyncOperation<StorageFile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.picksinglefileasync
     */
    PickSingleFileAsync1() {
        if (!this.HasProp("__IFileOpenPicker")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker := IFileOpenPicker(outPtr)
        }

        return this.__IFileOpenPicker.PickSingleFileAsync()
    }

    /**
     * Shows the file picker so that the user can pick multiple files. (UWP app)
     * @remarks
     * > [!WARNING]
     * > On Windows 8, if you try to show the file picker while your app is snapped the file picker will not be shown and an exception will be thrown. You can avoid this by making sure your app is not snapped or by unsnapping it before you call the file picker. The code examples in [FileOpenPicker](fileopenpicker.md) and the [File picker sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/FilePicker) show you how.
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.fileopenpicker.pickmultiplefilesasync
     */
    PickMultipleFilesAsync() {
        if (!this.HasProp("__IFileOpenPicker")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker := IFileOpenPicker(outPtr)
        }

        return this.__IFileOpenPicker.PickMultipleFilesAsync()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IFileOpenPicker3")) {
            if ((queryResult := this.QueryInterface(IFileOpenPicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPicker3 := IFileOpenPicker3(outPtr)
        }

        return this.__IFileOpenPicker3.get_User()
    }

;@endregion Instance Methods
}
