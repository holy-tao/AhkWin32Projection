#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentIndexerQuery.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a query for content properties in the [ContentIndexer](contentindexer.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexerquery
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class ContentIndexerQuery extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentIndexerQuery

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentIndexerQuery.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [StorageFolder](storagefolderqueryresult.md) representation of the app-provided items in the [ContentIndexer](contentindexer.md) query.
     * @remarks
     * The [StorageFolder](../windows.storage/storagefolder.md) returned by the QueryFolder property is read-only. You can't change the properties of the folder or of the files that it contains.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexerquery.queryfolder
     * @type {StorageFolder} 
     */
    QueryFolder {
        get => this.get_QueryFolder()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the number of items in the search results.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexerquery.getcountasync
     */
    GetCountAsync() {
        if (!this.HasProp("__IContentIndexerQuery")) {
            if ((queryResult := this.QueryInterface(IContentIndexerQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexerQuery := IContentIndexerQuery(outPtr)
        }

        return this.__IContentIndexerQuery.GetCountAsync()
    }

    /**
     * Retrieves a collection of property sets for an app, where the property sets are key-value pairs.
     * @returns {IAsyncOperation<IVectorView<IMapView<HSTRING, IInspectable>>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexerquery.getpropertiesasync
     */
    GetPropertiesAsync() {
        if (!this.HasProp("__IContentIndexerQuery")) {
            if ((queryResult := this.QueryInterface(IContentIndexerQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexerQuery := IContentIndexerQuery(outPtr)
        }

        return this.__IContentIndexerQuery.GetPropertiesAsync()
    }

    /**
     * Retrieves a collection of property sets for an app, where the property sets are key-value pairs.
     * @param {Integer} startIndex 
     * @param {Integer} maxItems 
     * @returns {IAsyncOperation<IVectorView<IMapView<HSTRING, IInspectable>>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexerquery.getpropertiesasync
     */
    GetPropertiesRangeAsync(startIndex, maxItems) {
        if (!this.HasProp("__IContentIndexerQuery")) {
            if ((queryResult := this.QueryInterface(IContentIndexerQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexerQuery := IContentIndexerQuery(outPtr)
        }

        return this.__IContentIndexerQuery.GetPropertiesRangeAsync(startIndex, maxItems)
    }

    /**
     * Runs the query on the app's indexed content properties.
     * @returns {IAsyncOperation<IVectorView<IIndexableContent>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexerquery.getasync
     */
    GetAsync() {
        if (!this.HasProp("__IContentIndexerQuery")) {
            if ((queryResult := this.QueryInterface(IContentIndexerQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexerQuery := IContentIndexerQuery(outPtr)
        }

        return this.__IContentIndexerQuery.GetAsync()
    }

    /**
     * Runs the query on the app's indexed content properties.
     * @param {Integer} startIndex 
     * @param {Integer} maxItems 
     * @returns {IAsyncOperation<IVectorView<IIndexableContent>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexerquery.getasync
     */
    GetRangeAsync(startIndex, maxItems) {
        if (!this.HasProp("__IContentIndexerQuery")) {
            if ((queryResult := this.QueryInterface(IContentIndexerQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexerQuery := IContentIndexerQuery(outPtr)
        }

        return this.__IContentIndexerQuery.GetRangeAsync(startIndex, maxItems)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_QueryFolder() {
        if (!this.HasProp("__IContentIndexerQuery")) {
            if ((queryResult := this.QueryInterface(IContentIndexerQuery.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexerQuery := IContentIndexerQuery(outPtr)
        }

        return this.__IContentIndexerQuery.get_QueryFolder()
    }

;@endregion Instance Methods
}
