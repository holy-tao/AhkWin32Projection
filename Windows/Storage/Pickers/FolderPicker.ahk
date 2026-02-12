#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFolderPicker2.ahk
#Include .\IFolderPicker.ahk
#Include .\IFolderPicker3.ahk
#Include .\IFolderPickerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a UI element that lets the user choose folders.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * To get started accessing files and folders with a picker, see [Open files and folders with a picker](/windows/uwp/files/quickstart-using-file-and-folder-pickers).
 * 
 * > [!NOTE]
 * > To use a folder picker in a WinUI 3 app (or other desktop app), see the [FolderPicker class](/windows/windows-app-sdk/api/winrt/microsoft.windows.storage.pickers.folderpicker) documentation for the Windows App SDK.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.folderpicker
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class FolderPicker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFolderPicker2

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFolderPicker2.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [FolderPicker](folderpicker.md) that is scoped to the personal directory of the specified user. Use this method for [multi-user applications](/windows/uwp/xbox-apps/multi-user-applications).
     * @param {User} user_ The user for which to create the [FolderPicker](folderpicker.md).
     * @returns {FolderPicker} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.folderpicker.createforuser
     */
    static CreateForUser(user_) {
        if (!FolderPicker.HasProp("__IFolderPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Pickers.FolderPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFolderPickerStatics.IID)
            FolderPicker.__IFolderPickerStatics := IFolderPickerStatics(factoryPtr)
        }

        return FolderPicker.__IFolderPickerStatics.CreateForUser(user_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a set of values to be populated by the app before a [PickFolderAndContinue](folderpicker_pickfolderandcontinue_668530001.md) operation that deactivates the app in order to provide context when the app is activated. (Windows Phone 8.x app)
     * @remarks
     * > Windows Phone 8.x app only. For more info, see [How to continue your Windows Phone app after calling a file picker](/previous-versions/windows/apps/dn614994(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.folderpicker.continuationdata
     * @type {ValueSet} 
     */
    ContinuationData {
        get => this.get_ContinuationData()
    }

    /**
     * Gets or sets the view mode that the folder picker uses to display items.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.folderpicker.viewmode
     * @type {Integer} 
     */
    ViewMode {
        get => this.get_ViewMode()
        set => this.put_ViewMode(value)
    }

    /**
     * Gets or sets the settings identifier associated with the with the current [FolderPicker](folderpicker.md) instance.
     * @remarks
     * If your application uses multiple instances of the folder picker, you can use this property to identify the individual instances.
     * 
     * To give the user a sense of consistency, the folder picker remembers the last location that the user navigated to and will generally start at that location. Normally, this remembered location is shared by all folder pickers used by the app. To remember a different location for different pickers, choose a different SettingsIdentifier for each picker.
     * 
     * For example, if you use one folder picker for picking flowers, and another for picking fruit, you can set the SettingsIdentifier for the first picker to "Flowers" and the SettingsIdentifier for the second picker to "Fruit". That way, each time the user picks flowers, they default to the last location they used for picking flowers; and each time the user picks fruit, they default to the last location they used for picking fruit.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.folderpicker.settingsidentifier
     * @type {HSTRING} 
     */
    SettingsIdentifier {
        get => this.get_SettingsIdentifier()
        set => this.put_SettingsIdentifier(value)
    }

    /**
     * Gets or sets the initial location where the folder picker looks for folders to present to the user.
     * @remarks
     * The SuggestedStartLocation is not always used as the start location for the folder picker. To give the user a sense of consistency, the folder picker remembers the last location that the user navigated to and will generally start at that location.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.folderpicker.suggestedstartlocation
     * @type {Integer} 
     */
    SuggestedStartLocation {
        get => this.get_SuggestedStartLocation()
        set => this.put_SuggestedStartLocation(value)
    }

    /**
     * Gets or sets the label text of the folder picker's commit button.
     * @remarks
     * By default, the label text of the commit button is **Pick Folder**.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.folderpicker.commitbuttontext
     * @type {HSTRING} 
     */
    CommitButtonText {
        get => this.get_CommitButtonText()
        set => this.put_CommitButtonText(value)
    }

    /**
     * Gets the collection of file types that the folder picker displays.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.folderpicker.filetypefilter
     * @type {IVector<HSTRING>} 
     */
    FileTypeFilter {
        get => this.get_FileTypeFilter()
    }

    /**
     * Gets info about the user for which the [FolderPicker](folderpicker.md) was created. Use this property for [multi-user applications](/windows/uwp/xbox-apps/multi-user-applications).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.folderpicker.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of a [FolderPicker](folderpicker.md).
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Pickers.FolderPicker")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_ContinuationData() {
        if (!this.HasProp("__IFolderPicker2")) {
            if ((queryResult := this.QueryInterface(IFolderPicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker2 := IFolderPicker2(outPtr)
        }

        return this.__IFolderPicker2.get_ContinuationData()
    }

    /**
     * **Obsolete as of Windows 10; use PickSingleFolderAsync instead.** Shows the file picker so that the user can pick a folder, deactivating and the app and reactivating it when the operation is complete. (Windows Phone 8.x app)
     * @remarks
     * > Windows Phone 8.x app only. Use the [ContinuationData](folderpicker_continuationdata.md) property to store context information that can be retrieved when the app is reactivated. For more info, see [How to continue your Windows Phone app after calling a file picker](/previous-versions/windows/apps/dn614994(v=win.10)).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.folderpicker.pickfolderandcontinue
     */
    PickFolderAndContinue() {
        if (!this.HasProp("__IFolderPicker2")) {
            if ((queryResult := this.QueryInterface(IFolderPicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker2 := IFolderPicker2(outPtr)
        }

        return this.__IFolderPicker2.PickFolderAndContinue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ViewMode() {
        if (!this.HasProp("__IFolderPicker")) {
            if ((queryResult := this.QueryInterface(IFolderPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker := IFolderPicker(outPtr)
        }

        return this.__IFolderPicker.get_ViewMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ViewMode(value) {
        if (!this.HasProp("__IFolderPicker")) {
            if ((queryResult := this.QueryInterface(IFolderPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker := IFolderPicker(outPtr)
        }

        return this.__IFolderPicker.put_ViewMode(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SettingsIdentifier() {
        if (!this.HasProp("__IFolderPicker")) {
            if ((queryResult := this.QueryInterface(IFolderPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker := IFolderPicker(outPtr)
        }

        return this.__IFolderPicker.get_SettingsIdentifier()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SettingsIdentifier(value) {
        if (!this.HasProp("__IFolderPicker")) {
            if ((queryResult := this.QueryInterface(IFolderPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker := IFolderPicker(outPtr)
        }

        return this.__IFolderPicker.put_SettingsIdentifier(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SuggestedStartLocation() {
        if (!this.HasProp("__IFolderPicker")) {
            if ((queryResult := this.QueryInterface(IFolderPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker := IFolderPicker(outPtr)
        }

        return this.__IFolderPicker.get_SuggestedStartLocation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SuggestedStartLocation(value) {
        if (!this.HasProp("__IFolderPicker")) {
            if ((queryResult := this.QueryInterface(IFolderPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker := IFolderPicker(outPtr)
        }

        return this.__IFolderPicker.put_SuggestedStartLocation(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CommitButtonText() {
        if (!this.HasProp("__IFolderPicker")) {
            if ((queryResult := this.QueryInterface(IFolderPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker := IFolderPicker(outPtr)
        }

        return this.__IFolderPicker.get_CommitButtonText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CommitButtonText(value) {
        if (!this.HasProp("__IFolderPicker")) {
            if ((queryResult := this.QueryInterface(IFolderPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker := IFolderPicker(outPtr)
        }

        return this.__IFolderPicker.put_CommitButtonText(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_FileTypeFilter() {
        if (!this.HasProp("__IFolderPicker")) {
            if ((queryResult := this.QueryInterface(IFolderPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker := IFolderPicker(outPtr)
        }

        return this.__IFolderPicker.get_FileTypeFilter()
    }

    /**
     * Shows the [folderPicker](folderpicker.md) object so that the user can pick a folder. (UWP app)
     * 
     * > [!NOTE]
     * > You must specify the [FileTypeFilter](folderpicker_filetypefilter.md) before calling this method, or it will throw an exception. To list all folders, use "*" as the filter.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.pickers.folderpicker.picksinglefolderasync
     */
    PickSingleFolderAsync() {
        if (!this.HasProp("__IFolderPicker")) {
            if ((queryResult := this.QueryInterface(IFolderPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker := IFolderPicker(outPtr)
        }

        return this.__IFolderPicker.PickSingleFolderAsync()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IFolderPicker3")) {
            if ((queryResult := this.QueryInterface(IFolderPicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderPicker3 := IFolderPicker3(outPtr)
        }

        return this.__IFolderPicker3.get_User()
    }

;@endregion Instance Methods
}
