#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageFileQueryResult.ahk
#Include .\IStorageQueryResultBase.ahk
#Include .\IStorageFileQueryResult2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to the results of a query of the files in the location that is represented by a [StorageFolder](../windows.storage/storagefolder.md) object. You can use StorageFileQueryResult to enumerate the files in that [StorageFolder](../windows.storage/storagefolder.md) location.
 * @remarks
 * > [!NOTE]
 * > Although it's not attributed with `marshalling_behavior(agile)`, this class can be treated as agile.
 * <!--W8B 988884 v2-->
 * 
 * You can get a StorageFileQueryResult object by calling the following methods from a [StorageFolder](../windows.storage/storagefolder.md) or a [FolderInformation](../windows.storage.bulkaccess/folderinformation.md) object:
 * 
 * + [StorageFolder.CreateFileQuery methods](istoragefolderqueryoperations_createfilequery_1641434999.md)
 * + [StorageFolder.CreateFileQueryWithOptions method](../windows.storage/storagefolder_createfilequerywithoptions_2038131323.md)
 * + [FolderInformation.CreateFileQuery methods](../windows.storage.bulkaccess/folderinformation_createfilequery_1641434999.md)
 * + [FolderInformation.CreateFileQueryWithOptions](../windows.storage.bulkaccess/folderinformation_createfilequerywithoptions_2038131323.md)
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefilequeryresult
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class StorageFileQueryResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageFileQueryResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageFileQueryResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the folder that was queried to create the [StorageFileQueryResult](storagefilequeryresult.md) object. This folder represents the scope of the query.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefilequeryresult.folder
     * @type {StorageFolder} 
     */
    Folder {
        get => this.get_Folder()
    }

    /**
     * Fires when a file is added to, deleted from, or modified in the folder being queried. This event only fires after [GetFilesAsync](storagefilequeryresult_getfilesasync_1261374131.md) has been called at least once.
     * @remarks
     * If you register a handler for this event, keep that handler registered while you suspend your app (in response to [oncheckpoint](/previous-versions/windows/apps/br229839(v=win.10)) or [Suspending](../windows.ui.xaml/application_suspending.md)). Your app will not receive ContentsChanged events while it is suspended and when your app resumes it will receive a single event that aggregates all of the changes if any occurred.
     * 
     * Additionally, keep in mind that registering and removing event handlers are synchronous operations and might cause your app to stop responding briefly if you execute them on your app's UI thread. Wherever possible, use a thread other than your app's UI thread to register and unregister these event handlers.
     * @type {TypedEventHandler<IStorageQueryResultBase, IInspectable>}
    */
    OnContentsChanged {
        get {
            if(!this.HasProp("__OnContentsChanged")){
                this.__OnContentsChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4ba22861-00c4-597f-b6bf-3af516f3b870}"),
                    IStorageQueryResultBase,
                    IInspectable
                )
                this.__OnContentsChangedToken := this.add_ContentsChanged(this.__OnContentsChanged.iface)
            }
            return this.__OnContentsChanged
        }
    }

    /**
     * Fires when the query options change.
     * @type {TypedEventHandler<IStorageQueryResultBase, IInspectable>}
    */
    OnOptionsChanged {
        get {
            if(!this.HasProp("__OnOptionsChanged")){
                this.__OnOptionsChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4ba22861-00c4-597f-b6bf-3af516f3b870}"),
                    IStorageQueryResultBase,
                    IInspectable
                )
                this.__OnOptionsChangedToken := this.add_OptionsChanged(this.__OnOptionsChanged.iface)
            }
            return this.__OnOptionsChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnContentsChangedToken")) {
            this.remove_ContentsChanged(this.__OnContentsChangedToken)
            this.__OnContentsChanged.iface.Dispose()
        }

        if(this.HasProp("__OnOptionsChangedToken")) {
            this.remove_OptionsChanged(this.__OnOptionsChangedToken)
            this.__OnOptionsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Retrieves a list of all the files in the query result set.
     * @param {Integer} startIndex 
     * @param {Integer} maxNumberOfItems 
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefilequeryresult.getfilesasync
     */
    GetFilesAsync(startIndex, maxNumberOfItems) {
        if (!this.HasProp("__IStorageFileQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageFileQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFileQueryResult := IStorageFileQueryResult(outPtr)
        }

        return this.__IStorageFileQueryResult.GetFilesAsync(startIndex, maxNumberOfItems)
    }

    /**
     * Retrieves a list of all the files in the query result set.
     * @returns {IAsyncOperation<IVectorView<StorageFile>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefilequeryresult.getfilesasync
     */
    GetFilesAsyncDefaultStartAndCount() {
        if (!this.HasProp("__IStorageFileQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageFileQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFileQueryResult := IStorageFileQueryResult(outPtr)
        }

        return this.__IStorageFileQueryResult.GetFilesAsyncDefaultStartAndCount()
    }

    /**
     * Retrieves the number of files in the set of query results.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefilequeryresult.getitemcountasync
     */
    GetItemCountAsync() {
        if (!this.HasProp("__IStorageQueryResultBase")) {
            if ((queryResult := this.QueryInterface(IStorageQueryResultBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageQueryResultBase := IStorageQueryResultBase(outPtr)
        }

        return this.__IStorageQueryResultBase.GetItemCountAsync()
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_Folder() {
        if (!this.HasProp("__IStorageQueryResultBase")) {
            if ((queryResult := this.QueryInterface(IStorageQueryResultBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageQueryResultBase := IStorageQueryResultBase(outPtr)
        }

        return this.__IStorageQueryResultBase.get_Folder()
    }

    /**
     * 
     * @param {TypedEventHandler<IStorageQueryResultBase, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContentsChanged(handler) {
        if (!this.HasProp("__IStorageQueryResultBase")) {
            if ((queryResult := this.QueryInterface(IStorageQueryResultBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageQueryResultBase := IStorageQueryResultBase(outPtr)
        }

        return this.__IStorageQueryResultBase.add_ContentsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_ContentsChanged(eventCookie) {
        if (!this.HasProp("__IStorageQueryResultBase")) {
            if ((queryResult := this.QueryInterface(IStorageQueryResultBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageQueryResultBase := IStorageQueryResultBase(outPtr)
        }

        return this.__IStorageQueryResultBase.remove_ContentsChanged(eventCookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IStorageQueryResultBase, IInspectable>} changedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_OptionsChanged(changedHandler) {
        if (!this.HasProp("__IStorageQueryResultBase")) {
            if ((queryResult := this.QueryInterface(IStorageQueryResultBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageQueryResultBase := IStorageQueryResultBase(outPtr)
        }

        return this.__IStorageQueryResultBase.add_OptionsChanged(changedHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_OptionsChanged(eventCookie) {
        if (!this.HasProp("__IStorageQueryResultBase")) {
            if ((queryResult := this.QueryInterface(IStorageQueryResultBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageQueryResultBase := IStorageQueryResultBase(outPtr)
        }

        return this.__IStorageQueryResultBase.remove_OptionsChanged(eventCookie)
    }

    /**
     * Retrieves the index of the file from the query results that most closely matches the specified property value (or file, if used with [FileActivatedEventArgs.NeighboringFilesQuery](../windows.applicationmodel.activation/fileactivatedeventargs_neighboringfilesquery.md)). The property that is matched is determined by the first [SortEntry](sortentry.md) of the [QueryOptions.SortOrder](queryoptions_sortorder.md) list.
     * @remarks
     * You can use this method in conjunction with [FileActivatedEventArgs.NeighboringFilesQuery](../windows.applicationmodel.activation/fileactivatedeventargs_neighboringfilesquery.md) to iterate between neighboring files while preserving the original view's sort order.
     * @param {IInspectable} value The property value to match when searching the query results. The property to that is used to match this value is the property in the first [SortEntry](sortentry.md) of the [QueryOptions.SortOrder](queryoptions_sortorder.md) list.
     * 
     * Or, the file to match when searching with [FileActivatedEventArgs.NeighboringFilesQuery](../windows.applicationmodel.activation/fileactivatedeventargs_neighboringfilesquery.md).
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefilequeryresult.findstartindexasync
     */
    FindStartIndexAsync(value) {
        if (!this.HasProp("__IStorageQueryResultBase")) {
            if ((queryResult := this.QueryInterface(IStorageQueryResultBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageQueryResultBase := IStorageQueryResultBase(outPtr)
        }

        return this.__IStorageQueryResultBase.FindStartIndexAsync(value)
    }

    /**
     * Retrieves the query options used to determine query results.
     * @returns {QueryOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefilequeryresult.getcurrentqueryoptions
     */
    GetCurrentQueryOptions() {
        if (!this.HasProp("__IStorageQueryResultBase")) {
            if ((queryResult := this.QueryInterface(IStorageQueryResultBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageQueryResultBase := IStorageQueryResultBase(outPtr)
        }

        return this.__IStorageQueryResultBase.GetCurrentQueryOptions()
    }

    /**
     * Modifies query results based on new [QueryOptions](queryoptions.md).
     * @remarks
     * This method causes the [OptionsChanged](storagefilequeryresult_optionschanged.md) event to fire.
     * 
     * When this method returns, subsequent calls to [GetFilesAsync](storagefilequeryresult_getfilesasync_1261374131.md) or [GetItemCountAsync](storagefilequeryresult_getitemcountasync_1115995255.md) will reflect the results of the new [QueryOptions](queryoptions.md).
     * @param {QueryOptions} newQueryOptions The new query options.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefilequeryresult.applynewqueryoptions
     */
    ApplyNewQueryOptions(newQueryOptions) {
        if (!this.HasProp("__IStorageQueryResultBase")) {
            if ((queryResult := this.QueryInterface(IStorageQueryResultBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageQueryResultBase := IStorageQueryResultBase(outPtr)
        }

        return this.__IStorageQueryResultBase.ApplyNewQueryOptions(newQueryOptions)
    }

    /**
     * Gets matching file properties with corresponding text ranges.
     * @remarks
     * Use this method to implement hit highlighting in your app's query results.
     * @param {StorageFile} file_ The file to query for properties.
     * @returns {IMap<HSTRING, IVectorView<TextSegment>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefilequeryresult.getmatchingpropertieswithranges
     */
    GetMatchingPropertiesWithRanges(file_) {
        if (!this.HasProp("__IStorageFileQueryResult2")) {
            if ((queryResult := this.QueryInterface(IStorageFileQueryResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFileQueryResult2 := IStorageFileQueryResult2(outPtr)
        }

        return this.__IStorageFileQueryResult2.GetMatchingPropertiesWithRanges(file_)
    }

;@endregion Instance Methods
}
