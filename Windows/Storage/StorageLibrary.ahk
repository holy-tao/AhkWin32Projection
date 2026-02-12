#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageLibrary.ahk
#Include .\IStorageLibrary2.ahk
#Include .\IStorageLibrary3.ahk
#Include .\IStorageLibraryStatics.ahk
#Include .\IStorageLibraryStatics2.ahk
#Include ..\Foundation\TypedEventHandler.ahk
#Include .\StorageLibrary.ahk
#Include ..\..\Guid.ahk
#Include ..\..\WinRTEventHandler.ahk

/**
 * Lets you add and remove folders from a library like Music or Videos and lets you get a list of folders included in the library.
 * @remarks
 * You can only access libraries that you have declared capabilities for in your app manifest. To learn more about capabilities see, [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrary
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageLibrary extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageLibrary

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageLibrary.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the specified library.
     * @param {Integer} libraryId A [KnownLibraryId](knownlibraryid.md) value that identifies the library to retrieve, like Music or Videos.
     * @returns {IAsyncOperation<StorageLibrary>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrary.getlibraryasync
     */
    static GetLibraryAsync(libraryId) {
        if (!StorageLibrary.HasProp("__IStorageLibraryStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageLibrary")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageLibraryStatics.IID)
            StorageLibrary.__IStorageLibraryStatics := IStorageLibraryStatics(factoryPtr)
        }

        return StorageLibrary.__IStorageLibraryStatics.GetLibraryAsync(libraryId)
    }

    /**
     * Gets the specified library for a [User](../windows.system/user.md).
     * @param {User} user_ The [User](../windows.system/user.md) for which the library is retrieved.
     * @param {Integer} libraryId A [KnownLibraryId](knownlibraryid.md) value that identifies the library to retrieve, like Music or Videos.
     * @returns {IAsyncOperation<StorageLibrary>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrary.getlibraryforuserasync
     */
    static GetLibraryForUserAsync(user_, libraryId) {
        if (!StorageLibrary.HasProp("__IStorageLibraryStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.StorageLibrary")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageLibraryStatics2.IID)
            StorageLibrary.__IStorageLibraryStatics2 := IStorageLibraryStatics2(factoryPtr)
        }

        return StorageLibrary.__IStorageLibraryStatics2.GetLibraryForUserAsync(user_, libraryId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the folders in the current library.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrary.folders
     * @type {IObservableVector<StorageFolder>} 
     */
    Folders {
        get => this.get_Folders()
    }

    /**
     * Get the default save folder for the current library.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrary.savefolder
     * @type {StorageFolder} 
     */
    SaveFolder {
        get => this.get_SaveFolder()
    }

    /**
     * Returns the [StorageLibraryChangeTracker](storagelibrarychangetracker.md) associated with the storage library.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrary.changetracker
     * @type {StorageLibraryChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

    /**
     * Occurs when the list of folders in the current library changes.
     * @type {TypedEventHandler<StorageLibrary, IInspectable>}
    */
    OnDefinitionChanged {
        get {
            if(!this.HasProp("__OnDefinitionChanged")){
                this.__OnDefinitionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{edc09538-bbae-5b2b-9e81-b449ea7e48fe}"),
                    StorageLibrary,
                    IInspectable
                )
                this.__OnDefinitionChangedToken := this.add_DefinitionChanged(this.__OnDefinitionChanged.iface)
            }
            return this.__OnDefinitionChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDefinitionChangedToken")) {
            this.remove_DefinitionChanged(this.__OnDefinitionChangedToken)
            this.__OnDefinitionChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Prompts the user to select a folder, and then adds the folder to the library.
     * @remarks
     * The file picker displayed lets user select only library-eligible locations.
     * If there are pending suggestions a suggestion dialog will be shown instead of a folder picker.
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrary.requestaddfolderasync
     */
    RequestAddFolderAsync() {
        if (!this.HasProp("__IStorageLibrary")) {
            if ((queryResult := this.QueryInterface(IStorageLibrary.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibrary := IStorageLibrary(outPtr)
        }

        return this.__IStorageLibrary.RequestAddFolderAsync()
    }

    /**
     * Prompts the user to confirm removal of the specified folder from the current library, and then removes the folder.
     * @remarks
     * > [!IMPORTANT]
     * > This method must be called from a UI thread.
     * @param {StorageFolder} folder_ The folder to remove.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrary.requestremovefolderasync
     */
    RequestRemoveFolderAsync(folder_) {
        if (!this.HasProp("__IStorageLibrary")) {
            if ((queryResult := this.QueryInterface(IStorageLibrary.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibrary := IStorageLibrary(outPtr)
        }

        return this.__IStorageLibrary.RequestRemoveFolderAsync(folder_)
    }

    /**
     * 
     * @returns {IObservableVector<StorageFolder>} 
     */
    get_Folders() {
        if (!this.HasProp("__IStorageLibrary")) {
            if ((queryResult := this.QueryInterface(IStorageLibrary.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibrary := IStorageLibrary(outPtr)
        }

        return this.__IStorageLibrary.get_Folders()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_SaveFolder() {
        if (!this.HasProp("__IStorageLibrary")) {
            if ((queryResult := this.QueryInterface(IStorageLibrary.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibrary := IStorageLibrary(outPtr)
        }

        return this.__IStorageLibrary.get_SaveFolder()
    }

    /**
     * 
     * @param {TypedEventHandler<StorageLibrary, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DefinitionChanged(handler) {
        if (!this.HasProp("__IStorageLibrary")) {
            if ((queryResult := this.QueryInterface(IStorageLibrary.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibrary := IStorageLibrary(outPtr)
        }

        return this.__IStorageLibrary.add_DefinitionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_DefinitionChanged(eventCookie) {
        if (!this.HasProp("__IStorageLibrary")) {
            if ((queryResult := this.QueryInterface(IStorageLibrary.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibrary := IStorageLibrary(outPtr)
        }

        return this.__IStorageLibrary.remove_DefinitionChanged(eventCookie)
    }

    /**
     * 
     * @returns {StorageLibraryChangeTracker} 
     */
    get_ChangeTracker() {
        if (!this.HasProp("__IStorageLibrary2")) {
            if ((queryResult := this.QueryInterface(IStorageLibrary2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibrary2 := IStorageLibrary2(outPtr)
        }

        return this.__IStorageLibrary2.get_ChangeTracker()
    }

    /**
     * Determines if there are suggestions for adding existing folders with content to the StorageLibrary.
     * @remarks
     * If this feature is not supported on your version of Windows, the method will return **false**.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrary.arefoldersuggestionsavailableasync
     */
    AreFolderSuggestionsAvailableAsync() {
        if (!this.HasProp("__IStorageLibrary3")) {
            if ((queryResult := this.QueryInterface(IStorageLibrary3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibrary3 := IStorageLibrary3(outPtr)
        }

        return this.__IStorageLibrary3.AreFolderSuggestionsAvailableAsync()
    }

;@endregion Instance Methods
}
