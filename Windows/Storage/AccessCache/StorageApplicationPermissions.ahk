#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageApplicationPermissionsStatics2.ahk
#Include .\IStorageApplicationPermissionsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides static properties for you to get your app's most recently used list (MRU) (use [StorageApplicationPermissions.MostRecentlyUsedList](storageapplicationpermissions_mostrecentlyusedlist.md)) and future-access list (use [StorageApplicationPermissions.FutureAccessList](storageapplicationpermissions_futureaccesslist.md).
 * @remarks
 * Access the methods and properties of this class statically.
 * 
 * To see more code examples, see the [File picker sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/FilePicker) and the [File access sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/FileAccess).
 * 
 * To learn about using the [FutureAccessList](storageapplicationpermissions_futureaccesslist.md) and [MostRecentlyUsedList](storageapplicationpermissions_mostrecentlyusedlist.md), see [Track recently used files and folders](/windows/uwp/files/how-to-track-recently-used-files-and-folders).
 * 
 * To learn about what files and locations your app has permission to access, see [File access permissions](/windows/uwp/files/file-access-permissions).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageapplicationpermissions
 * @namespace Windows.Storage.AccessCache
 * @version WindowsRuntime 1.4
 */
class StorageApplicationPermissions extends IInspectable {
;@region Static Properties
    /**
     * Gets an object that represents a list that an app maintains so that the app can store files and/or locations (like folders) and easily access these items in the future.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageapplicationpermissions.futureaccesslist
     * @type {StorageItemAccessList} 
     */
    static FutureAccessList {
        get => StorageApplicationPermissions.get_FutureAccessList()
    }

    /**
     * Gets an object that represents a list that an app can use to track the files and/or locations (like folders) that the app has accessed most recently.
     * @remarks
     * If you want to respond to [ItemRemoved](storageitemmostrecentlyusedlist_itemremoved.md) events, you must register your event handler every time you get a new reference to the [StorageItemMostRecentlyUsedList](storageitemmostrecentlyusedlist.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageapplicationpermissions.mostrecentlyusedlist
     * @type {StorageItemMostRecentlyUsedList} 
     */
    static MostRecentlyUsedList {
        get => StorageApplicationPermissions.get_MostRecentlyUsedList()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an object that represents a list that an app maintains so that the app can store files and/or locations (like folders) and easily access these items in the future. This method returns an object that is scoped to the specified user. Use this method for [multi-user applications](/windows/uwp/xbox-apps/multi-user-applications).
     * @param {User} user_ The user for which to create the future-access list object.
     * @returns {StorageItemAccessList} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageapplicationpermissions.getfutureaccesslistforuser
     */
    static GetFutureAccessListForUser(user_) {
        if (!StorageApplicationPermissions.HasProp("__IStorageApplicationPermissionsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.AccessCache.StorageApplicationPermissions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageApplicationPermissionsStatics2.IID)
            StorageApplicationPermissions.__IStorageApplicationPermissionsStatics2 := IStorageApplicationPermissionsStatics2(factoryPtr)
        }

        return StorageApplicationPermissions.__IStorageApplicationPermissionsStatics2.GetFutureAccessListForUser(user_)
    }

    /**
     * Gets an object that an app can use to track the files and/or locations (like folders) that the app has accessed most recently. This method returns an object that is scoped to the specified user. Use this method for [multi-user applications](/windows/uwp/xbox-apps/multi-user-applications).
     * @remarks
     * If you want to respond to [ItemRemoved](storageitemmostrecentlyusedlist_itemremoved.md) events, you must register your event handler every time you get a new reference to the [StorageItemMostRecentlyUsedList](storageitemmostrecentlyusedlist.md).
     * @param {User} user_ The user for which to create the most recently used (MRU) list object.
     * @returns {StorageItemMostRecentlyUsedList} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.accesscache.storageapplicationpermissions.getmostrecentlyusedlistforuser
     */
    static GetMostRecentlyUsedListForUser(user_) {
        if (!StorageApplicationPermissions.HasProp("__IStorageApplicationPermissionsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.AccessCache.StorageApplicationPermissions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageApplicationPermissionsStatics2.IID)
            StorageApplicationPermissions.__IStorageApplicationPermissionsStatics2 := IStorageApplicationPermissionsStatics2(factoryPtr)
        }

        return StorageApplicationPermissions.__IStorageApplicationPermissionsStatics2.GetMostRecentlyUsedListForUser(user_)
    }

    /**
     * 
     * @returns {StorageItemAccessList} 
     */
    static get_FutureAccessList() {
        if (!StorageApplicationPermissions.HasProp("__IStorageApplicationPermissionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.AccessCache.StorageApplicationPermissions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageApplicationPermissionsStatics.IID)
            StorageApplicationPermissions.__IStorageApplicationPermissionsStatics := IStorageApplicationPermissionsStatics(factoryPtr)
        }

        return StorageApplicationPermissions.__IStorageApplicationPermissionsStatics.get_FutureAccessList()
    }

    /**
     * 
     * @returns {StorageItemMostRecentlyUsedList} 
     */
    static get_MostRecentlyUsedList() {
        if (!StorageApplicationPermissions.HasProp("__IStorageApplicationPermissionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.AccessCache.StorageApplicationPermissions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageApplicationPermissionsStatics.IID)
            StorageApplicationPermissions.__IStorageApplicationPermissionsStatics := IStorageApplicationPermissionsStatics(factoryPtr)
        }

        return StorageApplicationPermissions.__IStorageApplicationPermissionsStatics.get_MostRecentlyUsedList()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
