#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageLibraryChangeReader.ahk
#Include .\IStorageLibraryChangeReader2.ahk
#Include ..\..\Guid.ahk

/**
 * Enables the calling app to read through the changes to items in a storage library.
 * @remarks
 * Get an instance of this object by using the [GetChangeReader](storagelibrarychangetracker_getchangereader_1364424875.md) method of the [StorageLibraryChangeTracker](storagelibrarychangetracker.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangereader
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageLibraryChangeReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageLibraryChangeReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageLibraryChangeReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously gets a list of [StorageLibraryChange](storagelibrarychange.md) objects.
     * @returns {IAsyncOperation<IVectorView<StorageLibraryChange>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangereader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IStorageLibraryChangeReader")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChangeReader := IStorageLibraryChangeReader(outPtr)
        }

        return this.__IStorageLibraryChangeReader.ReadBatchAsync()
    }

    /**
     * Tells the system that all of the changes described in the [StorageLibraryChange](storagelibrarychange.md) objects returned by the call to [ReadBatchAsync](storagelibrarychangereader_readbatchasync_888788553.md) have been addressed by the app.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangereader.acceptchangesasync
     */
    AcceptChangesAsync() {
        if (!this.HasProp("__IStorageLibraryChangeReader")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChangeReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChangeReader := IStorageLibraryChangeReader(outPtr)
        }

        return this.__IStorageLibraryChangeReader.AcceptChangesAsync()
    }

    /**
     * Gets a unique value representing the last change processed by the indexing service for the given StorageFolder or StorageLibrary.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychangereader.getlastchangeid
     */
    GetLastChangeId() {
        if (!this.HasProp("__IStorageLibraryChangeReader2")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChangeReader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChangeReader2 := IStorageLibraryChangeReader2(outPtr)
        }

        return this.__IStorageLibraryChangeReader2.GetLastChangeId()
    }

;@endregion Instance Methods
}
