#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk

/**
 * Represents a list entry that contains the identifier and metadata for a [StorageFile](../windows.storage/storagefile.md) or [StorageFolder](../windows.storage/storagefolder.md) object in a list.
 * @remarks
 * The fields of the AccessListEntry structure are set by an app when it adds a [StorageFile](../windows.storage/storagefile.md) or [StorageFolder](../windows.storage/storagefolder.md) to the [StorageItemAccessList](storageitemaccesslist.md) or to the [StorageItemMostRecentlyUsedList](storageitemmostrecentlyusedlist.md).
 * 
 * The AccessListEntry for an item in a list can be accessed from the [AccessListEntryView.First](accesslistentryview_first_1920739956.md) or [AccessListEntryView.GetAt](accesslistentryview_getat_496709656.md) methods, or from the [ItemRemovedEventArgs.RemovedEntry](itemremovedeventargs_removedentry.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.accesslistentry
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class AccessListEntry extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The identifier of the [StorageFile](../windows.storage/storagefile.md) or [StorageFolder](../windows.storage/storagefolder.md) in the list.
     * @type {HSTRING}
     */
    Token{
        get {
            if(!this.HasProp("__Token"))
                this.__Token := HSTRING(0, this)
            return this.__Token
        }
    }

    /**
     * Optional app-specified metadata associated with the [StorageFile](../windows.storage/storagefile.md) or [StorageFolder](../windows.storage/storagefolder.md) in the list.
     * @type {HSTRING}
     */
    Metadata{
        get {
            if(!this.HasProp("__Metadata"))
                this.__Metadata := HSTRING(8, this)
            return this.__Metadata
        }
    }
}
