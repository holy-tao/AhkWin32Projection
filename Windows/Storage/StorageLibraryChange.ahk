#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageLibraryChange.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a change to an item in a storage library such as the documents, music, or video library.
 * @remarks
 * Instances of this class are created by the [ReadBatchAsync](storagelibrarychangereader_readbatchasync_888788553.md) method of the [StorageLibraryChangeReader](storagelibrarychangereader.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychange
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class StorageLibraryChange extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageLibraryChange

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageLibraryChange.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [StorageLibraryChangeType](storagelibrarychangetype.md) value that indicates the type of change represented by the object.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychange.changetype
     * @type {Integer} 
     */
    ChangeType {
        get => this.get_ChangeType()
    }

    /**
     * Gets the full path of the file or folder in the storage library that changed.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychange.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets the full path of the item in a storage library before it was moved or renamed.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychange.previouspath
     * @type {HSTRING} 
     */
    PreviousPath {
        get => this.get_PreviousPath()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeType() {
        if (!this.HasProp("__IStorageLibraryChange")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChange := IStorageLibraryChange(outPtr)
        }

        return this.__IStorageLibraryChange.get_ChangeType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        if (!this.HasProp("__IStorageLibraryChange")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChange := IStorageLibraryChange(outPtr)
        }

        return this.__IStorageLibraryChange.get_Path()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PreviousPath() {
        if (!this.HasProp("__IStorageLibraryChange")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChange := IStorageLibraryChange(outPtr)
        }

        return this.__IStorageLibraryChange.get_PreviousPath()
    }

    /**
     * Indicates whether the current [StorageFolder](storagefolder.md) matches the specified [StorageItemTypes](storageitemtypes.md) value.
     * @param {Integer} type The enum value that determines the object type to match against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychange.isoftype
     */
    IsOfType(type) {
        if (!this.HasProp("__IStorageLibraryChange")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChange := IStorageLibraryChange(outPtr)
        }

        return this.__IStorageLibraryChange.IsOfType(type)
    }

    /**
     * Gets the storage item that has changed.
     * @returns {IAsyncOperation<IStorageItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.storagelibrarychange.getstorageitemasync
     */
    GetStorageItemAsync() {
        if (!this.HasProp("__IStorageLibraryChange")) {
            if ((queryResult := this.QueryInterface(IStorageLibraryChange.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageLibraryChange := IStorageLibraryChange(outPtr)
        }

        return this.__IStorageLibraryChange.GetStorageItemAsync()
    }

;@endregion Instance Methods
}
