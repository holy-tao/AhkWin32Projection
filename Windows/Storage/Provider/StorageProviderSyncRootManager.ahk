#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderSyncRootManagerStatics.ahk
#Include .\IStorageProviderSyncRootManagerStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the ability to register or unregister a Cloud Storage Provider sync root with the operating system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootmanager
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderSyncRootManager extends IInspectable {
;@region Static Methods
    /**
     * Registers a sync root with the operating system.
     * @remarks
     * Multiple sync roots cannot be registered with the same [path](storageprovidersyncrootinfo_path.md).
     * @param {StorageProviderSyncRootInfo} syncRootInformation The sync root to register.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootmanager.register
     */
    static Register(syncRootInformation) {
        if (!StorageProviderSyncRootManager.HasProp("__IStorageProviderSyncRootManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderSyncRootManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageProviderSyncRootManagerStatics.IID)
            StorageProviderSyncRootManager.__IStorageProviderSyncRootManagerStatics := IStorageProviderSyncRootManagerStatics(factoryPtr)
        }

        return StorageProviderSyncRootManager.__IStorageProviderSyncRootManagerStatics.Register(syncRootInformation)
    }

    /**
     * Unregisters a sync root from the operating system.
     * @remarks
     * Desktop apps that are not packaged using [MSIX](/windows/msix/) must call this method when uninstalled in order to unregister the sync root. 
     * 
     * Packaged desktop apps do not need to call this method on uninstall, because the sync root will be automatically unregistered by the OS.
     * @param {HSTRING} id The Id of the sync root to unregister.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootmanager.unregister
     */
    static Unregister(id) {
        if (!StorageProviderSyncRootManager.HasProp("__IStorageProviderSyncRootManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderSyncRootManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageProviderSyncRootManagerStatics.IID)
            StorageProviderSyncRootManager.__IStorageProviderSyncRootManagerStatics := IStorageProviderSyncRootManagerStatics(factoryPtr)
        }

        return StorageProviderSyncRootManager.__IStorageProviderSyncRootManagerStatics.Unregister(id)
    }

    /**
     * Returns the properties of a Cloud Storage Provider's sync root given a storage folder.
     * @param {IStorageFolder} folder_ The storage folder for the sync root.
     * @returns {StorageProviderSyncRootInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootmanager.getsyncrootinformationforfolder
     */
    static GetSyncRootInformationForFolder(folder_) {
        if (!StorageProviderSyncRootManager.HasProp("__IStorageProviderSyncRootManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderSyncRootManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageProviderSyncRootManagerStatics.IID)
            StorageProviderSyncRootManager.__IStorageProviderSyncRootManagerStatics := IStorageProviderSyncRootManagerStatics(factoryPtr)
        }

        return StorageProviderSyncRootManager.__IStorageProviderSyncRootManagerStatics.GetSyncRootInformationForFolder(folder_)
    }

    /**
     * Returns the properties of a Cloud Storage Provider's sync root given a sync root [Id](StorageProviderSyncRootInfo_id.md).
     * @param {HSTRING} id A string value of the sync root Id.
     * @returns {StorageProviderSyncRootInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootmanager.getsyncrootinformationforid
     */
    static GetSyncRootInformationForId(id) {
        if (!StorageProviderSyncRootManager.HasProp("__IStorageProviderSyncRootManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderSyncRootManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageProviderSyncRootManagerStatics.IID)
            StorageProviderSyncRootManager.__IStorageProviderSyncRootManagerStatics := IStorageProviderSyncRootManagerStatics(factoryPtr)
        }

        return StorageProviderSyncRootManager.__IStorageProviderSyncRootManagerStatics.GetSyncRootInformationForId(id)
    }

    /**
     * Gets all of the currently registered sync roots.
     * @remarks
     * This collection can include both legacy sync roots and sync roots registered with [StorageProviderSyncRootManager.Register](storageprovidersyncrootmanager_register_1146790023.md).
     * @returns {IVectorView<StorageProviderSyncRootInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootmanager.getcurrentsyncroots
     */
    static GetCurrentSyncRoots() {
        if (!StorageProviderSyncRootManager.HasProp("__IStorageProviderSyncRootManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderSyncRootManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageProviderSyncRootManagerStatics.IID)
            StorageProviderSyncRootManager.__IStorageProviderSyncRootManagerStatics := IStorageProviderSyncRootManagerStatics(factoryPtr)
        }

        return StorageProviderSyncRootManager.__IStorageProviderSyncRootManagerStatics.GetCurrentSyncRoots()
    }

    /**
     * Verifies that the operating system supports registering cloud files sync roots.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersyncrootmanager.issupported
     */
    static IsSupported() {
        if (!StorageProviderSyncRootManager.HasProp("__IStorageProviderSyncRootManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderSyncRootManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageProviderSyncRootManagerStatics2.IID)
            StorageProviderSyncRootManager.__IStorageProviderSyncRootManagerStatics2 := IStorageProviderSyncRootManagerStatics2(factoryPtr)
        }

        return StorageProviderSyncRootManager.__IStorageProviderSyncRootManagerStatics2.IsSupported()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
