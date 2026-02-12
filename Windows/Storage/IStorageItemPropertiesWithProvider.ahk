#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\StorageProvider.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to common and content properties on storage items from a particular provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitempropertieswithprovider
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageItemPropertiesWithProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItemPropertiesWithProvider
     * @type {Guid}
     */
    static IID => Guid("{861bf39b-6368-4dee-b40e-74684a5ce714}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Provider"]

    /**
     * Gets the [StorageProvider](storageprovider.md) object that contains info about the service that stores the current storage item.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitempropertieswithprovider.provider
     * @type {StorageProvider} 
     */
    Provider {
        get => this.get_Provider()
    }

    /**
     * 
     * @returns {StorageProvider} 
     */
    get_Provider() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProvider(value)
    }
}
