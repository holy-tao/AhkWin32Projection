#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageProviderSearchResult.ahk
#Include .\IStorageProviderQueryResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * The class that the storage provider will use to return an individual search result.
 * @remarks
 * This object will implement marshal by value to optimize RPC calls.
 * 
 * Includes the local [FilePath](storageprovidersearchresult_filepath.md) of the search result and a [RemoteFileId](storageprovidersearchresult_remotefileid.md). Any properties requested in the query options are also included.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchresult
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class StorageProviderSearchResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageProviderSearchResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageProviderSearchResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the match score for the search result. This indicates how well the search result matches the search query.
     * @remarks
     * This property allows for merging and sorting of results with local results provided by system indexer.
     * 
     * The range of values is `0` to `1`. A value of `1.0` is a perfect match.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchresult.matchscore
     * @type {Float} 
     */
    MatchScore {
        get => this.get_MatchScore()
        set => this.put_MatchScore(value)
    }

    /**
     * Gets or sets the kind of match for the search result. This indicates why the entry is included, e.g. a **Lexical** or **Semantic** match.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchresult.matchkind
     * @type {Integer} 
     */
    MatchKind {
        get => this.get_MatchKind()
        set => this.put_MatchKind(value)
    }

    /**
     * Gets or sets an optional name identifying the most impactful property contributing to [MatchScore](storageprovidersearchresult_matchscore.md) for this result.
     * @remarks
     * This is a canonical property name from the Windows property schema, (i.e. **System.DisplayName**).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchresult.matchedpropertyname
     * @type {HSTRING} 
     */
    MatchedPropertyName {
        get => this.get_MatchedPropertyName()
        set => this.put_MatchedPropertyName(value)
    }

    /**
     * Gets or sets the kind of the search result.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchresult.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

    /**
     * Gets or sets a unique identifier for the search query result that will be passed to the [ReportUsage](istorageprovidersearchhandler_reportusage_1684874227.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchresult.resultid
     * @type {HSTRING} 
     */
    ResultId {
        get => this.get_ResultId()
        set => this.put_ResultId(value)
    }

    /**
     * Gets or sets the remote file ID of the search result.
     * @remarks
     * This identifier is expected to be unique across all query results and items in the provider's sync root.
     * 
     * The cloud storage provider should set this property to the same value as the [System.StorageProviderFileIdentifier](/windows/desktop/properties/props-system-storageproviderfileidentifier) property for the item. This ensures a consistent file identifier across query results and items in the provider's sync root.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchresult.remotefileid
     * @type {HSTRING} 
     */
    RemoteFileId {
        get => this.get_RemoteFileId()
        set => this.put_RemoteFileId(value)
    }

    /**
     * Gets or sets the local file path of the search result.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchresult.filepath
     * @type {HSTRING} 
     */
    FilePath {
        get => this.get_FilePath()
        set => this.put_FilePath(value)
    }

    /**
     * Gets the additional properties that were requested in [StorageProviderSearchQueryOptions.PropertiesToFetch](storageprovidersearchqueryoptions_propertiestofetch.md) for the search result.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.provider.storageprovidersearchresult.requestedproperties
     * @type {PropertySet} 
     */
    RequestedProperties {
        get => this.get_RequestedProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [StorageProviderSearchResult](storageprovidersearchresult.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Provider.StorageProviderSearchResult")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MatchScore() {
        if (!this.HasProp("__IStorageProviderSearchResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchResult := IStorageProviderSearchResult(outPtr)
        }

        return this.__IStorageProviderSearchResult.get_MatchScore()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MatchScore(value) {
        if (!this.HasProp("__IStorageProviderSearchResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchResult := IStorageProviderSearchResult(outPtr)
        }

        return this.__IStorageProviderSearchResult.put_MatchScore(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MatchKind() {
        if (!this.HasProp("__IStorageProviderSearchResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchResult := IStorageProviderSearchResult(outPtr)
        }

        return this.__IStorageProviderSearchResult.get_MatchKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MatchKind(value) {
        if (!this.HasProp("__IStorageProviderSearchResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchResult := IStorageProviderSearchResult(outPtr)
        }

        return this.__IStorageProviderSearchResult.put_MatchKind(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MatchedPropertyName() {
        if (!this.HasProp("__IStorageProviderSearchResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchResult := IStorageProviderSearchResult(outPtr)
        }

        return this.__IStorageProviderSearchResult.get_MatchedPropertyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MatchedPropertyName(value) {
        if (!this.HasProp("__IStorageProviderSearchResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderSearchResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderSearchResult := IStorageProviderSearchResult(outPtr)
        }

        return this.__IStorageProviderSearchResult.put_MatchedPropertyName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.put_Kind(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ResultId() {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.get_ResultId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ResultId(value) {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.put_ResultId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteFileId() {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.get_RemoteFileId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteFileId(value) {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.put_RemoteFileId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FilePath() {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.get_FilePath()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FilePath(value) {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.put_FilePath(value)
    }

    /**
     * 
     * @returns {PropertySet} 
     */
    get_RequestedProperties() {
        if (!this.HasProp("__IStorageProviderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageProviderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageProviderQueryResult := IStorageProviderQueryResult(outPtr)
        }

        return this.__IStorageProviderQueryResult.get_RequestedProperties()
    }

;@endregion Instance Methods
}
