#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IQueryOptions.ahk
#Include .\IQueryOptionsWithProviderFilter.ahk
#Include .\IQueryOptionsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the parameters of a search query for enumerating the contents of storage folders.
 * @remarks
 * You can create a file query for any folder you have access to and that you can get as a [StorageFolder](../windows.storage/storagefolder.md).
 * 
 * You can use QueryOptions and [CreateFileQueryWithOptions](../windows.storage/storagefolder_createfilequerywithoptions_2038131323.md) to create an indexed backed file query that lets you get properties that rely on another app's property handler.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class QueryOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IQueryOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IQueryOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [QueryOptions](queryoptions.md) class for enumerating files and initializes it with values provided by the specified [CommonFileQuery](commonfilequery.md) and an optional file type filter that determines which files to include in query results.
     * @param {Integer} query An enumeration value that specifies the search parameters to use to query files.
     * 
     * The [CommonFileQuery](commonfilequery.md) enumeration provides search parameters for several common types of file queries. For example, deep queries that retrieve all the files in the folder where the query is created or shallow queries that retrieve only the files in the top-level of the folder. The enumeration also determines how query results are sorted.
     * @param {IIterable<HSTRING>} fileTypeFilter An array of file types to be included in the query results. To include all file types, supply null, an empty array, or an array containing a single entry of "*".
     * @returns {QueryOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.#ctor
     */
    static CreateCommonFileQuery(query, fileTypeFilter) {
        if (!QueryOptions.HasProp("__IQueryOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Search.QueryOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IQueryOptionsFactory.IID)
            QueryOptions.__IQueryOptionsFactory := IQueryOptionsFactory(factoryPtr)
        }

        return QueryOptions.__IQueryOptionsFactory.CreateCommonFileQuery(query, fileTypeFilter)
    }

    /**
     * Creates an instance of the [QueryOptions](queryoptions.md) class for enumerating subfolders and initializes it with values based on the specified [CommonFolderQuery](commonfolderquery.md).
     * @param {Integer} query An enumeration value that specifies how to group the contents of the folder where the query is created into subfolders to enumerate. The subfolders that are retrieved using a [CommonFolderQuery](commonfolderquery.md) can be actual file system folders or virtual folders that represent groups of files (which are determined by the [CommonFolderQuery](commonfolderquery.md) value). For example, the [CommonFolderQuery.GroupByArtist](commonfolderquery.md) uses the [Artist](../windows.storage.fileproperties/musicproperties_artist.md) of the files in the folder (and its subfolders) to group files, creating one virtual folder (or file group) for each artist.
     * @returns {QueryOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.#ctor
     */
    static CreateCommonFolderQuery(query) {
        if (!QueryOptions.HasProp("__IQueryOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Storage.Search.QueryOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IQueryOptionsFactory.IID)
            QueryOptions.__IQueryOptionsFactory := IQueryOptionsFactory(factoryPtr)
        }

        return QueryOptions.__IQueryOptionsFactory.CreateCommonFolderQuery(query)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a list of file name extensions used to filter the search results. If the list is empty, the results include all file types.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.filetypefilter
     * @type {IVector<HSTRING>} 
     */
    FileTypeFilter {
        get => this.get_FileTypeFilter()
    }

    /**
     * Indicates whether the search query should produce a shallow view of the folder contents or a deep recursive view of all files and subfolder.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.folderdepth
     * @type {Integer} 
     */
    FolderDepth {
        get => this.get_FolderDepth()
        set => this.put_FolderDepth(value)
    }

    /**
     * Gets or sets an application-defined Advanced Query Syntax (AQS) string for filtering files by keywords or properties. This property is combined with the [UserSearchFilter](queryoptions_usersearchfilter.md) to create the query's search filter.
     * @remarks
     * The application search filter should always use locale-invariant Advanced Query Syntax (AQS) syntax (such as [System.FileName](/windows/desktop/properties/props-system-filename) instead of "filename" (because the term "filename" that is associated with the property [System.FileName](/windows/desktop/properties/props-system-filename) is localized differently in different languages). This will ensure that the query returns the expected results on systems with non-English locales. Windows builds the search query by combining this property with the [UserSearchFilter](queryoptions_usersearchfilter.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.applicationsearchfilter
     * @type {HSTRING} 
     */
    ApplicationSearchFilter {
        get => this.get_ApplicationSearchFilter()
        set => this.put_ApplicationSearchFilter(value)
    }

    /**
     * Gets or sets a user-defined Advanced Query Syntax (AQS) string for filtering files by keywords or properties. This property is combined with the [ApplicationSearchFilter](queryoptions_applicationsearchfilter.md) to create the query's search filter.
     * @remarks
     * Windows builds the search query by combining this property with the [ApplicationSearchFilter](queryoptions_applicationsearchfilter.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.usersearchfilter
     * @type {HSTRING} 
     */
    UserSearchFilter {
        get => this.get_UserSearchFilter()
        set => this.put_UserSearchFilter(value)
    }

    /**
     * Gets or sets the Internet Engineering Task Force (IETF) language tag (BCP47 standard) that identifies the language associated with the query. This determines the language-specific algorithm used by the system to break the query into individual search tokens.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets or sets a value that specifies whether the system index or the file system is used to retrieve query results. The indexer can retrieve results faster but is not available in all file locations.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.indexeroption
     * @type {Integer} 
     */
    IndexerOption {
        get => this.get_IndexerOption()
        set => this.put_IndexerOption(value)
    }

    /**
     * Gets the list of [SortEntry](sortentry.md) structures that specify how to sort content (like files and subfolders) in query results. Use this list to customize how query results are sorted.
     * @remarks
     * If the folder being queried is not in a library or in the HomeGroup folder, SortOrder only supports entries based on the [System.ItemNameDisplay](/windows/desktop/properties/props-system-itemnamedisplay) (**PKEY_ItemNameDisplay**), [System.Search.Rank](/windows/desktop/properties/props-system-search-rank) (**PKEY_Search_Rank**), or [System.DateModified](/windows/desktop/properties/props-system-datemodified) (**PKEY_DateModified**) properties; SortOrder entries based on any other properties will return **E_INVALIDARG**.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.sortorder
     * @type {IVector<SortEntry>} 
     */
    SortOrder {
        get => this.get_SortOrder()
    }

    /**
     * Gets the name of the property used to group query results if the [QueryOptions](queryoptions.md) object was created using a [CommonFolderQuery](commonfolderquery.md). For example, if [CommonFolderQuery.GroupByYear](commonfolderquery.md) is used to create a [QueryOptions](queryoptions.md) object, the value of this property is [System.ItemDate](/windows/desktop/properties/props-system-itemdate).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.grouppropertyname
     * @type {HSTRING} 
     */
    GroupPropertyName {
        get => this.get_GroupPropertyName()
    }

    /**
     * Gets the unit of time used to group files into folders if the [QueryOptions](queryoptions.md) object was created with a [CommonFolderQuery](commonfolderquery.md) based on date. For example, if [CommonFolderQuery.GroupByYear](commonfolderquery.md) is used to create a [QueryOptions](queryoptions.md) object, the value of this property is [DateStackOption.Year](datestackoption.md).
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.datestackoption
     * @type {Integer} 
     */
    DateStackOption {
        get => this.get_DateStackOption()
    }

    /**
     * Gets the filter for storage provider identifiers.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.storageprovideridfilter
     * @type {IVector<HSTRING>} 
     */
    StorageProviderIdFilter {
        get => this.get_StorageProviderIdFilter()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [QueryOptions](queryoptions.md) class for enumerating storage items, and initializes it with the following default settings: [QueryOptions.FolderDepth](queryoptions_folderdepth.md) gets [FolderDepth.Shallow](folderdepth.md) and [QueryOptions.IndexerOption](queryoptions_indexeroption.md) gets [IndexerOption.DoNotUseIndexer](indexeroption.md).
     * 
     * A [QueryOptions](queryoptions.md) object with the preceding options will provide shallow, folder-by-folder enumeration of the files and folders in a location. By default, folders are enumerated before files and both files and folders are alphabetized by name.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Storage.Search.QueryOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_FileTypeFilter() {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.get_FileTypeFilter()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FolderDepth() {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.get_FolderDepth()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FolderDepth(value) {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.put_FolderDepth(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ApplicationSearchFilter() {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.get_ApplicationSearchFilter()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ApplicationSearchFilter(value) {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.put_ApplicationSearchFilter(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserSearchFilter() {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.get_UserSearchFilter()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UserSearchFilter(value) {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.put_UserSearchFilter(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.get_Language()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.put_Language(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IndexerOption() {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.get_IndexerOption()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IndexerOption(value) {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.put_IndexerOption(value)
    }

    /**
     * 
     * @returns {IVector<SortEntry>} 
     */
    get_SortOrder() {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.get_SortOrder()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GroupPropertyName() {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.get_GroupPropertyName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DateStackOption() {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.get_DateStackOption()
    }

    /**
     * Converts the values of a [QueryOptions](queryoptions.md) object to a string that can be used to initialize the values of a [QueryOptions](queryoptions.md) object by calling [LoadFromString](queryoptions_loadfromstring_1308493691.md).
     * @remarks
     * Use this method if you want to save the query options for later use. For example if you generate query options dynamically based on user input and you want to preserve these options when your app is suspended. In this case, you should also use the [FutureAccessList](../windows.storage.accesscache/storageapplicationpermissions_futureaccesslist.md) to persist access to the folder(s) where the query was created.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.savetostring
     */
    SaveToString() {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.SaveToString()
    }

    /**
     * Initializes the current instance of the [QueryOptions](queryoptions.md) class with search parameters specified by a string that was created by the [SaveToString](queryoptions_savetostring_387853820.md) method.
     * @param {HSTRING} value A string retrieved by a previous call to [SaveToString](queryoptions_savetostring_387853820.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.loadfromstring
     */
    LoadFromString(value) {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.LoadFromString(value)
    }

    /**
     * Specifies the type and size of thumbnails that the system should start loading immediately when items are accessed (instead of retrieving them on a case-by-case basis). This uses more resources but makes thumbnail retrieval on query results faster.
     * @param {Integer} mode_ The enumeration value that describes the purpose of the thumbnail and determines how the thumbnail image is adjusted.
     * 
     * For guidance about choosing the best thumbnail mode, see [Guidelines and checklist for thumbnails](/windows/uwp/files/index).
     * @param {Integer} requestedSize The requested size, in pixels, of the longest edge of the thumbnail. Windows uses the *requestedSize* as a guide and tries to return a thumbnail image that can be scaled to the requested size without reducing the quality of the image.
     * 
     * If Windows can't find a thumbnail image that exactly meets the requested size, a larger thumbnail might be returned. If no larger thumbnail is available, a thumbnail image that is smaller than the requested size might be returned.
     * @param {Integer} options The enum value that describes the desired behavior to use to retrieve the thumbnail image. The specified behavior might affect the size and/or quality of the image and how quickly the thumbnail image is retrieved.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.setthumbnailprefetch
     */
    SetThumbnailPrefetch(mode_, requestedSize, options) {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.SetThumbnailPrefetch(mode_, requestedSize, options)
    }

    /**
     * Specifies properties that the system should load in advance for all items in the query result set while the query is being executed (instead of retrieving them on a case-by-case basis). If many properties are specified, the query might take longer to execute, but subsequent property retrieval on query results will be faster.
     * @param {Integer} options A value that specifies the set of properties to retrieve in advance.
     * 
     * The possible property sets match the sets of properties available on from the [StorageFile](../windows.storage/storagefile.md) class. For example, [PropertyPrefetchOptions.BasicProperties](../windows.storage.fileproperties/propertyprefetchoptions.md) will retrieve all of the properties available through [StorageFile.GetBasicPropertiesAsync](../windows.storage/storagefile_getbasicpropertiesasync_375277280.md) in advance.
     * @param {IIterable<HSTRING>} propertiesToRetrieve A custom list of properties to retrieve in advance as an array of property names. Use the system property names to specify properties, for example [System.Copyright](/windows/desktop/properties/props-system-copyright) and [System.Image.ColorSpace](/windows/desktop/properties/props-system-image-colorspace).
     * 
     * A list of additional properties to retrieve.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.queryoptions.setpropertyprefetch
     */
    SetPropertyPrefetch(options, propertiesToRetrieve) {
        if (!this.HasProp("__IQueryOptions")) {
            if ((queryResult := this.QueryInterface(IQueryOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptions := IQueryOptions(outPtr)
        }

        return this.__IQueryOptions.SetPropertyPrefetch(options, propertiesToRetrieve)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_StorageProviderIdFilter() {
        if (!this.HasProp("__IQueryOptionsWithProviderFilter")) {
            if ((queryResult := this.QueryInterface(IQueryOptionsWithProviderFilter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQueryOptionsWithProviderFilter := IQueryOptionsWithProviderFilter(outPtr)
        }

        return this.__IQueryOptionsWithProviderFilter.get_StorageProviderIdFilter()
    }

;@endregion Instance Methods
}
