#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageLibraryChangeTracker.ahk
#Include .\IStorageLibraryChangeTracker2.ahk
#Include ..\..\Guid.ahk

/**
 * Provides APIs that you can use to manage change tracking for any library (such as documents, music, or videos) or folder.
 * @remarks
 * Get an instance of this class by using the [ChangeTracker](storagelibrary_changetracker.md) property of the [StorageLibrary](storagelibrary.md) class
 * or the [TryGetChangeTracker](storagefolder_trygetchangetracker_168297820.md) method from [StorageFolder](storagefolder.md).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangetracker
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageLibraryChangeTracker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageLibraryChangeTracker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageLibraryChangeTracker.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves a [StorageLibraryChangeReader](storagelibrarychangereader.md) that enables the app to iterate through the list of changes and mark changes as accepted.
     * @returns {StorageLibraryChangeReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangetracker.getchangereader
     */
    GetChangeReader() {
        if (!this.HasProp("__IStorageLibraryChangeTracker")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChangeTracker := IStorageLibraryChangeTracker(outPtr)
        }

        return this.__IStorageLibraryChangeTracker.GetChangeReader()
    }

    /**
     * Enables change tracking for the storage library.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangetracker.enable
     */
    Enable() {
        if (!this.HasProp("__IStorageLibraryChangeTracker")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChangeTracker := IStorageLibraryChangeTracker(outPtr)
        }

        return this.__IStorageLibraryChangeTracker.Enable()
    }

    /**
     * Resets change tracking for the storage library, deleting existing change tracking data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangetracker.reset
     */
    Reset() {
        if (!this.HasProp("__IStorageLibraryChangeTracker")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChangeTracker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChangeTracker := IStorageLibraryChangeTracker(outPtr)
        }

        return this.__IStorageLibraryChangeTracker.Reset()
    }

    /**
     * Enables change tracking for the storage library on all or the latest changes based on the change id.
     * @remarks
     * For applications only interested in the last change id, the system will not store all change records and bloat the storage on the device. In this case, ReadBatchAsync will always return 0 records.
     * @param {StorageLibraryChangeTrackerOptions} options A [StorageLibraryChangeTrackerOptions](storagelibrarychangetrackeroptions.md) instance.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangetracker.enable
     */
    EnableWithOptions(options) {
        if (!this.HasProp("__IStorageLibraryChangeTracker2")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChangeTracker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChangeTracker2 := IStorageLibraryChangeTracker2(outPtr)
        }

        return this.__IStorageLibraryChangeTracker2.EnableWithOptions(options)
    }

    /**
     * Disables change tracking for the StorageFolder or StorageLibrary.
     * @remarks
     * This method will do nothing if the calling application has not yet called Enable on the StorageFolder/StorageLibrary.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangetracker.disable
     */
    Disable() {
        if (!this.HasProp("__IStorageLibraryChangeTracker2")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChangeTracker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChangeTracker2 := IStorageLibraryChangeTracker2(outPtr)
        }

        return this.__IStorageLibraryChangeTracker2.Disable()
    }

;@endregion Instance Methods
}
