#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderItemPropertiesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the properties of a Cloud Storage Provider storage item (like a file or folder).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovideritemproperties
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderItemProperties extends IInspectable {
;@region Static Methods
    /**
     * Sets custom property values of a storage item.
     * @param {IStorageItem} item The storage item.
     * @param {IIterable<StorageProviderItemProperty>} itemProperties An iterable list of the [StorageProviderItemProperty](StorageProviderItemProperty.md) states for the storage item.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovideritemproperties.setasync
     */
    static SetAsync(item, itemProperties) {
        if (!StorageProviderItemProperties.HasProp("__IStorageProviderItemPropertiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderItemProperties")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStorageProviderItemPropertiesStatics.IID)
            StorageProviderItemProperties.__IStorageProviderItemPropertiesStatics := IStorageProviderItemPropertiesStatics(factoryPtr)
        }

        return StorageProviderItemProperties.__IStorageProviderItemPropertiesStatics.SetAsync(item, itemProperties)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
