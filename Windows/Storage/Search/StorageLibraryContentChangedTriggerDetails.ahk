#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageLibraryContentChangedTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the details of a storage library content change tracker.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagelibrarycontentchangedtriggerdetails
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class StorageLibraryContentChangedTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageLibraryContentChangedTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageLibraryContentChangedTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [StorageFolder](../windows.storage/storagefolder.md) that has been changed.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagelibrarycontentchangedtriggerdetails.folder
     * @type {StorageFolder} 
     */
    Folder {
        get => this.get_Folder()
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
        if (!this.HasProp("__IStorageLibraryContentChangedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryContentChangedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryContentChangedTriggerDetails := IStorageLibraryContentChangedTriggerDetails(outPtr)
        }

        return this.__IStorageLibraryContentChangedTriggerDetails.get_Folder()
    }

    /**
     * Query for the creation/modified changes since a previous such query.
     * @param {DateTime} lastQueryTime The time the previous query was made.
     * @returns {StorageItemQueryResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagelibrarycontentchangedtriggerdetails.createmodifiedsincequery
     */
    CreateModifiedSinceQuery(lastQueryTime) {
        if (!this.HasProp("__IStorageLibraryContentChangedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryContentChangedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryContentChangedTriggerDetails := IStorageLibraryContentChangedTriggerDetails(outPtr)
        }

        return this.__IStorageLibraryContentChangedTriggerDetails.CreateModifiedSinceQuery(lastQueryTime)
    }

;@endregion Instance Methods
}
