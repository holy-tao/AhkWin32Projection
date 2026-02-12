#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorageItemQueryResult.ahk
#Include .\IStorageQueryResultBase.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to the results of a query that lists all items including files and folders (or file groups) in the folder being queried (which is represented by a [StorageFolder](../windows.storage/storagefolder.md)). You can use storageItemQueryResult to enumerate the files and folders in that [StorageFolder](../windows.storage/storagefolder.md).
 * @remarks
 * > [!NOTE]
 * > Although it's not attributed with `marshalling_behavior(agile)`, this class can be treated as agile. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * <!--W8B 988884 v2-->
 * 
 * You can get a storageItemQueryResult object by calling the following methods from a [StorageFolder](../windows.storage/storagefolder.md) or a [FolderInformation](../windows.storage.bulkaccess/folderinformation.md) object:
 * 
 * + [StorageFolder.CreateItemQuery](../windows.storage/storagefolder_createitemquery_543424716.md) methods
 * + [StorageFolder.CreateItemQueryWithOptions](../windows.storage/storagefolder_createitemquerywithoptions_1519361285.md) method
 * + [FolderInformation.CreateItemQuery](../windows.storage.bulkaccess/folderinformation_createitemquery_543424716.md) methods
 * + [FolderInformation.CreateItemQueryWithOptions](../windows.storage.bulkaccess/folderinformation_createitemquerywithoptions_1519361285.md) method
 * For related code examples, see [storageFileQueryResult](storagefilequeryresult.md), [storageFolderQueryResult](storagefolderqueryresult.md), the [Folder enumeration sample](https://github.com/microsoft/Windows-universal-samples/tree/main/Samples/FolderEnumeration), and the [File search sample](https://github.com/microsoft/Windows-universal-samples/tree/main/Samples/FileSearch).
 * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storageitemqueryresult
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class StorageItemQueryResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorageItemQueryResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorageItemQueryResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the folder originally used to create the [StorageItemQueryResult](storageitemqueryresult.md) object. This folder represents the scope of the query.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storageitemqueryresult.folder
     * @type {StorageFolder} 
     */
    Folder {
        get => this.get_Folder()
    }

    /**
     * Fires when an item is added to, deleted from, or modified in the folder being queried. This event only fires after [GetItemsAsync](storageitemqueryresult_getitemsasync_1518547059.md) has been called at least once.
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
     * Retrieves a list of all the items (files and folders) in the query results set.
     * @param {Integer} startIndex 
     * @param {Integer} maxNumberOfItems 
     * @returns {IAsyncOperation<IVectorView<IStorageItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storageitemqueryresult.getitemsasync
     */
    GetItemsAsync(startIndex, maxNumberOfItems) {
        if (!this.HasProp("__IStorageItemQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageItemQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemQueryResult := IStorageItemQueryResult(outPtr)
        }

        return this.__IStorageItemQueryResult.GetItemsAsync(startIndex, maxNumberOfItems)
    }

    /**
     * Retrieves a list of all the items (files and folders) in the query results set.
     * @returns {IAsyncOperation<IVectorView<IStorageItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storageitemqueryresult.getitemsasync
     */
    GetItemsAsyncDefaultStartAndCount() {
        if (!this.HasProp("__IStorageItemQueryResult")) {
            if ((queryResult := this.QueryInterface(IStorageItemQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorageItemQueryResult := IStorageItemQueryResult(outPtr)
        }

        return this.__IStorageItemQueryResult.GetItemsAsyncDefaultStartAndCount()
    }

    /**
     * Retrieves the number of items in the set of query results.
     * @remarks
     * This method throws an exception when the library definition targeted by the query is empty.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storageitemqueryresult.getitemcountasync
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
     * Retrieves the index of the item from the query results that most closely matches the specified property value. The property that is matched is determined by the first [SortEntry](sortentry.md) of the [QueryOptions.SortOrder](queryoptions_sortorder.md) list.
     * @param {IInspectable} value The property value to match when searching the query results. The property to that is used to match this value is the property in the first [SortEntry](sortentry.md) of the [QueryOptions.SortOrder](queryoptions_sortorder.md) list.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storageitemqueryresult.findstartindexasync
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
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storageitemqueryresult.getcurrentqueryoptions
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
     * When this method returns, subsequent calls to [GetItemsAsync](storageitemqueryresult_getitemsasync_1518547059.md) or [GetItemCountAsync](storagefolderqueryresult_getitemcountasync_1115995255.md) will reflect the results of the new [QueryOptions](queryoptions.md).
     * @param {QueryOptions} newQueryOptions The new query options.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.search.storageitemqueryresult.applynewqueryoptions
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
