#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentIndexer.ahk
#Include .\IContentIndexerQueryOperations.ahk
#Include .\IContentIndexerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables Windows apps to make private content searchable by using the system index.
 * @remarks
 * The ContentIndexer class enables apps to push a property bag into the system index which can later be searched quickily by the app or user. The property bag can contain any properties from the shell property system and is available to search instantly after the API call returns.
 * 
 * The properties are defined as string-object key-value pairs, where the keys are standard Windows property names, like [System.Author](/windows/desktop/properties/props-system-author), and the values are [PropertyValue](../windows.foundation/propertyvalue.md) instances. The property must be registered on the system and have isColumn and isInvertedIndex set to true. You can also provide full-text search content by using a stream and content type. This corresponds to running the [IFilter](/windows/desktop/api/filter/nn-filter-ifilter) implementation for the type and indexing the content.
 * 
 * You can query over content by using Advanced Query Syntax ([AQS](/windows/desktop/search/-search-3x-advancedquerysyntax)).
 * 
 * Don't use the index as a primary data store, the index is only a cache of searchable properties. All data in the index must be stored elsewhere in case the cache is lost. Content is separated per app package and per user. A package can't query another package's data, but the operating system can access any data that is pushed in.
 * 
 * For more information on the properties available to use, see the [Windows Property System](/windows/desktop/properties/windows-properties-system).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class ContentIndexer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentIndexer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentIndexer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an existing per-app index or creates a new one, if necessary.
     * @param {HSTRING} indexName 
     * @returns {ContentIndexer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer.getindexer
     */
    static GetIndexerWithName(indexName) {
        if (!ContentIndexer.HasProp("__IContentIndexerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Search.ContentIndexer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentIndexerStatics.IID)
            ContentIndexer.__IContentIndexerStatics := IContentIndexerStatics(factoryPtr)
        }

        return ContentIndexer.__IContentIndexerStatics.GetIndexerWithName(indexName)
    }

    /**
     * Gets the per-app index with the specified name or creates a new one, if necessary.
     * @remarks
     * The app can provide an *indexName* identifier that it can use to partition data for its own queries. This identifier is included as part of the item scope, which means that it's faster to partition based on this scope than by filtering with a property. The approach has the cost of being unable to query easily across multiple scopes.
     * @returns {ContentIndexer} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer.getindexer
     */
    static GetIndexer() {
        if (!ContentIndexer.HasProp("__IContentIndexerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Search.ContentIndexer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentIndexerStatics.IID)
            ContentIndexer.__IContentIndexerStatics := IContentIndexerStatics(factoryPtr)
        }

        return ContentIndexer.__IContentIndexerStatics.GetIndexer1()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the version of the [ContentIndexer](contentindexer.md).
     * @remarks
     * Use the Revision property to track updates to the index.
     * 
     * For example, it's possible that your app may have terminated prior to the index being committed. In many cases the app can resubmit all of its content, but for more sophisticated apps, like mail, where there's a large amount of content, the app can create its own checkpoints and re-index only the missing content. The app can track how much content has been indexed by tracking the revision number. The Revision property is a number that increments based on the indexing operations that the app has initiated.
     * 
     * If the index is reset (which can be caused by either the index getting corrupted or a user manually clearing it out), the revision number will be "0". In this case, the app should re-push all of its data.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer.revision
     * @type {Integer} 
     */
    Revision {
        get => this.get_Revision()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Adds app-defined items with properties and content to the system index.
     * @param {IIndexableContent} indexableContent_ The content properties to index.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer.addasync
     */
    AddAsync(indexableContent_) {
        if (!this.HasProp("__IContentIndexer")) {
            if ((queryResult := this.QueryInterface(IContentIndexer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexer := IContentIndexer(outPtr)
        }

        return this.__IContentIndexer.AddAsync(indexableContent_)
    }

    /**
     * Updates app content and properties in the [ContentIndexer](contentindexer.md).
     * @param {IIndexableContent} indexableContent_ The content properties to update.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer.updateasync
     */
    UpdateAsync(indexableContent_) {
        if (!this.HasProp("__IContentIndexer")) {
            if ((queryResult := this.QueryInterface(IContentIndexer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexer := IContentIndexer(outPtr)
        }

        return this.__IContentIndexer.UpdateAsync(indexableContent_)
    }

    /**
     * Removes the specified app-defined item from the [ContentIndexer](contentindexer.md).
     * @param {HSTRING} contentId The identifier of the item to remove.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer.deleteasync
     */
    DeleteAsync(contentId) {
        if (!this.HasProp("__IContentIndexer")) {
            if ((queryResult := this.QueryInterface(IContentIndexer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexer := IContentIndexer(outPtr)
        }

        return this.__IContentIndexer.DeleteAsync(contentId)
    }

    /**
     * Removes the specified app-defined items from the [ContentIndexer](contentindexer.md).
     * @param {IIterable<HSTRING>} contentIds The identifier of the item to remove.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer.deletemultipleasync
     */
    DeleteMultipleAsync(contentIds) {
        if (!this.HasProp("__IContentIndexer")) {
            if ((queryResult := this.QueryInterface(IContentIndexer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexer := IContentIndexer(outPtr)
        }

        return this.__IContentIndexer.DeleteMultipleAsync(contentIds)
    }

    /**
     * Removes all app-defined items from the [ContentIndexer](contentindexer.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer.deleteallasync
     */
    DeleteAllAsync() {
        if (!this.HasProp("__IContentIndexer")) {
            if ((queryResult := this.QueryInterface(IContentIndexer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexer := IContentIndexer(outPtr)
        }

        return this.__IContentIndexer.DeleteAllAsync()
    }

    /**
     * Gets content properties based on the given content identifier.
     * @param {HSTRING} contentId The identifier for the content properties.
     * @param {IIterable<HSTRING>} propertiesToRetrieve The retrieved properties, based on *contentId*.
     * @returns {IAsyncOperation<IMapView<HSTRING, IInspectable>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer.retrievepropertiesasync
     */
    RetrievePropertiesAsync(contentId, propertiesToRetrieve) {
        if (!this.HasProp("__IContentIndexer")) {
            if ((queryResult := this.QueryInterface(IContentIndexer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexer := IContentIndexer(outPtr)
        }

        return this.__IContentIndexer.RetrievePropertiesAsync(contentId, propertiesToRetrieve)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Revision() {
        if (!this.HasProp("__IContentIndexer")) {
            if ((queryResult := this.QueryInterface(IContentIndexer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexer := IContentIndexer(outPtr)
        }

        return this.__IContentIndexer.get_Revision()
    }

    /**
     * Builds a query with the specified search filter and identifies which properties to retrieve.
     * @remarks
     * Call the [GetPropertiesAsync](contentindexerquery_getpropertiesasync_1672422196.md) method to run the query.
     * @param {HSTRING} searchFilter The Advanced Query Syntax (AQS) filter to apply.
     * @param {IIterable<HSTRING>} propertiesToRetrieve The properties to retrieve, specified by their Windows canonical property names.
     * @param {IIterable<SortEntry>} sortOrder 
     * @param {HSTRING} searchFilterLanguage 
     * @returns {ContentIndexerQuery} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer.createquery
     */
    CreateQueryWithSortOrderAndLanguage(searchFilter, propertiesToRetrieve, sortOrder, searchFilterLanguage) {
        if (!this.HasProp("__IContentIndexerQueryOperations")) {
            if ((queryResult := this.QueryInterface(IContentIndexerQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexerQueryOperations := IContentIndexerQueryOperations(outPtr)
        }

        return this.__IContentIndexerQueryOperations.CreateQueryWithSortOrderAndLanguage(searchFilter, propertiesToRetrieve, sortOrder, searchFilterLanguage)
    }

    /**
     * Builds a query with the specified search filter, sort order, filter language, and identifies which properties to retrieve.
     * @param {HSTRING} searchFilter The Advanced Query Syntax (AQS) filter to apply.
     * @param {IIterable<HSTRING>} propertiesToRetrieve The properties to retrieve, specified by their Windows canonical property names.
     * @param {IIterable<SortEntry>} sortOrder The sort order for the filtered results.
     * @returns {ContentIndexerQuery} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer.createquery
     */
    CreateQueryWithSortOrder(searchFilter, propertiesToRetrieve, sortOrder) {
        if (!this.HasProp("__IContentIndexerQueryOperations")) {
            if ((queryResult := this.QueryInterface(IContentIndexerQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexerQueryOperations := IContentIndexerQueryOperations(outPtr)
        }

        return this.__IContentIndexerQueryOperations.CreateQueryWithSortOrder(searchFilter, propertiesToRetrieve, sortOrder)
    }

    /**
     * Builds a query with the specified search filter, sort order, and identifies which properties to retrieve.
     * @param {HSTRING} searchFilter The Advanced Query Syntax (AQS) filter.
     * @param {IIterable<HSTRING>} propertiesToRetrieve The properties to retrieve, specified by their Windows canonical property names.
     * @returns {ContentIndexerQuery} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.contentindexer.createquery
     */
    CreateQuery(searchFilter, propertiesToRetrieve) {
        if (!this.HasProp("__IContentIndexerQueryOperations")) {
            if ((queryResult := this.QueryInterface(IContentIndexerQueryOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentIndexerQueryOperations := IContentIndexerQueryOperations(outPtr)
        }

        return this.__IContentIndexerQueryOperations.CreateQuery2(searchFilter, propertiesToRetrieve)
    }

;@endregion Instance Methods
}
