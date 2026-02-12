#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageLibraryChangeTrackerTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the details of a storage library change tracker.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagelibrarychangetrackertriggerdetails
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class StorageLibraryChangeTrackerTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageLibraryChangeTrackerTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageLibraryChangeTrackerTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [StorageFolder](../windows.storage/storagefolder.md) that has been marked as changed by the [StorageLibraryChangeTrackerTrigger](/uwp/api/windows.applicationmodel.background.storagelibrarychangetrackertrigger)
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagelibrarychangetrackertriggerdetails.folder
     * @type {StorageFolder} 
     */
    Folder {
        get => this.get_Folder()
    }

    /**
     * Gets the [StorageLibraryChangeTracker](/uwp/api/Windows.Storage.StorageLibraryChangeTracker) associated with the [StorageLibraryChangeTrackerTrigger](/uwp/api/windows.applicationmodel.background.storagelibrarychangetrackertrigger).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagelibrarychangetrackertriggerdetails.changetracker
     * @type {StorageLibraryChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_Folder() {
        if (!this.HasProp("__IStorageLibraryChangeTrackerTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChangeTrackerTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChangeTrackerTriggerDetails := IStorageLibraryChangeTrackerTriggerDetails(outPtr)
        }

        return this.__IStorageLibraryChangeTrackerTriggerDetails.get_Folder()
    }

    /**
     * 
     * @returns {StorageLibraryChangeTracker} 
     */
    get_ChangeTracker() {
        if (!this.HasProp("__IStorageLibraryChangeTrackerTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChangeTrackerTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChangeTrackerTriggerDetails := IStorageLibraryChangeTrackerTriggerDetails(outPtr)
        }

        return this.__IStorageLibraryChangeTrackerTriggerDetails.get_ChangeTracker()
    }

;@endregion Instance Methods
}
