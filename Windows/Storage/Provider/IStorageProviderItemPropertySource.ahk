#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IIterable.ahk
#Include .\StorageProviderItemProperty.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to storage provider item properties from the sync root.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovideritempropertysource
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderItemPropertySource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderItemPropertySource
     * @type {Guid}
     */
    static IID => Guid("{8f6f9c3e-f632-4a9b-8d99-d2d7a11df56a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemProperties"]

    /**
     * Gets a list of item properties for a storage provider.
     * @param {HSTRING} itemPath A path to the storage item.
     * @returns {IIterable<StorageProviderItemProperty>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovideritempropertysource.getitemproperties
     */
    GetItemProperties(itemPath) {
        if(itemPath is String) {
            pin := HSTRING.Create(itemPath)
            itemPath := pin.Value
        }
        itemPath := itemPath is Win32Handle ? NumGet(itemPath, "ptr") : itemPath

        result := ComCall(6, this, "ptr", itemPath, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(StorageProviderItemProperty, result_)
    }
}
