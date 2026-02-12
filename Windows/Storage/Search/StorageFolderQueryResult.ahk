#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageFolderQueryResult.ahk
#Include .\IStorageQueryResultBase.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to the results of a query that lists the folder (or file groups) in the folder being queried (which is represented by a [StorageFolder](../windows.storage/storagefolder.md)). You can use a StorageFolderQueryResult to enumerate folders or file groups in that folder.
 * @remarks
 * > [!NOTE]
 * > Although it's not attributed with `marshalling_behavior(agile)`, this class can be treated as agile. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * <!--W8B 988884 v2-->
 * 
 * You can get a StorageFolderQueryResult object by calling the following methods from a [StorageFolder](../windows.storage/storagefolder.md) or a [FolderInformation](../windows.storage.bulkaccess/folderinformation.md) object:
 * 
 * + [StorageFolder.CreateFolderQuery methods](../windows.storage/storagefolder_createfolderquery_325438332.md)
 * + [StorageFolder.CreateFolderQueryWithOptions method](../windows.storage/storagefolder_createfolderquerywithoptions_573382953.md)
 * + [FolderInformation.CreateFolderQuery methods](../windows.storage.bulkaccess/folderinformation_createfolderquery_325438332.md)
 * + [FolderInformation.CreateFolderQueryWithOptions method](../windows.storage.bulkaccess/folderinformation_createfolderquerywithoptions_573382953.md)
 * 
 * For more code examples that show you how to use storageFolderQueryResult objects, see the [Folder enumeration sample](https://github.com/microsoft/Windows-universal-samples/tree/main/Samples/FolderEnumeration).
 * 
 * To get a StorageFolderQueryResult object to enumerate the folders or file groups in a location, you must get a [storageFolder](../windows.storage/storagefolder.md) that represents the location and then create a folder query.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefolderqueryresult
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class StorageFolderQueryResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageFolderQueryResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageFolderQueryResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the folder originally used to create the [StorageFolderQueryResult](storagefolderqueryresult.md) object. This folder represents the scope of the query.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefolderqueryresult.folder
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
     * Retrieves a list of all the folders (or file groups) in the result set.
     * @param {Integer} startIndex 
     * @param {Integer} maxNumberOfItems 
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefolderqueryresult.getfoldersasync
     */
    GetFoldersAsync(startIndex, maxNumberOfItems) {
        if (!this.HasProp("__IStorageFolderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryResult := IStorageFolderQueryResult(outPtr)
        }

        return this.__IStorageFolderQueryResult.GetFoldersAsync(startIndex, maxNumberOfItems)
    }

    /**
     * Retrieves a list of all the folders (or file groups) in the result set.
     * @returns {IAsyncOperation<IVectorView<StorageFolder>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefolderqueryresult.getfoldersasync
     */
    GetFoldersAsyncDefaultStartAndCount() {
        if (!this.HasProp("__IStorageFolderQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageFolderQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageFolderQueryResult := IStorageFolderQueryResult(outPtr)
        }

        return this.__IStorageFolderQueryResult.GetFoldersAsyncDefaultStartAndCount()
    }

    /**
     * Retrieves the number of folders (or file groups) in the set of query results.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefolderqueryresult.getitemcountasync
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
     * Retrieves the index of the folder from the query results that most closely matches the specified property value. The property that is matched is determined by the first [SortEntry](sortentry.md) of the [QueryOptions.SortOrder](queryoptions_sortorder.md) list.
     * @param {IInspectable} value The property value to match when searching the query results. The property to that is used to match this value is the property in the first [SortEntry](sortentry.md) of the [QueryOptions.SortOrder](queryoptions_sortorder.md) list.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefolderqueryresult.findstartindexasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefolderqueryresult.getcurrentqueryoptions
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
     * When this method returns, subsequent calls to [GetFoldersAsync](storagefolderqueryresult_getfoldersasync_1487375516.md) or [GetItemCountAsync](storagefolderqueryresult_getitemcountasync_1115995255.md) will reflect the results of the new [QueryOptions](queryoptions.md).
     * @param {QueryOptions} newQueryOptions The new query options.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storagefolderqueryresult.applynewqueryoptions
     */
    ApplyNewQueryOptions(newQueryOptions) {
        if (!this.HasProp("__IStorageQueryResultBase")) {
            if ((queryResult := this.QueryInterface(IStorageQueryResultBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageQueryResultBase := IStorageQueryResultBase(outPtr)
        }

        return this.__IStorageQueryResultBase.ApplyNewQueryOptions(newQueryOptions)
    }

;@endregion Instance Methods
}
