#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderSearchQueryOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides options for a search query.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchqueryoptions
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderSearchQueryOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderSearchQueryOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderSearchQueryOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Provides the original user query string entered in the UI.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchqueryoptions.userquery
     * @type {HSTRING} 
     */
    UserQuery {
        get => this.get_UserQuery()
    }

    /**
     * Gets the language of the search query.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchqueryoptions.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets the order that the results should be returned in, using rank as the default sort order.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchqueryoptions.sortorder
     * @type {IVectorView<SortEntry>} 
     */
    SortOrder {
        get => this.get_SortOrder()
    }

    /**
     * Gets the programmatic query string for the search query which can include additional conditions not directly entered by the user.
     * @remarks
     * This query will be in the AQS format, see [Advanced Query Syntax](/windows/win32/lwef/-search-2x-wds-aqsreference).
     * 
     * If a service can not preform the search with the given conditions, it should not return results.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchqueryoptions.programmaticquery
     * @type {HSTRING} 
     */
    ProgrammaticQuery {
        get => this.get_ProgrammaticQuery()
    }

    /**
     * Gets the maximum number of results to return.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchqueryoptions.maxresults
     * @type {Integer} 
     */
    MaxResults {
        get => this.get_MaxResults()
    }

    /**
     * Gets the folder to which the search query should be scoped.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchqueryoptions.folderscope
     * @type {HSTRING} 
     */
    FolderScope {
        get => this.get_FolderScope()
    }

    /**
     * Gets the unique identifier for the query. This is a telemetry ID provided by the caller that allows the request to be tracked across the client and service for reliability proposes.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchqueryoptions.queryid
     * @type {HSTRING} 
     */
    QueryId {
        get => this.get_QueryId()
    }

    /**
     * Gets the vector of additional properties to return for each query result. These are canonical property names from the [Windows Property System](/windows/desktop/properties/windows-properties-system) (e.g. **System.FileName** or **System.DateModified**).
     * @remarks
     * The set of requested properties may vary depending on the [SuggestionKind](storageprovidersuggestionsqueryoptions_suggestionskind.md) assigned to the query, or the OS version. Unsupported or unrecognized properties should be ignored by the provider.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchqueryoptions.propertiestofetch
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
     * @returns {HSTRING} 
     */
    get_UserQuery() {
        if (!this.HasProp("__IStorageProviderSearchQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchQueryOptions := IStorageProviderSearchQueryOptions(outPtr)
        }

        return this.__IStorageProviderSearchQueryOptions.get_UserQuery()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__IStorageProviderSearchQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchQueryOptions := IStorageProviderSearchQueryOptions(outPtr)
        }

        return this.__IStorageProviderSearchQueryOptions.get_Language()
    }

    /**
     * 
     * @returns {IVectorView<SortEntry>} 
     */
    get_SortOrder() {
        if (!this.HasProp("__IStorageProviderSearchQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchQueryOptions := IStorageProviderSearchQueryOptions(outPtr)
        }

        return this.__IStorageProviderSearchQueryOptions.get_SortOrder()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProgrammaticQuery() {
        if (!this.HasProp("__IStorageProviderSearchQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchQueryOptions := IStorageProviderSearchQueryOptions(outPtr)
        }

        return this.__IStorageProviderSearchQueryOptions.get_ProgrammaticQuery()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxResults() {
        if (!this.HasProp("__IStorageProviderSearchQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchQueryOptions := IStorageProviderSearchQueryOptions(outPtr)
        }

        return this.__IStorageProviderSearchQueryOptions.get_MaxResults()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FolderScope() {
        if (!this.HasProp("__IStorageProviderSearchQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchQueryOptions := IStorageProviderSearchQueryOptions(outPtr)
        }

        return this.__IStorageProviderSearchQueryOptions.get_FolderScope()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryId() {
        if (!this.HasProp("__IStorageProviderSearchQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchQueryOptions := IStorageProviderSearchQueryOptions(outPtr)
        }

        return this.__IStorageProviderSearchQueryOptions.get_QueryId()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_PropertiesToFetch() {
        if (!this.HasProp("__IStorageProviderSearchQueryOptions")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchQueryOptions := IStorageProviderSearchQueryOptions(outPtr)
        }

        return this.__IStorageProviderSearchQueryOptions.get_PropertiesToFetch()
    }

;@endregion Instance Methods
}
