#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IStorageProviderSearchHandler.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * This interface is implemented by a cloud files provider such as OneDrive. It is used to create a search handler that can be used to search for files and folders in the cloud files provider.
 * @remarks
 * The search handler factory is activated in the cloud files provider process as a local server and creates a search handler for a given sync root identifier.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersearchhandlerfactory
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderSearchHandlerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderSearchHandlerFactory
     * @type {Guid}
     */
    static IID => Guid("{b0dcad80-f3f5-516b-8ace-4e77022c9598}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSearchHandler"]

    /**
     * Creates a search handler for a given sync root identifier.
     * @param {HSTRING} cloudProviderId The sync root identifier for the cloud files provider, see [SyncRootId](./storageprovidersyncrootinfo_id.md).
     * @returns {IStorageProviderSearchHandler} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersearchhandlerfactory.createsearchhandler
     */
    CreateSearchHandler(cloudProviderId) {
        if(cloudProviderId is String) {
            pin := HSTRING.Create(cloudProviderId)
            cloudProviderId := pin.Value
        }
        cloudProviderId := cloudProviderId is Win32Handle ? NumGet(cloudProviderId, "ptr") : cloudProviderId

        result := ComCall(6, this, "ptr", cloudProviderId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageProviderSearchHandler(result_)
    }
}
