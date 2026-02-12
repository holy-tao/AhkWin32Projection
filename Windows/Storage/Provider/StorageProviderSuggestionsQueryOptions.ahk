#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderSuggestionsQueryOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides options for a suggestions query.
  * 
  * > [!IMPORTANT]
  * > The **Windows.Storage.Provider.StorageProviderSuggestionsQueryOptions** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersuggestionsqueryoptions
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderSuggestionsQueryOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderSuggestionsQueryOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderSuggestionsQueryOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the kind of suggestions to retrieve as a [StorageProviderResultKind](../windows.storage.provider/storageproviderresultkind.md) value.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.StorageProviderSuggestionsQueryOptions** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersuggestionsqueryoptions.suggestionskind
     * @type {Integer} 
     */
    SuggestionsKind {
        get => this.get_SuggestionsKind()
    }

    /**
     * Gets the remote file ID for the file or folder for which suggestions are being requested.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.StorageProviderSuggestionsQueryOptions** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * This property is optional and will only be specified for suggestion queries related to a specific item.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersuggestionsqueryoptions.remotefileid
     * @type {HSTRING} 
     */
    RemoteFileId {
        get => this.get_RemoteFileId()
    }

    /**
     * Gets the maximum number of results to return.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.StorageProviderSuggestionsQueryOptions** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersuggestionsqueryoptions.maxresults
     * @type {Integer} 
     */
    MaxResults {
        get => this.get_MaxResults()
    }

    /**
     * Gets the unique identifier for the query. This is a telemetry ID provided by the caller that allows the request to be tracked across the client and service for reliability proposes.
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.StorageProviderSuggestionsQueryOptions** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersuggestionsqueryoptions.queryid
     * @type {HSTRING} 
     */
    QueryId {
        get => this.get_QueryId()
    }

    /**
     * Gets the vector of additional properties to return for each query result. These are canonical property names from the [Windows Property System](/windows/desktop/properties/windows-properties-system) (e.g. **System.FileName** or **System.DateModified**).
     * 
     * > [!IMPORTANT]
     * > The **Windows.Storage.Provider.StorageProviderSuggestionsQueryOptions** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
     * @remarks
     * The set of requested properties may vary depending on the [SuggestionKind](storageprovidersuggestionsqueryoptions_suggestionskind.md) assigned to the query, or the OS version. Unsupported or unrecognized properties should be ignored by the provider.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersuggestionsqueryoptions.propertiestofetch
     * @type {IVectorView<HSTRING>} 
     */
    PropertiesToFetch {
        get => this.get_PropertiesToFetch()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SuggestionsKind() {
        if (!this.HasProp("__IStorageProviderSuggestionsQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSuggestionsQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSuggestionsQueryOptions := IStorageProviderSuggestionsQueryOptions(outPtr)
        }

        return this.__IStorageProviderSuggestionsQueryOptions.get_SuggestionsKind()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteFileId() {
        if (!this.HasProp("__IStorageProviderSuggestionsQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSuggestionsQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSuggestionsQueryOptions := IStorageProviderSuggestionsQueryOptions(outPtr)
        }

        return this.__IStorageProviderSuggestionsQueryOptions.get_RemoteFileId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxResults() {
        if (!this.HasProp("__IStorageProviderSuggestionsQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSuggestionsQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSuggestionsQueryOptions := IStorageProviderSuggestionsQueryOptions(outPtr)
        }

        return this.__IStorageProviderSuggestionsQueryOptions.get_MaxResults()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryId() {
        if (!this.HasProp("__IStorageProviderSuggestionsQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSuggestionsQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSuggestionsQueryOptions := IStorageProviderSuggestionsQueryOptions(outPtr)
        }

        return this.__IStorageProviderSuggestionsQueryOptions.get_QueryId()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_PropertiesToFetch() {
        if (!this.HasProp("__IStorageProviderSuggestionsQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSuggestionsQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSuggestionsQueryOptions := IStorageProviderSuggestionsQueryOptions(outPtr)
        }

        return this.__IStorageProviderSuggestionsQueryOptions.get_PropertiesToFetch()
    }

;@endregion Instance Methods
}
