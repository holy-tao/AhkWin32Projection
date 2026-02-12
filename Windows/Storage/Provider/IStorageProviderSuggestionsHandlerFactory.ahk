#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IStorageProviderSuggestionsHandler.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * This interface is implemented by a cloud files provider to create a suggestions handler that can be used to query for suggested files from the provider.
  * 
  * > [!IMPORTANT]
  * > The **Windows.Storage.Provider.IStorageProviderSuggestionsHandlerFactory** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * The suggestions handler factory is activated in the cloud files provider process as a local server and creates a suggestions handler for a given sync root identifier.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersuggestionshandlerfactory
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderSuggestionsHandlerFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderSuggestionsHandlerFactory
     * @type {Guid}
     */
    static IID => Guid("{dc7b35d8-a25b-58a3-ace7-b3543106a2aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSuggestionsHandler"]

    /**
     * Creates a suggestions handler for a given sync root identifier.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.IStorageProviderSuggestionsHandlerFactory** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @param {HSTRING} cloudProviderId The sync root identifier for the cloud files provider, see [SyncRootId](./storageprovidersyncrootinfo_id.md).
     * @returns {IStorageProviderSuggestionsHandler} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersuggestionshandlerfactory.createsuggestionshandler
     */
    CreateSuggestionsHandler(cloudProviderId) {
        if(cloudProviderId is String) {
            pin := HSTRING.Create(cloudProviderId)
            cloudProviderId := pin.Value
        }
        cloudProviderId := cloudProviderId is Win32Handle ? NumGet(cloudProviderId, "ptr") : cloudProviderId

        result := ComCall(6, this, "ptr", cloudProviderId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStorageProviderSuggestionsHandler(result_)
    }
}
