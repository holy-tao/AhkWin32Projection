#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IItemRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data about an [ItemRemoved](storageitemmostrecentlyusedlist_itemremoved.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.itemremovedeventargs
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class ItemRemovedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IItemRemovedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IItemRemovedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about the [StorageFile](../windows.storage/storagefile.md) or [StorageFolder](../windows.storage/storagefolder.md) that was removed from the [StorageItemMostRecentlyUsedList](storageitemmostrecentlyusedlist.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.itemremovedeventargs.removedentry
     * @type {AccessListEntry} 
     */
    RemovedEntry {
        get => this.get_RemovedEntry()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AccessListEntry} 
     */
    get_RemovedEntry() {
        if (!this.HasProp("__IItemRemovedEventArgs")) {
            if ((queryResult := this.QueryInterface(IItemRemovedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IItemRemovedEventArgs := IItemRemovedEventArgs(outPtr)
        }

        return this.__IItemRemovedEventArgs.get_RemovedEntry()
    }

;@endregion Instance Methods
}
