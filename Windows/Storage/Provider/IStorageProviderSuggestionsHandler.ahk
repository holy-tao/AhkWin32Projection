#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StorageProviderQueryResultSet.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\StorageProviderSuggestionResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * This interface is implemented by a cloud files provider to enable the system to query for suggested files.
  * 
  * > [!IMPORTANT]
  * > The **Windows.Storage.Provider.IStorageProviderSuggestionsHandler** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersuggestionshandler
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderSuggestionsHandler extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderSuggestionsHandler
     * @type {Guid}
     */
    static IID => Guid("{aff493f6-e1fd-5d03-b480-f1849c83ef4a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSuggestions", "Add", "Remove", "GetDetails", "ReportUsage"]

    /**
     * Executes the suggestions query given the parameters in the options object and returns a result set.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.IStorageProviderSuggestionsHandler** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * The returned [StorageProviderQueryResultSet](storageproviderqueryresultset.md) is expected to return [StorageProviderSuggestionResult](storageprovidersuggestionresult.md) objects from its [GetResults](storageproviderqueryresultset_getresults_732303200.md) method.
     * 
     * If the [SuggestionsKind](storageprovidersuggestionsqueryoptions_suggestionskind.md) passed in the options object is not supported by the cloud provider, they should return a [StorageProviderQueryResultSet](storageproviderqueryresultset.md) object with the [Status](storageproviderqueryresultset_status.md) set to **QueryNotSupported**.
     * 
     * To support offline scenarios and improve reliability, the cloud storage provider should cache the results of any requests made to backing services and return cached results when appropriate.
     * @param {StorageProviderSuggestionsQueryOptions} options The options used to customize the suggestions query.
     * @returns {StorageProviderQueryResultSet} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersuggestionshandler.getsuggestions
     */
    GetSuggestions(options) {
        result := ComCall(6, this, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProviderQueryResultSet(result_)
    }

    /**
     * Adds an item to the cloud storage provider's suggestions of the given result kind.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.IStorageProviderSuggestionsHandler** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * After **Add** is successfully called for an item, the cloud storage provider should ensure that the item is eligible to be returned in future calls to [GetSuggestions](istorageprovidersuggestionshandler_getsuggestions_613374749.md) for that result kind.
     * 
     * To support offline scenarios and improve reliability, the cloud storage provider should ensure that added suggestions are cached locally and synchronized with any backing service once service connectivity is restored.
     * 
     * If the given [StorageProviderResultKind](storageproviderresultkind.md) is not supported by the cloud provider, they should no-op the API call.
     * 
     * The given remote file ID will be the same value as the [System.StorageProviderFileIdentifier](windows/desktop/properties/props-system-storageproviderfileidentifier) property for the item. The ID may not correspond to an item returned by a previous call to [GetSuggestions](istorageprovidersuggestionshandler_getsuggestions_613374749.md). This can occur if the user interacts with an item in the provider's sync root (for example, pinning a new item to Favorites).
     * @param {Integer} kind The kind of item to add.
     * @param {HSTRING} remoteFileId The remote file ID of the item to add. See [StorageProviderSuggestionResult.RemoteFileId](storageprovidersuggestionresult_remotefileid.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersuggestionshandler.add
     */
    Add(kind, remoteFileId) {
        if(remoteFileId is String) {
            pin := HSTRING.Create(remoteFileId)
            remoteFileId := pin.Value
        }
        remoteFileId := remoteFileId is Win32Handle ? NumGet(remoteFileId, "ptr") : remoteFileId

        result := ComCall(7, this, "int", kind, "ptr", remoteFileId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes an item from the cloud storage provider's suggestions of the given result kind.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.IStorageProviderSuggestionsHandler** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * After **Remove** is successfully called for an item, the cloud storage provider should ensure that the item is never returned in future calls to [GetSuggestions](istorageprovidersuggestionshandler_getsuggestions_613374749.md) for that result kind.
     * 
     * To support offline scenarios and improve reliability, the cloud storage provider should ensure that removed suggestions are cached locally and synchronized with any backing service once service connectivity is restored.
     * 
     * If the given [StorageProviderResultKind](storageproviderresultkind.md) is not supported by the cloud provider, they should no-op the API call.
     * 
     * The given remote file ID will be the same value as the [System.StorageProviderFileIdentifier](windows/desktop/properties/props-system-storageproviderfileidentifier) property for the item. The ID may not correspond to an item returned by a previous call to [GetSuggestions](istorageprovidersuggestionshandler_getsuggestions_613374749.md). This can occur if the user interacts with an item in the provider's sync root (for example, hiding an item located in the provider's sync root that is already present in the local recents list).
     * @param {Integer} kind The kind of item to remove.
     * @param {HSTRING} remoteFileId The remote file ID of the item to remove. See [StorageProviderSuggestionResult.RemoteFileId](storageprovidersuggestionresult_remotefileid.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersuggestionshandler.remove
     */
    Remove(kind, remoteFileId) {
        if(remoteFileId is String) {
            pin := HSTRING.Create(remoteFileId)
            remoteFileId := pin.Value
        }
        remoteFileId := remoteFileId is Win32Handle ? NumGet(remoteFileId, "ptr") : remoteFileId

        result := ComCall(8, this, "int", kind, "ptr", remoteFileId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Get additional metadata for a single file suggestion.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.IStorageProviderSuggestionsHandler** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @param {HSTRING} remoteFileId The remote file ID of the file. See [StorageProviderSuggestionResult.RemoteFileId](storageprovidersuggestionresult_remotefileid.md).
     * @param {Integer} propertiesToFetch_length 
     * @param {Pointer<HSTRING>} propertiesToFetch The properties to fetch.
     * @param {HSTRING} queryId The query ID.
     * @returns {StorageProviderSuggestionResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersuggestionshandler.getdetails
     */
    GetDetails(remoteFileId, propertiesToFetch_length, propertiesToFetch, queryId) {
        if(remoteFileId is String) {
            pin := HSTRING.Create(remoteFileId)
            remoteFileId := pin.Value
        }
        remoteFileId := remoteFileId is Win32Handle ? NumGet(remoteFileId, "ptr") : remoteFileId
        if(queryId is String) {
            pin := HSTRING.Create(queryId)
            queryId := pin.Value
        }
        queryId := queryId is Win32Handle ? NumGet(queryId, "ptr") : queryId

        result := ComCall(9, this, "ptr", remoteFileId, "uint", propertiesToFetch_length, "ptr", propertiesToFetch, "ptr", queryId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProviderSuggestionResult(result_)
    }

    /**
     * Sends feedback on usage of a file or folder to the system.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.IStorageProviderSuggestionsHandler** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @param {Integer} resultUsageKind The kind of usage to report.
     * @param {HSTRING} remoteFileId The remote file ID of the file or folder. See [StorageProviderSuggestionResult.RemoteFileId](storageprovidersuggestionresult_remotefileid.md).
     * @param {HSTRING} resultId The result ID of the usage to report. See [StorageProviderSuggestionResult.ResultId](storageprovidersuggestionresult_resultid.md).
     * @param {TimeSpan} latency The time taken to perform the operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.istorageprovidersuggestionshandler.reportusage
     */
    ReportUsage(resultUsageKind, remoteFileId, resultId, latency) {
        if(remoteFileId is String) {
            pin := HSTRING.Create(remoteFileId)
            remoteFileId := pin.Value
        }
        remoteFileId := remoteFileId is Win32Handle ? NumGet(remoteFileId, "ptr") : remoteFileId
        if(resultId is String) {
            pin := HSTRING.Create(resultId)
            resultId := pin.Value
        }
        resultId := resultId is Win32Handle ? NumGet(resultId, "ptr") : resultId

        result := ComCall(10, this, "int", resultUsageKind, "ptr", remoteFileId, "ptr", resultId, "ptr", latency, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
